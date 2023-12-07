part of 'contacts_cubit.dart';

@immutable
abstract class ContactsState {}

class ContactsInitial extends ContactsState {}

class ContactsLoading extends ContactsState {}

class ContactLoaded extends ContactsState {
  final ContactModel contactModel;
  ContactLoaded({required this.contactModel});
}

class ContactsError extends ContactsState {
  final String errorMsg;
  ContactsError({required this.errorMsg});
}
