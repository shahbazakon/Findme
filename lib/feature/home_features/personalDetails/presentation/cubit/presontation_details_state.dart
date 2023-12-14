import 'package:find_me/core/models/portfolio_set_model.dart';
import 'package:flutter/widgets.dart';

@immutable
abstract class PersonalDetailsState {}

class PersonalDetailsInitial extends PersonalDetailsState {}

class PersonalDetailsLoading extends PersonalDetailsState {}

class PersonalDetailsLoaded extends PersonalDetailsState {
  final PortfolioSetModel portfolioModel;
  PersonalDetailsLoaded({required this.portfolioModel});
}

class PersonalDetailsError extends PersonalDetailsState {
  final String errorMsg;
  PersonalDetailsError({required this.errorMsg});
}
