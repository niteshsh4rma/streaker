part of 'router.dart';

enum Routes {
  root('/'),
  auth('auth'),
  dashboard('dashboard');

  final String path;

  const Routes(this.path);
}