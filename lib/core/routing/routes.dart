part of 'router.dart';

enum Routes {
  root('/'),
  auth('auth'),
  onboarding('onboarding'),
  home('home'),
  moodStat('moodStat'),
  report('report'),
  myHabits('myHabits'),
  account('account'),
  preferences('preferences');

  final String path;

  const Routes(this.path);
}
