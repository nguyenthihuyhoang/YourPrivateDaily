import 'package:get_it/get_it.dart';
import 'package:private_app/services/local/db.dart';

final getIt = GetIt.instance;

void setup() {
  final DbService dbService = DbService();
  dbService.init();
  
  getIt.registerSingleton<DbService>(dbService);
}
