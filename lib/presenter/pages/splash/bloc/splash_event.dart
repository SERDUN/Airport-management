part of 'splash_bloc.dart';

abstract class SplashEvent {
  const SplashEvent();
}

class CheckPermissionLocationEvent implements SplashEvent {}

class RequestPermissionLocationEvent implements SplashEvent {}

class OpenSettingsPermissionLocationEvent implements SplashEvent {}
