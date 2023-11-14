import 'package:bloc/bloc.dart';
import 'package:find_me/feature/auth_featrues/signIn/data/dataSource/signin_remote_datasource.dart';
import 'package:find_me/feature/auth_featrues/signIn/data/models/forgot_password_model.dart';
import 'package:meta/meta.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordInitial());

  getForgotPasswordData({required String email}) async {
    try {
      emit(ForgotPasswordLoading());
      ForgotPasswordModel data = await SignInDataSource()
          .forgotPassword(requestBody: {"email": email});

      emit(ForgotPasswordLoaded(data));
    } catch (error) {
      emit(ForgotPasswordError(error.toString()));
    }
  }
}
