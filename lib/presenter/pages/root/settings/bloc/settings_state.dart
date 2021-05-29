part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
 final int currentRadius;

  SettingsState(this.currentRadius);

}

class SettingsInitial extends SettingsState {
  SettingsInitial(int currentRadius) : super(currentRadius);

  @override
  List<Object> get props => [];
}



class AirportFailureState extends SettingsInitial {
  final String message;

  AirportFailureState(int currentRadius, this.message)
      : super(currentRadius);

  @override
  List<Object> get props =>
      [currentRadius, DateTime.now().microsecondsSinceEpoch, message];
}
