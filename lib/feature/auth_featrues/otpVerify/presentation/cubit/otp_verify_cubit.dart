import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:find_me/feature/auth_featrues/otpVerify/data/dataSource/otp_verify_remote_datasource.dart';
import 'package:find_me/feature/auth_featrues/otpVerify/data/models/otp_verify_model.dart';
import 'package:meta/meta.dart';

part 'otp_verify_state.dart';

class OtpVerifyCubit extends Cubit<OtpVerifyState> {
  OtpVerifyCubit() : super(OtpVerifyInitial());

  verifyOtp({required int otp, required String id}) async {
    try {
      emit(OtpVerifyLoading());
      OtpVerifyModel result =
          await OTPVerifyDataSource().verifyOTP(otp: otp, id: id);
      emit(OtpVerifyLoaded(otpVerifyModel: result));
    } on DioException catch (error) {
      emit(OtpVerifyError(
          errorMsg: error.response?.data["message"] ?? "$error"));
    }
  }
}
