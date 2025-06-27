import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ideas_and_concepts_profile/core/constants/firebase_constants.dart';
import 'package:ideas_and_concepts_profile/data/models/user_model.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();

  final user = Rx<UserModel?>(null);
  final isLoading = false.obs;

  // For Edit Profile Screen
  late TextEditingController nameController;
  final gender = 'Female'.obs;
  late TextEditingController dobController;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    dobController = TextEditingController();
    fetchUser(FirebaseConstants.testUserId);
  }

  Future<void> fetchUser(String userId) async {
    try {
      isLoading.value = true;
      final doc = await _firestore
          .collection(FirebaseConstants.usersCollection)
          .doc(userId)
          .get();
      if (doc.exists) {
        user.value = UserModel.fromSnapshot(doc);
        // Initialize text controller for edit screen
        nameController.text = user.value!.name;
        gender.value = user.value!.gender;
        dobController.text = user.value!.dob;
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch user data: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> pickAndUploadImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    try {
      isLoading.value = true;
      final ref = _storage.ref('profile_pictures/${user.value!.id}');
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();

      // Update Firestore with new image URL
      await _firestore
          .collection(FirebaseConstants.usersCollection)
          .doc(user.value!.id)
          .update({'profileImageUrl': url});

      // Update local user model
      user.value!.profileImageUrl = url;
      user.refresh(); // Important to notify listeners of the change
      Get.snackbar('Success', 'Profile picture updated!');
    } catch (e) {
      Get.snackbar('Error', 'Failed to upload image: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateProfile() async {
    if (user.value == null) return;
    try {
      isLoading.value = true;
      await _firestore
          .collection(FirebaseConstants.usersCollection)
          .doc(user.value!.id)
          .update({
            'name': nameController.text,
            'gender': gender.value,
            'dob': dobController.text,
          });
      // Re-fetch data to ensure UI consistency
      await fetchUser(user.value!.id);
      Get.back(); // Go back to profile screen
      Get.snackbar('Success', 'Profile updated successfully!');
    } catch (e) {
      Get.snackbar('Error', 'Failed to update profile: $e');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    dobController.dispose();
    super.onClose();
  }

  Future<void> selectDateOfBirth(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      dobController.text = "${pickedDate.toLocal()}".split(' ')[0];
    }
  }
}
