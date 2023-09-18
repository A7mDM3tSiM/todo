import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../services/api_services.dart';
import '../models/user/user_model.dart';
import '../models/user/user_repo.dart';

class UserProvider extends ChangeNotifier {
  late var _apiResponse = ApiResponse.initial('init');
  late final employees = <User>[];

  final loginEmailController = TextEditingController();
  final loginPassController = TextEditingController();

  final signupUsernameController = TextEditingController();
  final signupEmailController = TextEditingController();
  final signupPassController = TextEditingController();
  final signupCnofirmPassController = TextEditingController();

  ApiResponse get apiResponse => _apiResponse;

  Future<void> signUp() async {
    _apiResponse = ApiResponse.loading('Loading');
    notifyListeners();

    // Check email validation
    if (!isEmailValid(loginEmailController.text)) {
      _apiResponse = ApiResponse.error("Email is not valid");
      notifyListeners();
      return;
    }

    // Check if passwords match
    if (signupPassController.text != signupCnofirmPassController.text) {
      _apiResponse = ApiResponse.error("Unmatched passwords");
      notifyListeners();
      return;
    }

    try {
      var res = await UserRepo().signUp(
        signupUsernameController.text,
        signupEmailController.text,
        signupPassController.text,
      );

      _disposeControllers();

      if (res.status == Status.completed) {
        _apiResponse = ApiResponse.completed(null);
      } else {
        _apiResponse = ApiResponse.error("Wrong email or password");
      }
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }

  Future<void> login() async {
    _apiResponse = ApiResponse.loading('Loading');
    notifyListeners();

    // Check email validation
    if (!isEmailValid(loginEmailController.text)) {
      _apiResponse = ApiResponse.error("Email is not valid");
      notifyListeners();
      return;
    }

    try {
      var res = await UserRepo().login(
        loginEmailController.text,
        loginPassController.text,
      );

      _disposeControllers();

      if (res.status == Status.completed) {
        _apiResponse = ApiResponse.completed(null);
      } else {
        _apiResponse = ApiResponse.error("Wrong email or password");
      }
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }

  bool isEmailValid(String email) {
    return EmailValidator.validate(email, true);
  }

  void _disposeControllers() {
    loginEmailController.text = "";
    loginPassController.text = "";
    signupEmailController.text = "";
    signupPassController.text = "";
    signupCnofirmPassController.text = "";
  }
}
