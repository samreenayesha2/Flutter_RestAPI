import 'dart:convert';

class PostModel {
  final int userId;
  final int id;
  final String postTitle;
  final String postBody;
  PostModel({
    required this.userId,
    required this.id,
    required this.postTitle,
    required this.postBody,
  });

  PostModel copyWith({
    int? userId,
    int? id,
    String? postTitle,
    String? postBody,
  }) {
    return PostModel(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      postTitle: postTitle ?? this.postTitle,
      postBody: postBody ?? this.postBody,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'id': id,
      'postTitle': postTitle,
      'postBody': postBody,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      userId: map['userId'],
      id: map['id'],
      postTitle: map['title'],
      postBody: map['body'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PostModel(userId: $userId, id: $id, postTitle: $postTitle, postBody: $postBody)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PostModel &&
        other.userId == userId &&
        other.id == id &&
        other.postTitle == postTitle &&
        other.postBody == postBody;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        id.hashCode ^
        postTitle.hashCode ^
        postBody.hashCode;
  }
}
