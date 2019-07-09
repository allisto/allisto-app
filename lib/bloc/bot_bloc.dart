import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'bot_barrel.dart';
import 'package:meta/meta.dart';

// BLoC Logic
var message;
class BotBloc extends Bloc<BotEvent,BotState> {
  BotState get initialState => Idle();

  @override
  Stream<BotState> mapEventToState(BotEvent event) async* {
    if (event is Awaiting)
      yield Idle();
    if (event is DisplayQuery) {
      Busy(query: event.query);
    }
    if (event is Fetching) {
      message = await Fetch(event.query);
      yield JustFinished();
    }
  }

//just_finished(message.toString())
  Future<String> Fetch(String query) async {
    AuthGoogle auth = await AuthGoogle(fileJson: "assets/Allisto-agent.json")
        .build();
    Dialogflow dialog = Dialogflow(authGoogle: auth);
    AIResponse response = await dialog.detectIntent(query);
    return response.getMessage();
  }
}

