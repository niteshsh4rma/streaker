import 'package:go_router/go_router.dart';
import 'package:streaker/presentation/splash/splash_page.dart';

class Routing {
  static final router = GoRouter(
    routes: [
      GoRoute(
        name: 'root',
        path: '/',
        builder: (context, state) => SplashPage(),
      ),
    ],
  );
}
