import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class BotEvent extends Equatable {
  BotEvent([List props = const []]) : super(props);
}

class Awaiting extends BotEvent {
  @override
  String toString() => 'Awaiting';
}

class DisplayQuery extends BotEvent {
  String query;

  DisplayQuery({@required this.query});

  @override
  String toString() => 'display_query';
}

class Fetching extends BotEvent {
  String query;

  Fetching({@required this.query});

  @override
  String toString() => 'Fetching';
}
