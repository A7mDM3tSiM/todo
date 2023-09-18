enum UserType {
  customer,
  agent,
  admin,
}

class User {
  final String uid;
  final String? name;
  final String? email;

  UserType type = UserType.admin;

  User({
    required this.uid,
    this.name,
    this.email,
    type,
  }) {
    switch (type) {
      case 1:
        this.type = UserType.admin;
        break;
      case 0:
        this.type = UserType.agent;
        break;
      case 2:
        this.type = UserType.customer;
        break;
    }
  }
}
