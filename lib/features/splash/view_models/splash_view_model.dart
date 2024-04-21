import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_view_model.g.dart';

@Riverpod(
  keepAlive: true,
)
class SplashViewModel extends _$SplashViewModel {
  @override
  User? build() {
    return FirebaseAuth.instance.currentUser;
  }
}