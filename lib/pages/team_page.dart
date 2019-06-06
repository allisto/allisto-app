import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:allisto_app/pages/github_page.dart';
import 'package:allisto_app/pages/linkedin_page.dart';

class TeamPage extends StatefulWidget {
  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  var selectedMember = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: IconButton(
                icon: Icon(
                  EvaIcons.arrowheadLeftOutline,
                  color: Colors.deepPurpleAccent,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, right: 15),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.transparent,
                    ),
                  ),
                  Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.deepPurpleAccent,
                    ),
                    child: Center(
                      child: Icon(
                        EvaIcons.barChart2Outline,
                        size: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 25.0,
                    right: 30.0,
                    child: Container(
                      height: 20.0,
                      width: 20.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          "0",
                          style: TextStyle(
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            'Team Allisto',
            style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.indigo),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.0, top: 15.0, bottom: 15.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _buildMemberContainer(
                          'Aditya Thakur', 'images/aditya.jpg', 'agenttango', '#'),
                      _buildMemberContainer(
                          'Rimjhim Gupta', 'images/rimjhim.jpg', 'rimjhimgolf', '#'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _buildMemberContainer(
                          'Nedheesh Hasija', 'images/nedd.jpg', 'neddstarkk', '#'),
                      _buildMemberContainer(
                          'Yashovardhan', 'images/yasho.jpg', 'yashovardhan99', '#'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildMemberContainer(
                          'Rishi Banerjee', 'images/rishi.jpg', 'rshrc', 'rishi-banerjee-39406915b'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }

  Widget _buildMemberContainer(
      String memberName, String imgPath, String githubUserName, String linkedInUserName) {
    return Padding(
      padding: EdgeInsets.only(right: 15, top: 10, bottom: 10, left: 4),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: switchHighlight(memberName),
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                spreadRadius: 2.0,
                color: switchShadow(memberName),
              )
            ]),
        height: 200.0,
        width: 150.0,
        child: InkWell(
          onTap: () {
            selectedProduct(memberName);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  memberName,
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: switchHighlightColor(memberName),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  imgPath,
                  height: 100.0,
                  width: 100.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    icon: Icon(FontAwesomeIcons.github),
                    onPressed: () {
                      // Go to GithubPage
                      print("Pressed");
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => GithubPage(
                                username: githubUserName,
                              ),
                        ),
                      );
                    },
                    color: switchIconColor(memberName),
                  ),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.linkedinIn),
                    onPressed: () {
                      // Go to LinkedIn Page
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LinkedInPage(
                            username: linkedInUserName,
                            profileName: memberName,
                          ),
                        ),
                      );
                    },
                    color: switchIconColor(memberName),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  selectedProduct(memberName) {
    setState(() {
      selectedMember = memberName;
    });
  }

  switchHighlight(memberName) {
    if (memberName == selectedMember) {
      return Colors.indigo;
    } else {
      return Colors.grey.withOpacity(0.3);
    }
  }

  switchHighlightColor(memberName) {
    if (memberName == selectedMember) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  switchShadow(memberName) {
    if (memberName == selectedMember) {
      return Colors.indigo.withOpacity(0.4);
    } else {
      return Colors.transparent;
    }
  }

  switchIconColor(memberName) {
    if (memberName == selectedMember) {
      return Colors.white;
    }
  }
}
