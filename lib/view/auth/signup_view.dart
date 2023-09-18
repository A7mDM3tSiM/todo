import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:todo/services/navigation_service.dart';
import 'package:todo/view/widgets/auth/text_field_widget.dart';
import 'package:todo/view/widgets/global/big_button.dart';

import '../../services/api_services.dart';
import '../../provider/user_provider.dart';
import '../widgets/global/loading_widget.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    final w = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: ListView(
        children: [
          Lottie.asset(
            "assets/info_guy.json",
            height: h * 0.3,
            width: w,
            fit: BoxFit.cover,
          ),
          AuthTextField(
            h: h * 0.065,
            w: w * 0.9,
            controller: TextEditingController(),
            label: "Username",
            icon: Icons.person,
          ),
          AuthTextField(
            h: h * 0.065,
            w: w * 0.9,
            controller: TextEditingController(),
            label: "Email",
            icon: Icons.mail,
          ),
          AuthTextField(
            h: h * 0.065,
            w: w * 0.9,
            controller: TextEditingController(),
            label: "Password",
            icon: Icons.lock_outline_rounded,
          ),
          AuthTextField(
            h: h * 0.065,
            w: w * 0.9,
            controller: TextEditingController(),
            label: "Consform password",
            icon: Icons.lock_outline_rounded,
          ),
          SizedBox(height: h * 0.03),
          Consumer<UserProvider>(
            builder: (_, user, __) {
              if (user.apiResponse.status == Status.loading) {
                return const Loading();
              }
              return BigButton(
                onTap: user.signUp,
                h: h * 0.65,
                w: w * 0.9,
                label: "Sign Up",
              );
            },
          ),
          SizedBox(height: h * 0.05),
          Row(
            children: [
              Text(
                "You Have An Account? ",
                style: TextStyle(fontSize: h * 0.023),
              ),
              GestureDetector(
                onTap: () => NavigationService.pushReplacement("/login"),
                child: Text(
                  "login",
                  style: TextStyle(
                    fontSize: h * 0.023,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
