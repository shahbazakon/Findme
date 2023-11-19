import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:find_me/feature/auth_featrues/signUp/data/dataSource/signup_remote_datasoure.dart';
import 'package:find_me/feature/auth_featrues/signUp/data/models/signup_model.dart';
import 'package:meta/meta.dart';

part 'resend_otp_state.dart';

class ResendOtpCubit extends Cubit<ResendOtpState> {
  ResendOtpCubit() : super(ResendOtpInitial());

  getReSandOTPData({required Map requestBody}) async {
    try {
      emit(ResendOtpLoading());
      SignUpModel data =
          await SignUpDataSource().fetchSignUp(requestBody: requestBody);
      emit(ResendOtpLoaded(signUpModel: data));
    } on DioException catch (error) {
      emit(ResendOtpError(errorMsg: error.response!.data["message"]));
    }
  }
}
