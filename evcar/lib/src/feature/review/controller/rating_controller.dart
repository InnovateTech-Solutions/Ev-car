import 'dart:convert';

import 'package:evcar/src/core/constants/api_key.dart';
import 'package:evcar/src/feature/review/model/review_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RatinggController extends GetxController {
  RxSet<String> reviewedPosts = <String>{}.obs;

  void toggleReviewed(String postId) {
    if (reviewedPosts.contains(postId)) {
    } else {
      reviewedPosts.add(postId);
    }
    StorageUtil.saveReview(reviewedPosts.toList());
  }

  bool isPostReviewed(String postId) {
    return reviewedPosts.contains(postId);
  }

  void loadReviewedPosts() async {
    List<String>? storedIds = await StorageUtil.getReview();
    if (storedIds != null) {
      reviewedPosts.addAll(storedIds);
    }
  }

  Future<List<Review>> fetchReviews(String id) async {
    final response = await http.get(Uri.parse("${ApiKey.fetchReviewById}$id"));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      if (data.containsKey("reviews")) {
        // Check for "allProducts" instead of "vendors"
        List<dynamic> productData = data["reviews"];
        List<Review> review =
            productData.map((item) => Review.fromJson(item)).toList();
        print(review.length);
        return review;
      } else {
        throw Exception('Invalid data format: missing "reviews" key');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }
}

class StorageUtil {
  static saveReview(List<String> postIds) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
        'reviewed_posts', postIds.map((id) => id.toString()).toList());
  }

  static Future<List<String>?> getReview() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? storedIds = prefs.getStringList('reviewed_posts');
    return storedIds?.map((id) => id).toList();
  }
}
