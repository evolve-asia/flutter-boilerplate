import 'package:graphql_flutter/graphql_flutter.dart';

import 'errors.dart';

Map<String, dynamic> notNullMapper(QueryResult remoteResponse, String key) {
  if (remoteResponse.hasException) {
    throw FailedResponseException(
        remoteResponse.exception?.graphqlErrors.first.message);
  }
  var data = remoteResponse.data?[key];
  if (data == null) {
    throw Exception("Data is empty");
  }
  return data;
}
