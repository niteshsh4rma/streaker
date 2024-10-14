import 'package:appwrite/appwrite.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

Future<void> setupDi() async {
  di.registerSingleton<Client>(
    Client()
      ..setEndpoint(dotenv.get('APPWRITE_ENDPOINT'))
      ..setProject(dotenv.get('APPWRITE_PROJECT')),
  );
}
