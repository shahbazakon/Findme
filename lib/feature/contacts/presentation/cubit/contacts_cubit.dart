import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:find_me/feature/contacts/data/datasource/contacts_remote_data_source.dart';
import 'package:find_me/feature/contacts/data/model/contacts_model.dart';
import 'package:meta/meta.dart';

part 'contacts_state.dart';

class ContactsCubit extends Cubit<ContactsState> {
  ContactsCubit() : super(ContactsInitial());
  fetchContactList({required String userID}) async {
    try {
      emit(ContactsLoading());
      ContactModel result =
          await ContactsRemoteDataSource().fetchContactsData(userID: userID);
      emit(ContactLoaded(contactModel: result));
    } on DioException catch (error) {
      emit(ContactsError(errorMsg: error.response!.data["message"]));
    }
  }
}
