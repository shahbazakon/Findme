import 'package:bloc/bloc.dart';
import 'package:find_me/feature/auth_featrues/signIn/data/dataSource/signin_remote_datasource.dart';
import 'package:find_me/feature/auth_featrues/signIn/data/models/signIn_model.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  getSignInData({required String email, required String password}) async {
    try {
      emit(SignInLoading());
      SignInModel data = await SignInDataSource()
          .fetchSignIn(requestBody: {"email": email, "password": password});
      emit(SignInLoaded(data));
    } catch (error) {
      emit(SignInError(error.toString()));
    }
  }
}
