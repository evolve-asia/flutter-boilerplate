import 'dao/users/user_dao.dart';
import 'rosia_database.dart';

class DatabaseManager {
  static DatabaseManager? _databaseManager;
  static RosiaDatabase? _dbInstance;

  static Future<DatabaseManager> getDbInstance() async {
    _databaseManager ??= DatabaseManager();
    _dbInstance ??= await RosiaDatabase.getInstance();
    return _databaseManager!;
  }

  void clear() {}

  UsersDao getUserDao() => _dbInstance!.userDao;
}
