import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tampo_admin_app/Models/feedback_model.dart';
import 'package:tampo_admin_app/Models/notes_model.dart';
import 'package:tampo_admin_app/Models/project_model.dart';
import 'package:tampo_admin_app/Models/report_model.dart';
import 'package:tampo_admin_app/Models/task_model.dart';
import 'package:tampo_admin_app/Models/user_model.dart';
import 'package:tampo_admin_app/Screens/Home/Representation/Controller/Repository.dart';
part 'Provider.g.dart';

@riverpod
Future<List<UserModel>> fetchUsersFromRepo(FetchUsersFromRepoRef ref) async {
  final repository = ref.watch(repositoryProvider);
  return await repository.fetchUsers();
}

final fetchProjectsProvider = FutureProvider<List<Project>>((ref) async {
  final repository = ref.watch(repositoryProvider);
  return repository.fetchProjects();
});
final fetchProjectsNameProvider = FutureProvider.family<List<Project>, String>((ref,_) async {
  final repository = ref.watch(repositoryProvider);
  return repository.fetchProjectsByUid();  
});
final fetchUsersName = FutureProvider<List<UserModel>>((ref) async {
  final repository = ref.watch(repositoryProvider);
  return repository.fetchUsers();  
});

final fetchTasksProvider = FutureProvider<List<TaskModel>>((ref) async {
  final repository = ref.watch(repositoryProvider);
  return repository.fetchAllTasks();
});
final fetchProjectProvider =
    FutureProvider.family<Project, String>((ref, projectId) async {
  final projectRepository = ref.watch(repositoryProvider);
  return await projectRepository.getProjectById(projectId);
});
final fetchFeedbackProvider = FutureProvider<List<FeedbackModel>>((ref) async {
  final repository = ref.watch(repositoryProvider);
  return repository.fetchAllFeedbacks();
});
final fetchNotesProvider = FutureProvider<List<Note>>((ref) async {
  final repository = ref.watch(repositoryProvider);
  return repository.fetchAllNotes();
});
final fetchReportProvider = FutureProvider<List<ReportModel>>((ref) async {
  final reportService = ref.watch(repositoryProvider);
  return reportService.fetchAllReports();
});