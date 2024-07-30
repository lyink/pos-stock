import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Method to add a new user
  Future<void> addUser(String userId, Map<String, dynamic> userData) async {
    try {
      await _db.collection('users').doc(userId).set(userData);
      print('User added successfully');
    } catch (e) {
      print('Error adding user: $e');
    }
  }

  // Method to get user data
  Future<DocumentSnapshot> getUser(String userId) async {
    try {
      DocumentSnapshot doc = await _db.collection('users').doc(userId).get();
      return doc;
    } catch (e) {
      print('Error fetching user: $e');
      rethrow;
    }
  }

  // Method to update user data
  Future<void> updateUser(
      String userId, Map<String, dynamic> updatedData) async {
    try {
      await _db.collection('users').doc(userId).update(updatedData);
      print('User updated successfully');
    } catch (e) {
      print('Error updating user: $e');
    }
  }

  // Method to delete a user
  Future<void> deleteUser(String userId) async {
    try {
      await _db.collection('users').doc(userId).delete();
      print('User deleted successfully');
    } catch (e) {
      print('Error deleting user: $e');
    }
  }
}
