enum TaskState {
  waiting,
  onProcess,
  delayed,
  done,
}

enum TaskCategory {
  home,
  work,
  study,
}

class Task {
  final int id;
  final String name;
  final String description;
  final DateTime createdAt;

  TaskState state;
  TaskCategory category;
  DateTime editedAt;

  Task(
    this.id,
    this.name,
    this.description,
    this.state,
    this.category,
    this.createdAt,
    this.editedAt,
  );

  // change task state
  void changeState(TaskState newState) {
    state = newState;
  }

  // change task state
  void changeCategory(TaskCategory newCategory) {
    category = newCategory;
  }
}
