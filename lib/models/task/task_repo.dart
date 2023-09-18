import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/task/task_model.dart';
import 'package:todo/services/api_services.dart';
import 'package:todo/services/database_services.dart';

class TaskRepo {
  // listen to user tasks changes
  List<Task> _tasksFromSnapshots(
      QuerySnapshot<Map<String, dynamic>> snapshots) {
    final tasks = <Task>[];

    for (var doc in snapshots.docs) {
      tasks.add(
        Task(
          doc['id'],
          doc['name'],
          doc['description'],
          doc['state'],
          doc['category'],
          doc['createdAt'],
          doc['editedAt'],
        ),
      );
    }

    return tasks;
  }

  Stream<List<Task>> getTasks(String uid) {
    final db = DataBaseServiecs(collectionPath: "tasks/$uid");
    return db.getDateStream().map(_tasksFromSnapshots);
  }

  // create task
  Future<ApiResponse> createTask(
      String uid, Map<String, dynamic> taskData) async {
    try {
      final db = DataBaseServiecs(
        collectionPath: "tasks/$uid/${taskData["id"]}",
      );
      await db.write(taskData);
      return ApiResponse.completed(null);
    } catch (e) {
      debugPrint("$e");
      return ApiResponse.error(e.toString());
    }
  }

  // update task
  Future<ApiResponse> updateTask(
      String uid, Map<String, dynamic> taskData) async {
    try {
      final db = DataBaseServiecs(collectionPath: "tasks/$uid");
      await db.update(taskData);
      return ApiResponse.completed(null);
    } catch (e) {
      debugPrint("$e");
      return ApiResponse.error(e.toString());
    }
  }

  // delete task
  Future<ApiResponse> deleteTask(
      String uid, Map<String, dynamic> taskData) async {
    try {
      final db = DataBaseServiecs(collectionPath: "tasks/$uid");
      await db.delete();
      return ApiResponse.completed(null);
    } catch (e) {
      debugPrint("$e");
      return ApiResponse.error(e.toString());
    }
  }
}
