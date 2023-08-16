// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rosia_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorRosiaDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$RosiaDatabaseBuilder databaseBuilder(String name) =>
      _$RosiaDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$RosiaDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$RosiaDatabaseBuilder(null);
}

class _$RosiaDatabaseBuilder {
  _$RosiaDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$RosiaDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$RosiaDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<RosiaDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$RosiaDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$RosiaDatabase extends RosiaDatabase {
  _$RosiaDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UsersDao? _userDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `users` (`users_user_id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `users_user_full_name` TEXT NOT NULL, `users_user_email` TEXT NOT NULL, `users_user_phone_number` TEXT NOT NULL, `users_user_first_name` TEXT NOT NULL, `users_user_last_name` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UsersDao get userDao {
    return _userDaoInstance ??= _$UsersDao(database, changeListener);
  }
}

class _$UsersDao extends UsersDao {
  _$UsersDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _usersEntityInsertionAdapter = InsertionAdapter(
            database,
            'users',
            (UsersEntity item) => <String, Object?>{
                  'users_user_id': item.id,
                  'users_user_full_name': item.fullName,
                  'users_user_email': item.email,
                  'users_user_phone_number': item.phoneNumber,
                  'users_user_first_name': item.firstName,
                  'users_user_last_name': item.lastName
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UsersEntity> _usersEntityInsertionAdapter;

  @override
  Future<void> delete() async {
    await _queryAdapter.queryNoReturn('delete from users');
  }

  @override
  Future<void> insert(UsersEntity entity) async {
    await _usersEntityInsertionAdapter.insert(
        entity, OnConflictStrategy.replace);
  }
}
