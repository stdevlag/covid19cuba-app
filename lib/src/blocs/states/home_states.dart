import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:covid19cuba/src/models/models.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class InitialHomeState extends HomeState {}

class LoadingHomeState extends HomeState {}

class LoadedHomeState extends HomeState {
  final DataModel data;

  const LoadedHomeState({@required this.data}) : assert(data != null);

  @override
  List<Object> get props => [data];
}

class ErrorHomeState extends HomeState {
  final String errorMessage;

  const ErrorHomeState({@required this.errorMessage})
      : assert(errorMessage != null);

  @override
  List<Object> get props => [errorMessage];
}
