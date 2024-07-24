import 'package:pix_keeper/core/domain/repositories/authentication_repository.dart';

class CheckAuthenticationStatus {
  final AuthenticationRepository _repository;

  CheckAuthenticationStatus({required AuthenticationRepository repository}) : _repository = repository;

  bool call() {
    return _repository.isAuthenticated();
  }
}
