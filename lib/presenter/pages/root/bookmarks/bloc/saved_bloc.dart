import 'dart:async';

import 'package:Aevius/domain/entity/models/airport_model.dart';
import 'package:Aevius/domain/usecases/GetAirportsFromBookmarksUseCase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'saved_event.dart';

part 'saved_state.dart';

class SavedBloc extends Bloc<SavedEvent, SavedState> {
  final GetAirportsFromBookmarkUseCase getAirportsFromBookmarkUseCase;

  SavedBloc(this.getAirportsFromBookmarkUseCase) : super(SavedInitial([]));

  @override
  Stream<SavedState> mapEventToState(
    SavedEvent event,
  ) async* {
    if (event is LoadBookmarksEvent) yield* handleGettingAirports();
  }

  Stream<SavedState> handleGettingAirports() async* {
    var airportsResult = await getAirportsFromBookmarkUseCase.execute();
    if (airportsResult.isLeft)
      yield AirportFailureState(
          state.airports, airportsResult.left.getMessage());

    if (airportsResult.isRight)
      if (airportsResult.right.isEmpty)
      yield AirportsEmptyState(airportsResult.right);
    else
      yield AirportsReadyState(airportsResult.right);
  }
}
