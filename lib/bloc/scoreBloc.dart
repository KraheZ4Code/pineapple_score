import 'package:pineapple_target/bloc/score_event.dart';
import 'package:pineapple_target/event/score.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScoreBloc extends Bloc<ScoreEvent, List<Score>> {

  ScoreBloc(List<Score> initialState) : super(initialState);

  @override
  List<Score> get initialState => List<Score>();

  @override
  Stream<List<Score>> mapEventToState(ScoreEvent event) async* {
    switch (event.eventType) {
      case EventType.add:
        List<Score> newState = List.from(state);
        if (event.score != null) {
          newState.add(event.score);
        }
        yield newState;
        break;
      case EventType.delete:
        List<Score> newState = List.from(state);
        newState.removeAt(event.scoreIndex);
        yield newState;
        break;
      default:
        throw Exception('Event not found $event');
    }
  }
}
