import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventTracker {
  static final EventTracker _instance = EventTracker._internal();
  static const String _storageKey = 'pending_events';
  final _eventQueue = StreamController<Map<String, dynamic>>.broadcast();
  final _processingQueue = <Map<String, dynamic>>[];
  bool _isProcessing = false;

  factory EventTracker() => _instance;

  EventTracker._internal() {
    _initializeListener();
    _retryFailedEvents();
  }

  void _initializeListener() {
    _eventQueue.stream.listen((event) async {
      await _processEvent(event);
    });
  }

  Future<void> trackEvent(Map<String, dynamic> event) async {
    // final event = Event(name: name, properties: properties);
    _eventQueue.add(event);
  }

  Future<void> _processEvent(Map<String, dynamic> event) async {
    _processingQueue.add(event);
    if (!_isProcessing) {
      await _processQueue();
    }
  }

  Future<void> _processQueue() async {
    if (_isProcessing) return;
    _isProcessing = true;

    while (_processingQueue.isNotEmpty) {
      final event = _processingQueue.first;
      try {
        await _sendToAnalytics(event);
        _processingQueue.removeAt(0);
      } catch (e) {
        await _persistEvent(event);
        _processingQueue.removeAt(0);
      }
    }

    _isProcessing = false;
  }

  Future<void> _sendToAnalytics(Map<String, dynamic> event) async {
    /*try {
      final response = await http.post(
        Uri.parse('YOUR_ANALYTICS_ENDPOINT'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(event.toJson()),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to send event');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }*/
  }

  Future<void> _persistEvent(Map<String, dynamic> event) async {
    final prefs = await SharedPreferences.getInstance();
    final events = await _getPersistedEvents();
    events.add(event);

    await prefs.setString(
      _storageKey,
      jsonEncode(events),
    );
  }

  Future<List<Map<String, dynamic>>> _getPersistedEvents() async {
    final prefs = await SharedPreferences.getInstance();
    final eventsJson = prefs.getString(_storageKey);
    if (eventsJson == null) return [];

    try {
      final List<dynamic> decoded = jsonDecode(eventsJson);
      return decoded.map((e) => e as Map<String, dynamic>).toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> _retryFailedEvents() async {
    Timer.periodic(const Duration(minutes: 5), (timer) async {
      final events = await _getPersistedEvents();
      if (events.isEmpty) return;

      for (final event in events) {
        try {
          await _sendToAnalytics(event);
        } catch (e) {
          return;
        }
      }

      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_storageKey);
    });
  }

  void dispose() {
    _eventQueue.close();
  }
}

class AnalyticsRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  final EventTracker _tracker = EventTracker();

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (route is PageRoute) {
      _tracker.trackEvent({
        'route': route.settings.name,
        'previousRoute': previousRoute?.settings.name,
      });
    }
  }
}
