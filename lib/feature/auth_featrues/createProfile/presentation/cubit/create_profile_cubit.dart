import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:find_me/feature/auth_featrues/createProfile/data/dataSource/create_profile_remote_datasource.dart';
import 'package:find_me/feature/auth_featrues/createProfile/data/models/complete_profile_model.dart';
import 'package:meta/meta.dart';

part 'create_profile_state.dart';

class CreateProfileCubit extends Cubit<CreateProfileState> {
  CreateProfileCubit() : super(CreateProfileInitial());

  createProfile({required ProfileModel data}) async {
    try {
      emit(CreateProfileLoading());
      ProfileModel result =
          await CreateProfileRemoteDataSource().createProfile(data: data);
      emit(CreateProfileLoaded(profileModel: result));
    } on DioException catch (error) {
      emit(CreateProfileError(
          errorMsg: error.response?.data["message"] ?? "$error"));
    }
  }
}
