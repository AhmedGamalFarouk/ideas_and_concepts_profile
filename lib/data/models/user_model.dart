import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  String profileImageUrl;
  final String mobile;
  final String dob;
  final String gender;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.profileImageUrl = '',
    required this.mobile,
    required this.dob,
    required this.gender,
  });

  factory UserModel.fromSnapshot(DocumentSnapshot snap) {
    var data = snap.data() as Map<String, dynamic>;
    return UserModel(
      id: snap.id,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      profileImageUrl: data['profileImageUrl'] ?? '',
      mobile: data['mobile'] ?? '',
      dob: data['dob'] ?? '',
      gender: data['gender'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'profileImageUrl': profileImageUrl,
    'mobile': mobile,
    'dob': dob,
    'gender': gender,
  };
}
