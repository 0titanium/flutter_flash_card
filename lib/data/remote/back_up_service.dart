import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BackUpService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> backupToFirestore(String userId) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final String? rootFolderJson = prefs.getString('root_folder');

      if (rootFolderJson == null) {
        debugPrint('No data found in SharedPreferences');
        return false;
      }

      final userDocRef = _firestore.collection('backups').doc(userId);

      final timestamp = DateTime.now().toIso8601String();

      final backupData = {
        'timestamp': timestamp,
        'root_folder': rootFolderJson,
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
}
