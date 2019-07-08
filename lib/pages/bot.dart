import "package:flutter/material.dart";
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:allisto_app/BLoC/bot_barrel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';


Bot_bloc _bloc =Bot_bloc();
List<Widget> _messages = new List();

class Bot_window extends StatefulWidget {
  _ChatWindowState createState() => _ChatWindowState();
}

class _ChatWindowState extends State<Bot_window> {

  TextEditingController _controller = TextEditingController();


  @override
  void initState() {
    super.initState();
    _bloc.dispatch(Awaiting());
  }

   _queryHandler(text) {
    if (text.length < 1) return; // no empty messages
    ChatMessage message = new ChatMessage(
      sender: true,
      text: text,
    );
    setState(() {
      _messages.insert(0, message);
    });
    _controller.clear();
    _bloc.dispatch(Fetching(query:text));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _bloc,
        builder: (BuildContext context, BotState state) {
        print(state.toString());

        if(state is just_finished)
          {
            _messages.insert(0, ChatMessage(text:message,sender: false));
            _bloc.dispatch(Awaiting());

          }
        return Scaffold(
      backgroundColor: Color.fromRGBO(206, 241, 255, 1),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Alice"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  reverse: true,
                  padding: new EdgeInsets.all(8.0),
                  itemBuilder: (_, int index) => _messages[index],
                  itemCount: _messages.length,
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      color: Colors.white,
                      elevation: 3.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 30.0),
                        child: TextField(
                            controller: _controller,
                            onSubmitted: _queryHandler,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black87,
                            ),
                            scrollPadding: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 10.0),
                            decoration: InputDecoration.collapsed(
                                fillColor: Colors.grey,
                                hintText: "Ask Alice",
                                hintStyle: TextStyle(
                                    fontSize: 17.0, color: Colors.black26))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton(
                      mini: true,
                      child: Center(child: Icon(Icons.send, size: 20,)),
                      foregroundColor: Colors.deepPurpleAccent,
                      backgroundColor: Colors.white,
                      onPressed: () {
                        _queryHandler(_controller.text);
                      },
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(vertical:0.0,horizontal:0.0 ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    FAQ_button(FAQ: "dummy_Question",),
                    FAQ_button(FAQ: "dummy_Question",),
                    FAQ_button(FAQ: "dummy_Question",),
                    FAQ_button(FAQ: "dummy_Question",),
                    FAQ_button(FAQ: "dummy_Question",),
                    FAQ_button(FAQ: "dummy_Question",),
                    FAQ_button(FAQ: "dummy_Question",),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );});
  }
  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}


//==========================Message_Widget==============================//

class ChatMessage extends StatelessWidget {
  String _name = "Vendor_name";
  bool sender;
  String text;
  String sender_name;

  ChatMessage({this.text, this.sender});

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        textDirection: sender ? TextDirection.rtl : TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Flexible(
            fit: FlexFit.loose,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery
                    .of(context)
                    .size
                    .width * 0.5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Row(mainAxisAlignment:  sender ?MainAxisAlignment.end:MainAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        child: sender?Text("U"):Text("A"),
                        radius: 10,
                      ),
                    ],
                  ),
                  Card(
                    color: Color.fromRGBO(209, 195, 255, 0.5),
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: sender?Radius.circular(0):Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                            topLeft: sender?Radius.circular(30):Radius.circular(0.0))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      child: Text(
                        text,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

//==========FAQ_BUTTON=========//
class FAQ_button extends StatefulWidget
{
  String FAQ;
  FAQ_button({this.FAQ});
  _FAQ_button_State createState()=>_FAQ_button_State();
}

class _FAQ_button_State extends State<FAQ_button> {
  @override

  void ExportFAQ()
  {
    _messages.insert(0, ChatMessage(sender: true,text: widget.FAQ,));
   // _bloc.dispatch(display_query(query: widget.FAQ));
  }
  Widget build(BuildContext context) {
    return BlocBuilder(bloc: _bloc, builder: (BuildContext context, BotState state){
      if(state is Busy)
        {
          print("looool");
        }
      return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FlatButton(
        splashColor: Colors.deepPurpleAccent,
        color: Colors.white,
        child: Text(widget.FAQ,style: TextStyle(color: Colors.black54),),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        onPressed: (){
          ExportFAQ();
        },
      ),
    );});
  }
}
