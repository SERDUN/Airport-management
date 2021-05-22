part of 'splash_bloc.dart';

abstract class SplashState extends Equatable {
  const SplashState();
}

class SplashInitial extends SplashState {
  @override
  List<Object> get props => [];
}


class PermissionLocationInitial extends SplashInitial {
  @override
  List<Object> get props => [];
}

class LocationAllow extends SplashInitial {
  @override
  List<Object> get props => [];
}

class LocationDenny extends SplashInitial {
  @override
  List<Object> get props => [];
}

class LocationDennyForever extends SplashInitial {
  @override
  List<Object> get props => [];
}
