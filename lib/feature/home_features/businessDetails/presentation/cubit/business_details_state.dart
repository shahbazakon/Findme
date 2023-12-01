import 'package:find_me/core/models/protfolio_model.dart';
import 'package:flutter/material.dart';

@immutable
abstract class BusinessDetailsState {}

class BusinessDetailsInitial extends BusinessDetailsState {}

class BusinessDetailsLoading extends BusinessDetailsState {}

class BusinessDetailsLoaded extends BusinessDetailsState {
  final PortfolioModel portfolioModel;
  BusinessDetailsLoaded({required this.portfolioModel});
}

class BusinessDetailsError extends BusinessDetailsState {
  final String errorMsg;
  BusinessDetailsError({required this.errorMsg});
}
