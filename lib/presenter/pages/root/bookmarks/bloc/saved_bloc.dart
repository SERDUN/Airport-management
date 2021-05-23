import 'dart:async';

import 'package:Aevius/domain/entity/models/airport_model.dart';
import 'package:Aevius/domain/usecases/DeleteAirportFromBookmarkUseCase.dart';
import 'package:Aevius/domain/usecases/GetAirportsFromBookmarksUseCase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'saved_event.dart';

part 'saved_state.dart';

class SavedBloc extends Bloc<SavedEvent, SavedState> {
  final GetAirportsFromBookmarkUseCase getAirportsFromBookmarkUseCase;
  final DeleteAirportFromBookmarkUseCase deleteAirportFromBookmarkUseCase;

  SavedBloc(this.getAirportsFromBookmarkUseCase,
      {this.deleteAirportFromBookmarkUseCase})
      : super(SavedInitial([]));

  @override
  Stream<SavedState> mapEventToState(
    SavedEvent event,
  ) async* {
    if (event is LoadBookmarksEvent) yield* handleGettingAirports();
    if (event is DeleteAirportFromBookmarksEvent)
      yield* handleDeletingAirports(event.model);
  }

  Stream<SavedState> handleGettingAirports() async* {
    var airportsResult = await getAirportsFromBookmarkUseCase.execute();
    if (airportsResult.isLeft)
      yield AirportFailureState(
          state.airports, airportsResult.left.getMessage());

    if (airportsResult.isRight) if (airportsResult.right.isEmpty)
      yield AirportsEmptyState(airportsResult.right);
    else
      yield AirportsReadyState(airportsResult.right);
  }

  Stream<SavedState> handleDeletingAirports(AirportModel model) async* {
    var airportsResult = await deleteAirportFromBookmarkUseCase.execute(model);
    if (airportsResult.isLeft)
      yield AirportFailureState(
          state.airports, airportsResult.left.getMessage());

    if (airportsResult.isRight) {
      yield AirportMessageState(
          state.airports, "Airport deleted from bookmark");
      if (airportsResult.right.isEmpty)
        yield AirportsEmptyState(airportsResult.right);
      else
        yield AirportsReadyState(airportsResult.right);
    }
  }
}
