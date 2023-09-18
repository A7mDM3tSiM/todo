import '../../view/auth/login_view.dart';
import '../../view/auth/signup_view.dart';
import '../../view/home/home_view.dart';
import '../../view/spalsh/splash_view.dart';

class Routes {
  // assign routes to static strings to avoid string confusion
  static String splashRoute = '/';
  static String signupRoute = '/signup';
  static String loginRoute = '/login';
  static String homeRoute = '/homw';

  /// a set contain all the app routes assigned to widgets
  // (_) is context but it is not needed
  static final routes = {
    splashRoute: (_) => const SplashView(),
    signupRoute: (_) => const SignupView(),
    loginRoute: (_) => const LoginView(),
    homeRoute: (_) => const HomeView(),
  };
}
