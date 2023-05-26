import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../login_page/models/auth_token.dart';

final hiveServiceProvider = Provider<HiveService>((ref) => HiveService());

class HiveService {
  Future<void> saveToken(AuthToken token) async {
    final box = await Hive.openBox('authBox');
    await box.put('token', token.toJson());
  }

  Future<AuthToken?> getToken() async {
    final box = await Hive.openBox('authBox');
    final tokenJson = box.get('token');
    if (tokenJson != null) {
      return AuthToken.fromJson(tokenJson);
    } else {
      return null;
    }
  }
}
