import 'package:equatable/equatable.dart';
import 'package:travel_buddy/Model/data_model.dart';

abstract class CubitStates extends Equatable {}

class InitialStates extends CubitStates {
  @override
  List<Object?> get props => [];
}

class WelcomeStates extends CubitStates {
  @override
  List<Object?> get props => [];
}

class LoadingState extends CubitStates {
  @override
  List<Object?> get props => [];
}

class LoadedState extends CubitStates {
  LoadedState(this.places);

  final List<DataModel> places;

  @override
  List<Object?> get props => [places];
}

class DetailPageState extends CubitStates {
  DetailPageState(this.place);

  final DataModel place;

  @override
  List<Object?> get props => [place];
}