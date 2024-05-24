import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_view_model.g.dart';

@riverpod
class DashboardViewModel extends _$DashboardViewModel {
  @override
  DashboardState build() {
    return DashboardState();
  }

  void setTabIndex(int index) {
    state = DashboardState(tabIndex: index);
  }
}

class DashboardState {
  final int tabIndex;

  DashboardState({this.tabIndex = 0});
}
