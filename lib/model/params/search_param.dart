class SearchParam {
  String? eventName;
  num? minPrice;
  num? maxPrice;
  int? categoryId;
  int? eventType;
  DateTime? startDate;
  DateTime? endDate;
  String? tags;
  String? address;
  int? status;

  SearchParam({
    this.eventName,
    this.minPrice,
    this.maxPrice,
    this.categoryId,
    this.eventType,
    this.startDate,
    this.endDate,
    this.tags,
    this.address,
    this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      if (eventName != null) 'eventName': this.eventName,
      if (minPrice != null) 'minPrice': this.minPrice.toString(),
      if (maxPrice != null) 'maxPrice': this.maxPrice.toString(),
      if (categoryId != null) 'categoryId': this.categoryId.toString(),
      if (eventType != null) 'eventType': this.eventType.toString(),
      if (startDate != null) 'startDate': this.startDate?.toIso8601String(),
      if (endDate != null) 'endDate': this.endDate?.toIso8601String(),
      if (tags != null) 'tags': this.tags.toString(),
      if (address != null) 'address': this.address,
      if (status != null) 'status': this.status.toString(),
    };
  }
}
