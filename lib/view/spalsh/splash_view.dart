import 'package:flutter/material.dart';
import 'package:todo/services/navigation_service.dart';
import 'package:todo/view/widgets/global/app_icon.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // Simulte some splash screen loading
      await Future.delayed(const Duration(seconds: 3));

      // Navigate to the login screen
      NavigationService.push("/login");
    });
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: AppIcon(
          height: h * 0.4,
        ),
      ),
    );
  }
}
