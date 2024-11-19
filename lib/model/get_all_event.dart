class Event {
  final int? eventId;
  final String? eventName;
  final String? eventDesc;
  final String? tags;
  final String? address;
  final double? latitude;
  final double? longitude;
  final int? eventType;
  final int? ticket;
  final int? categoryId;
  final int? quantity;
  final String? eventPrice;
  final String? features;
  final bool? eventStatus;

  Event({
    this.eventId,
    this.eventName,
    this.eventDesc,
    this.tags,
    this.address,
    this.latitude,
    this.longitude,
    this.eventType,
    this.ticket,
    this.categoryId,
    this.quantity,
    this.eventPrice,
    this.features,
    this.eventStatus,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      eventId: json['event_id'] as int?,
      eventName: json['event_name'] as String?,
      eventDesc: json['event_desc'] as String?,
      tags: json['tags'] as String?,
      address: json['address'] as String?,
      latitude: json['latitude'] as double?,
      longitude: json['longitude'] as double?,
      eventType: json['event_type'] as int?,
      ticket: json['ticket'] as int?,
      categoryId: json['category_id'] as int?,
      quantity: json['quantity'] as int?,
      eventPrice: json['event_price'] as String?,
      features: json['features'] as String?,
      eventStatus: json['event_status'] as bool?,
    );
  }
}
