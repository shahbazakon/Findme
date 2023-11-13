import 'package:bloc/bloc.dart';
import 'package:find_me/feature/auth_featrues/signIn/data/dataSource/signin_remote_datasource.dart';
import 'package:find_me/feature/auth_featrues/signIn/data/models/signIn_model.dart';
import 'package:meta/meta.dart';

part 'sig_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  getSignInData() async {
    try {
      emit(SignInLoading());
      SignInModel data = await SignInDataSource().fetchSignIn();
      emit(SignInLoaded(data));
    } catch (error) {
      emit(SignInError(error.toString()));
    }
  }
}
