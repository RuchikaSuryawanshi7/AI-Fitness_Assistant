import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String? username;
  final String? email;
  final String? url;

  UserModel({
    this.id,
    this.username,
    this.email,
    this.url,
  });

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel(
      id: doc['id'],
      username: doc['username'],
      email: doc['email'],
      url: doc['url'],
    );
  }

  factory UserModel.fromMap(Map data) {
    return UserModel(
      id: data['uid'],
      email: data['email'] ?? '',
      username: data['name'] ?? '',
      url: data['photoUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() =>
      {"uid": id, "email": email, "name": username, "photoUrl": url};
}
