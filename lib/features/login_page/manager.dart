import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../services/hive_service.dart';
import 'models/auth_token.dart';
import 'repository.dart';

final authControllerProvider =
    AutoDisposeStateNotifierProvider<AuthController, AuthState>(
  (ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    final hiveService = ref.watch(hiveServiceProvider);
    return AuthController(authRepository, hiveService);
  },
);

class AuthController extends StateNotifier<AuthState> {
  AuthController(
    this._authRepository,
    this._hiveService,
  ) : super(AuthState.initial());

  final AuthRepository _authRepository;
  final HiveService _hiveService;

  Future<void> login(String login, String password) async {
    state = AuthState.loading();
    try {
      final token = await _authRepository.login(login, password);
      await _hiveService.saveToken(token);
      state = AuthState.loaded(token);
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }
}

class AuthState {
  AuthState._();
  factory AuthState.initial() = AuthStateInitial;
  factory AuthState.loading() = AuthStateLoading;
  factory AuthState.loaded(AuthToken token) = AuthStateLoaded;
  factory AuthState.error(String message) = AuthStateError;
}

class AuthStateInitial extends AuthState {
  AuthStateInitial() : super._();
}

class AuthStateLoading extends AuthState {
  AuthStateLoading() : super._();
}

class AuthStateLoaded extends AuthState {
  AuthStateLoaded(this.token) : super._();
  final AuthToken token;
}

class AuthStateError extends AuthState {
  AuthStateError(this.message) : super._();
  final String message;
}
