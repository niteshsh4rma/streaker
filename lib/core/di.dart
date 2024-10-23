import 'package:appwrite/appwrite.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

Future<void> setupDi() async {
  di.registerSingleton<Client>(
    Client()
      ..setEndpoint(String.fromEnvironment('APPWRITE_ENDPOINT'))
      ..setProject(String.fromEnvironment('APPWRITE_PROJECT')),
  );
}
