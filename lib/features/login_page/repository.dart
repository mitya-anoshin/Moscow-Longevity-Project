import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants/urls.dart';
import '../api/manager.dart';
import 'models/auth_token.dart';

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepository(
    ref.watch(dioProvider),
  ),
);

class AuthRepository {
  AuthRepository(this._dio);

  final Dio _dio;

  Future<AuthToken> login(String login, String password) async {
    final response = await _dio.get(
      URLs.login,
      queryParameters: {
        'login': login,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      return AuthToken.fromJson(response.data);
    } else {
      throw Exception('Failed to login');
    }
  }
}
