part of 'router.dart';

enum Routes {
  root('/'),
  auth('auth'),
  onboarding('onboarding'),
  dashboard('dashboard');

  final String path;

  const Routes(this.path);
}