import 'dart:convert';
import 'dart:developer';
import 'package:ez_booking/model/get_all_event.dart';
import 'package:http/http.dart' as http;

class EventService {
  static const String baseUrl = "https://ezbooking-node.onrender.com/v1/events/event?page=1&limit=10"; 

  Future<List<Event>> fetchEvents(String token) async {
    log('On event service page , token : ' + token.toString());
    try {
      log('Calling API with token...');
      
      final headers = {
        'Content-Type': 'application/json',
        'token':  token, 
      };

      final response = await http.get(
        Uri.parse(baseUrl),
        headers: headers, 
      );

      log('Response Status Code: ${response.statusCode}');
      log('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        log('Data: $data');

        final events = data['data'] as List;
        return events.map((event) => Event.fromJson(event)).toList();
      } else {
        log('API Error: ${response.statusCode}');
        throw Exception('Failed to load events with status code ${response.statusCode}');
      }
    } catch (e) {
      log('Exception occurred during API call: $e');
      log(e.toString());
      throw Exception('Failed to load events due to an error: $e');
    }
  }
}
