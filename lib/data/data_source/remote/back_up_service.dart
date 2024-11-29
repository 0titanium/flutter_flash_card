import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BackUpService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> backupToFirestore(String userId) async {
    final currentUser = _auth.currentUser;
    if (currentUser == null || currentUser.uid != userId) {
      debugPrint('$currentUser?.uid.toString() from back up service');
      debugPrint('Authentication error: User not logged in or userId mismatch');
      return false;
    }

    try {
      final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();

      final String? folderJson = await asyncPrefs.getString('root_folder');

      if (folderJson == null) {
        debugPrint('No data found in SharedPreferences');
        return false;
      }

      final userDocRef = _firestore.collection('backups').doc(userId);

      final timestamp = DateTime.now().toIso8601String();

      final backupData = {
        'timestamp': timestamp,
        'root_folder': folderJson,
      };

      await userDocRef.collection('backups').doc(timestamp).set(backupData);

      debugPrint('Backup completed successfully');
      return true;
    } catch (e) {
      debugPrint('Error during backup: $e');
      return false;
    }
  }

  Future<List<String>> getBackupsList(String userId) async {
    try {
      final backupsSnapshot = await _firestore
          .collection('backups')
          .doc(userId)
          .collection('backups')
          .orderBy('timestamp', descending: true)
          .get();

      return backupsSnapshot.docs.map((doc) => doc.id).toList();
    } catch (e) {
      debugPrint('Error getting backups list: $e');
      return [];
    }
  }

  Future<bool> deleteBackups(String userId) async {
    try {
      final currentUser = _auth.currentUser;

      if (currentUser == null || currentUser.uid != userId) {
        debugPrint(
            'Authentication error: User not logged in or userId mismatch');
        return false;
      }

      final backupsSnapshot = await _firestore
          .collection('backups')
          .doc(userId)
          .collection('backups')
          .get();

      final batch = _firestore.batch();

      for (final doc in backupsSnapshot.docs) {
        batch.delete(doc.reference);
      }
      await batch.commit();

      await _firestore.collection('backups').doc(userId).delete();

      debugPrint('All backups deleted successfully');

      return true;
    } catch (e) {
      debugPrint('Error deleting all backups: $e');

      return false;
    }
  }
}
