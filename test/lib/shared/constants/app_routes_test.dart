import 'package:flutter_test/flutter_test.dart';
import 'package:pix_keeper/config/logger_config.dart';
import 'package:pix_keeper/shared/constants/app_routes.dart';

void main() {
  test('should return correct routes', () {
    expect(AppRoutes.splash, '/');
    expect(AppRoutes.login, '/login');
    expect(AppRoutes.home, '/home');
    expect(AppRoutes.pixKeyForm, '/pix-key-form');
    expect(AppRoutes.pixKeyDetails, '/pix-key-details');
    expect(AppRoutes.profile, '/profile');
    expect(AppRoutes.trashCan, '/trash-can');
    logger.d("app_routes_test: [App routes names are correct]");
  });
}
