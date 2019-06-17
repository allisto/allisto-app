import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({Key key}) : super(key: key);

  @override
  IntroScreenState createState() => IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = List();

  @override
  void initState() {
    super.initState();

    slides.add(
      Slide(
        title: "Autism",
        styleTitle: TextStyle(
            color: Colors.indigo,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
        "Treat your infant's autism at with Allisto :)",
        styleDescription: TextStyle(
            color: Colors.pink,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "images/brain_image.png",
      ),
    );
    slides.add(
      Slide(
        title: "Diagnosis at Home",
        styleTitle: TextStyle(
            color: Colors.indigo,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
        "Early and easy diagnosis right at your home.",
        styleDescription: TextStyle(
            color: Colors.pink,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "images/hospital_image.png",
      ),
    );
    slides.add(
      Slide(
        title: "AI powered",
        styleTitle: TextStyle(
            color: Colors.indigo,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
        "Powered and accompnaied by a smart AI",
        styleDescription: TextStyle(
            color: Colors.pink,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "images/ai_image.png",
      ),
    );
  }

  void onDonePress() {
    // Navigating to Allisto Home Page
    Navigator.of(context).pushNamed('homepage/');
  }

  void onTabChangeCompleted(index) {
    // Index of current tab is focused
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Colors.white,
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return IconButton(
      onPressed: (){
        Navigator.of(context).pushNamed('/home');
      },
      icon: Icon(
        EvaIcons.doneAllOutline,
        color: Colors.white,
      ),
      tooltip: "Skip to Home",
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      EvaIcons.rewindRightOutline,
      color: Colors.white,
    );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = List();
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          margin: EdgeInsets.only(bottom: 60.0, top: 60.0),
          child: ListView(
            children: <Widget>[
              GestureDetector(
                  child: Image.asset(
                    currentSlide.pathImage,
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.contain,
                  )),
              Container(
                child: Text(
                  currentSlide.title,
                  style: currentSlide.styleTitle,
                  textAlign: TextAlign.center,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
              Container(
                child: Text(
                  currentSlide.description,
                  style: currentSlide.styleDescription,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
            ],
          ),
        ),
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      colorSkipBtn: Colors.indigo,
      highlightColorSkipBtn: Colors.pink,

      // Next button
      renderNextBtn: this.renderNextBtn(),

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
//      onDonePress: (){
//        Navigator.of(context).pushNamed('home/');
//      },
      colorDoneBtn: Colors.indigo,
      highlightColorDoneBtn: Colors.pink,

      // Dot indicator
      colorDot: Colors.indigo,
      colorActiveDot: Colors.pink,
      sizeDot: 13.0,

      // List custom tabs
      listCustomTabs: this.renderListCustomTabs(),

      // Show or hide status bar
      shouldHideStatusBar: true,

      // On tab change completed
      onTabChangeCompleted: this.onTabChangeCompleted,
    );
  }
}