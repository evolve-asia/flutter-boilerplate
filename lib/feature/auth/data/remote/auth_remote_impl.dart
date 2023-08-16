import 'package:flutter_boilerplate/feature/auth/data/model/login_response.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../remote/api_service.dart';
import '../../../../remote/graphql/login_mutation.dart';
import '../../../../remote/not_null_mapper.dart';
import 'auth_remote.dart';

class AuthRemoteImpl implements AuthRemote {
  final gqlClient = ApiService.graphQlClient();
  // final restClient = ApiService.getRestClient();

  @override
  Future<LoginResponse> loginGql(
      String username, String password, String apkVersion) async {
    MutationOptions mutationOptions = MutationOptions(
        document: gql(loginMutation),
        variables: <String, dynamic>{
          "username": username,
          "password": password,
          "apkVersion": apkVersion,
        });
    QueryResult remoteResponse = await gqlClient.mutate(mutationOptions);
    var response = notNullMapper(remoteResponse, 'login');
    var loginResponse = LoginResponse.fromJson(response);
    return loginResponse;
  }
}
