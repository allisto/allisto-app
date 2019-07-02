import "package:flutter/material.dart";
import 'package:flutter_dialogflow/dialogflow_v2.dart';


class Bot_window extends StatefulWidget {
  _ChatWindowState createState() => _ChatWindowState();
}

class _ChatWindowState extends State<Bot_window> {
  List<Widget> _messages = new List();
  TextEditingController _controller = TextEditingController();

  void _queryHandler(text) {
    if (text.length < 1) return; // no empty messages
    ChatMessage message = new ChatMessage(
      sender: true,
      text: text,
    );
    setState(() {
      _messages.insert(0, message);
    });
    _controller.clear();
    _getResponse(text.toString());
  }

  void _getResponse(query) async
  {
    AuthGoogle auth=await AuthGoogle(fileJson: "assets/Allisto-agent.json").build();
    Dialogflow dialog=Dialogflow(authGoogle: auth);
    AIResponse response= await dialog.detectIntent(query);
    ChatMessage Response_Message=ChatMessage(
      text: response.getMessage(),
      sender: false,
    );
    setState(() {
      _messages.insert(0, Response_Message);
    });
  }
  @override
  Widget build(BuildContext context) {
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
    );
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

class FAQ_button extends StatelessWidget {
  @override
  String FAQ;
  FAQ_button({this.FAQ});
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FlatButton(
        splashColor: Colors.deepPurpleAccent,
        color: Colors.white,
        child: Text(FAQ,style: TextStyle(color: Colors.black54),),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        onPressed: (){

        },
      ),
    );
  }
}
