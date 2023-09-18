import 'dart:core';

import 'package:flutter/material.dart';
import 'package:todo/models/task/task_model.dart';

class TaskProvider extends ChangeNotifier {
  final tasks = <Task>[];

  // create task
  void createTask({
    required String name,
    required String description,
    TaskCategory? category,
  }) {
    final newTask = Task(
      _getTheTaskId(),
      name,
      description,
      TaskState.waiting,
      category ?? TaskCategory.home,
      DateTime.now(),
      DateTime.now(),
    );

    tasks.add(newTask);
  }

  // get the right id for the new added task
  int _getTheTaskId() {
    var lastId = 0;

    // get the biggest int -id- from tasks
    for (final task in tasks) {
      if (task.id > lastId) {
        lastId = task.id;
      }
    }

    // return a number bigget than the current biggest Id
    return lastId++;
  }

  // sort tasks
  void sortByDateCreated(bool isAccending) {
    late Task currentTask;
    int i, j;

    for (i = 1; i < tasks.length; i++) {
      currentTask = tasks[i];
      j = i - 1;

      // keep swiping the tasks while the [_returnAccoridingToSortType]
      // returning true
      while (j >= 0 &&
          _returnAccoridingToSortType(
              currentTask.createdAt, tasks[j].createdAt, isAccending)) {
        tasks[i] = tasks[j];
        j--;
      }
      tasks[j] = currentTask;
    }
  }

  /// used to decide wheather to swap tasks or not according [isAccending]
  bool _returnAccoridingToSortType(
      DateTime current, DateTime previous, bool isAccending) {
    if (isAccending) {
      return current.isAfter(previous);
    } else {
      return current.isBefore(previous);
    }
  }

  // delete task
  void deleteTask(int id) {
    tasks.removeWhere((task) => task.id == id);
  }
}
