part of 'saved_bloc.dart';

abstract class SavedState extends Equatable {
  const SavedState();
}

class SavedInitial extends SavedState {
  @override
  List<Object> get props => [];
}
