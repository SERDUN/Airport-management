import 'dart:async';

import 'package:Aevius/domain/usecases/GetAirportsFromBookmarksUseCase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'saved_event.dart';
part 'saved_state.dart';

class SavedBloc extends Bloc<SavedEvent, SavedState> {
 final GetAirportsFromBookmarkUseCase getAirportsFromBookmarkUseCase;
  SavedBloc(this.getAirportsFromBookmarkUseCase) : super(SavedInitial());

  @override
  Stream<SavedState> mapEventToState(
    SavedEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
