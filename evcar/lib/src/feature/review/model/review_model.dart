class Review {
  final String id;
  final String userId;
  final String vendorId;
  final double rating;
  final String comment;

  Review({
    required this.id,
    required this.userId,
    required this.vendorId,
    required this.rating,
    required this.comment,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['_id'],
      userId: json['userId']['username'] ?? "",
      vendorId: json['vendorId'] ?? "",
      rating: (json['rating'] ?? 0).toDouble(),
      comment: json['comment'] ?? "",
    );
  }
}
