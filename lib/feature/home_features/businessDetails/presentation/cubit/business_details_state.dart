import 'package:find_me/core/models/portfolio_set_model.dart';
import 'package:flutter/material.dart';

@immutable
abstract class BusinessDetailsState {}

class BusinessDetailsInitial extends BusinessDetailsState {}

class BusinessDetailsLoading extends BusinessDetailsState {}

class BusinessDetailsLoaded extends BusinessDetailsState {
  final PortfolioSetModel portfolioModel;
  BusinessDetailsLoaded({required this.portfolioModel});
}

class BusinessDetailsError extends BusinessDetailsState {
  final String errorMsg;
  BusinessDetailsError({required this.errorMsg});
}
