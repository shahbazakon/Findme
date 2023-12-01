import 'package:find_me/core/models/protfolio_model.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CorporateDetailsState {}

class CorporateDetailsInitial extends CorporateDetailsState {}

class CorporateDetailsLoading extends CorporateDetailsState {}

class CorporateDetailsLoaded extends CorporateDetailsState {
  final PortfolioModel portfolioModel;
  CorporateDetailsLoaded({required this.portfolioModel});
}

class CorporateDetailsError extends CorporateDetailsState {
  final String errorMsg;
  CorporateDetailsError({required this.errorMsg});
}
