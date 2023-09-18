import 'package:flutter/material.dart';
import 'package:todo/models/user/user_repo.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    final w = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: SizedBox(
        height: h,
        width: w,
        child: Center(
          child: GestureDetector(
            onTap: () => UserRepo().logout(),
            child: Text(
              "Home Screen Press to Logout",
              style: TextStyle(
                fontSize: h * 0.1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
