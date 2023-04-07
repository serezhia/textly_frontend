// ignore_for_file: avoid_dynamic_calls

import 'package:dio/dio.dart';
import 'package:textly/src/common/consts/config_app.dart';
import 'package:textly_core/textly_core.dart';

class ApiProfileRepository implements ProfileRepository {
  ApiProfileRepository(this.dio);

  final Dio dio;
  @override
  Future<void> blockProfile({required int reqUserId, required int userId}) {
    // TODO: implement blockProfile
    throw UnimplementedError();
  }

  @override
  Future<Profile> createProfile({required Profile profile}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteProfile({required int userId}) {
    // TODO: implement deleteProfile
    throw UnimplementedError();
  }

  @override
  Future<void> followProfile({required int reqUserId, required int userId}) {
    // TODO: implement followProfile
    throw UnimplementedError();
  }

  @override
  Future<List<Profile>> readBacklist({
    required int userId,
    required int offset,
    required int limit,
  }) {
    // TODO: implement readBacklist
    throw UnimplementedError();
  }

  @override
  Future<List<Profile>> readFollowers({
    required int userId,
    required int offset,
    required int limit,
    int? reqUserId,
  }) {
    // TODO: implement readFollowers
    throw UnimplementedError();
  }

  @override
  Future<List<Profile>> readFollowing({
    required int userId,
    required int offset,
    required int limit,
    int? reqUserId,
  }) {
    // TODO: implement readFollowing
    throw UnimplementedError();
  }

  @override
  Future<Profile?> readProfile({required int userId, int? reqUserId}) async {
    final response = await dio.get<dynamic>(
      '$apiDomen/profiles/profile/$userId',
    );

    return Profile.fromJson(
      response.data?['data']!['profile'] as Map<String, Object?>? ?? {},
    );
  }

  @override
  Future<void> unBlockProfile({required int reqUserId, required int userId}) {
    // TODO: implement unBlockProfile
    throw UnimplementedError();
  }

  @override
  Future<void> unFollowProfile({required int reqUserId, required int userId}) {
    // TODO: implement unFollowProfile
    throw UnimplementedError();
  }

  @override
  Future<Profile> updateProfile({required Profile profile}) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }
}
