import 'package:chopper/chopper.dart';
import 'package:j3enterprise/src/resources/services/rest_api_service.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient {
  static const String URL = 'https://uat-api.quickstoreapp.com:10441';
  static late ChopperClient chopper;

  static Future<void> updateClient(String baseUrl) async {
    final tokenEndpoint =
        Uri.parse('https://uat-auth.quickstoreapp.com:10442/connect/token');
    const identifier = 'QuickStore_Web';
    const secret = '1q2w3e*';

    final client = await oauth2.clientCredentialsGrant(
      tokenEndpoint,
      identifier,
      secret,
    );

    final chopperClient = ChopperClient(
      baseUrl: Uri.parse(URL),
      services: [RestApiService.create()],
      authenticator: OAuth2Authenticator(client),
      interceptors: [
        (Request request) async {
          final prefs = await SharedPreferences.getInstance();
          final token = prefs.getString("access_token");
          final tenantId = prefs.getString("Abp.TenantId");

          final headers = {
            'Authorization': 'Bearer $token',
            if (tenantId != null) 'Abp.TenantId': tenantId,
            'content-type': 'application/json',
            'Accept': 'application/json',
          };

          return request.copyWith(headers: headers);
        },
        (Response response) async {
          if (response.statusCode == 401) {
            final prefs = await SharedPreferences.getInstance();
            await prefs.remove("access_token");
            await prefs.remove("Abp.TenantId");
          }
          return response;
        },
      ],
      converter: const JsonConverter(),
    );

    chopper = chopperClient;
  }
}

class OAuth2Authenticator extends Authenticator {
  final oauth2.Client client;

  OAuth2Authenticator(this.client);

  @override
  Future<Request?> authenticate(
    Request request,
    Response<dynamic> response, [
    Request? originalRequest,
  ]) async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('access_token');

    if (accessToken == null) {
      return null;
    }

    return request.copyWith(headers: {'Authorization': 'Bearer $accessToken'});
  }
}
