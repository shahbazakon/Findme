import 'package:dio/dio.dart';
import 'package:find_me/core/api/api.dart';
import 'package:find_me/core/error/faliures.dart';
import 'package:find_me/core/widget/custom_snackBar.dart';
import 'package:find_me/feature/auth_featrues/otpVerify/data/models/otp_verify_model.dart';

class OTPVerifyDataSource {
  API api = API();
  Future<OtpVerifyModel> verifyOTP({required int otp, required String id}) async {
    try {
      final Response response =
          await api.sendRequest.put("/auth/verifyOTP/$id", data: {"otp": otp});
      final status = await hanldeStatusCode(response);
      if (status.status) {
        OtpVerifyModel data = OtpVerifyModel.fromJson(response.data);
        return data;
      } else {
        throw status.failure!;
      }
    } catch (error) {
      showSnackBar(title: "$error");
      rethrow;
    }
  }
}
