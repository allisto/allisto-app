import 'package:equatable/equatable.dart';

abstract class BotState extends Equatable {
  BotState([List props = const []]) : super(props);
}

class Idle extends BotState {
  @override
  String toString() => 'Idle';
}

class Busy extends BotState {
  String query;

  Busy({this.query});

  @override
  String toString() => 'Busy';
}

class JustFinished extends BotState {
  @override
  String toString() => 'just_finished';
}
