import 'package:textly/src/common/model/app_metadata.dart';
import 'package:textly/src/feature/auth/data/auth_repo.dart';

class RepositoryStorage {
  RepositoryStorage({
    required this.appMetadata,
    required this.authRepository,
  });

  final AppMetadata appMetadata;
  final IAuthRepository authRepository;
}
