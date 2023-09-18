import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:todo/services/api_services.dart';
import 'package:todo/provider/user_provider.dart';
import 'package:todo/view/widgets/global/loading_widget.dart';

import '../../services/navigation_service.dart';
import '../widgets/auth/text_field_widget.dart';
import '../widgets/global/big_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false);
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
            controller: user.loginEmailController,
            label: "Email",
            icon: Icons.person,
          ),
          AuthTextField(
            h: h * 0.065,
            w: w * 0.9,
            controller: user.loginPassController,
            label: "Password",
            icon: Icons.lock_outline_rounded,
          ),
          SizedBox(height: h * 0.03),
          Consumer<UserProvider>(
            builder: (_, user, __) {
              if (user.apiResponse.status == Status.loading) {
                return const Loading();
              }
              return BigButton(
                onTap: user.login,
                h: h * 0.65,
                w: w * 0.9,
                label: "Login",
              );
            },
          ),
          SizedBox(height: h * 0.05),
          Row(
            children: [
              Text(
                "Don't Have An Account? ",
                style: TextStyle(fontSize: h * 0.023),
              ),
              GestureDetector(
                onTap: () => NavigationService.pushReplacement("/signup"),
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
