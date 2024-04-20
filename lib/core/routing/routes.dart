part of 'router.dart';

enum Routes {
  root('/'),
  login('login'),
  register('register'),
  dashboard('dashboard');

  final String path;

  const Routes(this.path);
}