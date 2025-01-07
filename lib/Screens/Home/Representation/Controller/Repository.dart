import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tampo_admin_app/Models/feedback_model.dart';
import 'package:tampo_admin_app/Models/notes_model.dart';
import 'package:tampo_admin_app/Models/project_model.dart';
import 'package:tampo_admin_app/Models/report_model.dart';
import 'package:tampo_admin_app/Models/task_model.dart';
import 'package:tampo_admin_app/Models/user_model.dart';
part 'Repository.g.dart';

@riverpod
Repository repository(ref) {
  return Repository();
}

class Repository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<UserModel>> fetchUsers() async {
    try {
      final querySnapshot = await _firestore.collection('users').get();

      final List<UserModel> users = querySnapshot.docs.map((doc) {
        return UserModel.fromMap(doc.data());
      }).toList();

      return users;
    } catch (e) {
      print("Error fetching users: $e");
      rethrow;
    }
  }
   Future<List<Project>> fetchProjects() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('projects').get();
    return snapshot.docs
        .map((doc) => Project.fromMap(doc.data()))
        .toList();
  }
  Future<List<TaskModel>> fetchAllTasks() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('tasks') 
        .get();

    return querySnapshot.docs
        .map((doc) => TaskModel.fromMap(doc.data()))
        .toList();
  }
   Future<Project> getProjectById(String projectId) async {
    final doc = await _firestore.collection('projects').doc(projectId).get();
    if (doc.exists) {
      return Project.fromMap(doc.data()!);
    } else {
      throw Exception('Project not found');
    }
  }
     Future<List<Note>> fetchAllNotes() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('notes').get();
    return snapshot.docs
        .map((doc) => Note.fromMap(doc.data()))
        .toList();
  }
      Future<List<ReportModel>> fetchAllReports() async {
    final snapshot = await _firestore.collection('reports').get();
    
    if (snapshot.docs.isEmpty) {
      return [];
    }

    return snapshot.docs.map((doc) {
      return ReportModel.fromMap(doc.data());
    }).toList();
  }
  Future<List<FeedbackModel>> fetchAllFeedbacks() async {
    final snapshot = await _firestore.collection('feedbacks').get();

    if (snapshot.docs.isEmpty) {
      return [];
    }
    return snapshot.docs.map((doc) {
      return FeedbackModel.fromMap(doc.data());
    }).toList();
  }
}
