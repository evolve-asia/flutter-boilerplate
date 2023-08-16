import 'package:floor/floor.dart';
import 'package:flutter_boilerplate/storage/entity/users_entity.dart';

@dao
abstract class UsersDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insert(UsersEntity entity);

  @Query("delete from users")
  Future<void> delete();
}
