class AllBookingParam {
  final int page;
  final int limit;

  AllBookingParam({required this.page, required this.limit});

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'limit': limit,
    };
  }
}
