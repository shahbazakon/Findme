part of 'academic_details_cubit.dart';

@immutable
abstract class AcademicDetailsState {}

class AcademicDetailsInitial extends AcademicDetailsState {}

class AcademicDetailsLoading extends AcademicDetailsState {}

class AcademicDetailsLoaded extends AcademicDetailsState {
  final PortfolioModel portfolioModel;
  AcademicDetailsLoaded({required this.portfolioModel});
}

class AcademicDetailsError extends AcademicDetailsState {
  final String errorMsg;
  AcademicDetailsError({required this.errorMsg});
}
