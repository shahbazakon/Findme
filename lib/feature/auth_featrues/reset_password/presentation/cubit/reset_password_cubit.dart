import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:find_me/feature/auth_featrues/reset_password/data/Models/reset_password_model.dart';
import 'package:find_me/feature/auth_featrues/reset_password/data/dataSource/reset_password_remote_datasource.dart';
import 'package:meta/meta.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  resetPassword(
      {required String password,
      required String confirmPassword,
      required String id}) async {
    try {
      emit(ResetPasswordLoading());
      final ResetPasswordModel result = (await ResetPasswordDataSource()
          .resetPassword(
              password: password, confirmPassword: confirmPassword, id: id));
      emit(ResetPasswordLoaded(resetPasswordModel: result));
    } on DioException catch (error) {
      emit(ResetPasswordError(
          errorMsg: error.response?.data["message"] ?? "$error"));
    }
  }
}
