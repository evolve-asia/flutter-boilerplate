import 'package:floor/floor.dart';
import 'package:flutter_boilerplate/storage/db_constants.dart';

@Entity(tableName: DatabaseConstants.TBL_USERS)
class UsersEntity {
  @PrimaryKey(autoGenerate: true)
  @ColumnInfo(name: DatabaseConstants.USERS_USER_ID)
  final int id;
  @ColumnInfo(name: DatabaseConstants.USERS_USER_FULL_NAME)
  final String fullName;
  @ColumnInfo(name: DatabaseConstants.USERS_USER_EMAIL)
  final String email;
  @ColumnInfo(name: DatabaseConstants.USERS_USER_PHONE_NUMBER)
  final String phoneNumber;
  @ColumnInfo(name: DatabaseConstants.USERS_USER_FIRST_NAME)
  final String firstName;
  @ColumnInfo(name: DatabaseConstants.USERS_USER_LAST_NAME)
  final String lastName;
  @ColumnInfo(name: DatabaseConstants.USERS_USER_ROLE_ID)
  final int roleId;
  @ColumnInfo(name: DatabaseConstants.USERS_USER_ROLE)
  final String role;
  @ColumnInfo(name: DatabaseConstants.USERS_USER_BU_NAME)
  final String buName;
  @ColumnInfo(name: DatabaseConstants.USERS_USER_PARENT_ID)
  final int parentId;

  UsersEntity(
      this.id,
      this.fullName,
      this.email,
      this.phoneNumber,
      this.firstName,
      this.lastName,
      this.roleId,
      this.role,
      this.buName,
      this.parentId);
}
