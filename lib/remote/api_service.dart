import 'package:flutter_boilerplate/di/service_locator.dart';
import 'package:flutter_boilerplate/remote/api_constants.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../storage/shared_pref_manager.dart';

class ApiService {
  static final SharedPrefManager _sharedPrefManager =
      locator<SharedPrefManager>();

  static GraphQLClient graphQlClient() {
    final HttpLink httpLink = HttpLink(ApiConstants.baseUrl);

    final AuthLink authLink = AuthLink(
      getToken: () {
        return _sharedPrefManager.getAccessToken() ?? "";
      },
    );

    final Link link = authLink.concat(httpLink);

    return GraphQLClient(
      link: link,
      cache: GraphQLCache(store: HiveStore()),
    );
  }
  /*static ApiClient getRestClient() {

  }*/
}
