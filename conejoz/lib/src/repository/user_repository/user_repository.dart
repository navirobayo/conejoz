import 'package:conejoz/src/features/authentication/models/rabbit_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> createRabbit(
      String username, Map<String, dynamic> rabbitDocument) async {
    await _db.collection("rabbits").doc(username).set(rabbitDocument).then((_) {
      Get.snackbar("Success", "You are a rabbit now",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green);
    }).catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong. Try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });
  }

  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection("rabbits").where("Email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

// This is a function that should help with the validation of the username. Not working yet.
  Future<UserModel?> getUserDetailsByUsername(String username) async {
    try {
      final snapshot = await _db
          .collection("rabbits")
          .where("rabbitname", isEqualTo: username)
          .limit(1)
          .get();

      if (snapshot.docs.isEmpty) {
        return null; // Username does not exist
      }

      final userData = snapshot.docs.first;
      return UserModel.fromSnapshot(userData);
    } catch (error) {
      print("Error getting user details by username: $error");
      return null;
    }
  }

  Future<List<UserModel>> allUser() async {
    final snapshot = await _db.collection("rabbits").get();
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  /*Future<void> updateUserRecord(UserModel user) async {
    await _db.collection("rabbits");
  }*/
}