import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:find_me/feature/auth_featrues/signUp/data/dataSource/signup_remote_datasoure.dart';
import 'package:find_me/feature/auth_featrues/signUp/data/models/signup_model.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignupInitial());

  getSignUpData({required Map requestBody}) async {
    try {
      emit(SignUpLoading());
      SignUpModel data =
          await SignUpDataSource().fetchSignUp(requestBody: requestBody);
      emit(SignUpLoaded(data));
    } on DioException catch (error) {
      emit(SignUpError(error.response!.data["message"]));
    }
  }
}
