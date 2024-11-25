import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class IntConverter extends JsonConverter<int, dynamic> {
  @override
  int fromJson(json) {
    if (json is int) {
      return json;
    }
    if (json is String) {
      return int.parse(json);
    }
    return -1;
  }

  @override
  toJson(int object) {
    return object;
  }

  const IntConverter();
}

class StringConverter extends JsonConverter<String, dynamic> {
  @override
  String fromJson(json) {
    if (json != null) {
      return json.toString();
    }
    return '';
  }

  @override
  toJson(String object) {
    return object;
  }

  const StringConverter();
}

class NumConverter extends JsonConverter<num, dynamic> {
  @override
  num fromJson(json) {
    if (json is num) {
      return json;
    }
    if (json is String) {
      return num.tryParse(json) ?? 0;
    }
    if (json == null) {
      return 0;
    }
    return -1;
  }

  @override
  toJson(num object) {
    return object;
  }

  const NumConverter();
}

class DateTimeConverter extends JsonConverter<DateTime, dynamic> {
  @override
  DateTime fromJson(json) {
    if (json != null && json is String && json.isNotEmpty) {
      DateTime dateTime = DateTime.parse(json);
      return dateTime;
    }
    if (json is num) {
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch((json).toInt());
      return dateTime;
    }
    return DateTime.now();
  }

  @override
  toJson(DateTime object) {
    return object;
  }

  const DateTimeConverter();
}

class DateNullableConverter extends JsonConverter<DateTime?, dynamic> {
  @override
  DateTime? fromJson(json) {
    if (json != null && json is String && json.isNotEmpty) {
      DateTime dateTime = DateTime.parse(json);
      return dateTime;
    }
    if (json is num) {
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch((json).toInt());
      return dateTime;
    }
    return null;
  }

  @override
  toJson(DateTime? object) {
    return object;
  }

  const DateNullableConverter();
}
