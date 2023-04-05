import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:l/l.dart';
import 'package:textly_core/textly_core.dart';

part 'profile_bloc.freezed.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.initial({
    required int userId,
  }) = _InitialEvent;
}

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.loading() = _LoadingState;
  const factory ProfileState.error({required String message}) = _ErrorState;
  const factory ProfileState.success({required Profile profile}) =
      _SuccessState;
}

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({
    required this.profileRepository,
  }) : super(const ProfileState.loading()) {
    on<_InitialEvent>((event, emit) async {
      emit(const ProfileState.loading());
      try {
        l.vvvvvv('Запрашиваем профиль userId:${event.userId}');
        final profile =
            await profileRepository.readProfile(userId: event.userId);

        if (profile != null) {
          l.vvvvvv('Профиль userId:${event.userId} получен');
          emit(ProfileState.success(profile: profile));
        } else {
          l.vvvvvv('Профиль userId:${event.userId} не существует');
          emit(const ProfileState.error(message: 'Profile is not found'));
        }
      } on Object catch (e) {
        l.w('Profile exeption ');
        emit(ProfileState.error(message: '$e'));
      }
    });
  }
  final ProfileRepository profileRepository;
}
