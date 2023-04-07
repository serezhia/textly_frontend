import 'package:textly/src/common/model/app_metadata.dart';
import 'package:textly/src/feature/auth/data/auth_repo.dart';
import 'package:textly_core/textly_core.dart';

class RepositoryStorage {
  RepositoryStorage({
    required this.appMetadata,
    required this.authRepository,
    required this.profileRepository,
  });

  final AppMetadata appMetadata;
  final IAuthRepository authRepository;
  final ProfileRepository profileRepository;
}
