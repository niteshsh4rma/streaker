import 'package:appwrite/appwrite.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

void setup() {
  di.registerSingleton<Client>(
    Client()
      ..setEndpoint('https://cloud.appwrite.io/v1')
      ..setProject('streaker'),
  );
}
