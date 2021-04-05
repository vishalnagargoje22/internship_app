import 'package:flutter/material.dart';
import 'package:internship_app/model/Experience.dart';
import 'package:internship_app/model/education.dart';
import 'package:internship_app/model/personalInfor.dart';

class EditScreen extends StatefulWidget {
  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Profile",
        ),
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back,
            size: 24,
          ),
          onTap: () {},
        ),
        actions: <Widget>[
          GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text("Sign Out"),
                      ),
                      Icon(
                        Icons.logout,
                        size: 24,
                      )
                    ],
                  ),
                ),
              ),
              onTap: () {
                // enter the function on Tap
              }),
        ],
      ),
      body: ListView(
        children: <Widget>[
          GeneralDescription(),
          Cards(
            heading: "Personal Info",
            topicAns: personalInfor.personalInfo(),
            icon: Icon(
              Icons.person,
              size: 18,
              color: Colors.blue,
            ),
          ),
          Cards(
              heading: "Education",
              topicAns: educationInfo.getEducationInfo(),
              icon: Icon(
                Icons.school_rounded,
                size: 18,
                color: Colors.blue,
              )),
          Cards(
              heading: "Experience",
              topicAns: experienceInfo.getExperienceInfo(),
              icon: Icon(
                Icons.arrow_upward,
                size: 18,
                color: Colors.blue,
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Edit Suggested Targets".toUpperCase()),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 25,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.explore_sharp,
                size: 25,
              ),
              label: "Explore"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.school,
                size: 25,
              ),
              label: "School"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                size: 25,
              ),
              label: "Notification"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.help_rounded,
                size: 25,
              ),
              label: "help"),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        iconSize: 40,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class GeneralDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
      child: Container(
          color: Colors.blue,
          child: Column(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Profile_image("lib/images/profileIcon.png", context),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Arnav Sharma",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            TargetIndustry(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: profile_completed(),
              ),
            ],
          )),
    );
  }
}

Widget Profile_image(String imagAdd, BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.width / 5,
    width: MediaQuery.of(context).size.width / 5,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: AssetImage(imagAdd), fit: BoxFit.cover)),
  );
}

class TargetIndustry extends StatefulWidget {
  @override
  _TargetIndustryState createState() => _TargetIndustryState();
}

class _TargetIndustryState extends State<TargetIndustry> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text("Targeted Industry: ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            )),
        DropdownButton(
            underline: SizedBox(),
            value: _value,
            items: [
              DropdownMenuItem(
                value: 1,
                child: Text(
                  "Software Engineering",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
              DropdownMenuItem(
                value: 2,
                child: Text("Mechanical Engineering",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),
              ),
              DropdownMenuItem(
                value: 3,
                child: Text("electrical Engineering",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),
              ),
              DropdownMenuItem(
                value: 4,
                child: Text("Civil Engineering",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),
              ),
              DropdownMenuItem(
                value: 5,
                child: Text("Aeronautics Engineering",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),
              ),
              DropdownMenuItem(
                value: 6,
                child: Text("Marine Engineering",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),
              )
            ],
            onChanged: (value) {
              setState(() {
                _value = value;
              });
            }),
      ],
    );
  }
}

class profile_completed extends StatefulWidget {
  @override
  _profile_completedState createState() => _profile_completedState();
}

class _profile_completedState extends State<profile_completed> {
  double _value = 0.5;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 8,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: LinearProgressIndicator(
                value: _value,
                valueColor:
                    new AlwaysStoppedAnimation<Color>(Colors.blue.shade900),
                backgroundColor: Colors.white,
              ),
            ),
          ),
          Text(
            "${_value * 100} % Profile completed",
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
        ],
      ),
    );
  }
}

class PersonalInfoEdit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Information"),
      ),
      body: ListView(
        children: <Widget>[Text("Edit Screen here!!")],
      ),
    );
  }
}

class topicAnswer extends StatelessWidget {
  final String Topic;
  final String Answer;

  const topicAnswer({Key key, this.Topic, this.Answer}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Wrap(
          children: <Widget>[
            Text(
              Topic + ":  ",
              style: TextStyle(fontSize: 12, color: Colors.blue),
            ),
            Text(
              Answer,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade800),
            )
          ],
        ),
      ),
    );
  }
}

class Cards extends StatelessWidget {
  final String heading;
  final List<topicAnswer> topicAns;
  final Icon icon;

  const Cards({Key key, this.heading, this.topicAns, this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Card(
        margin: EdgeInsets.only(top: 12, right: 12, left: 12),
        elevation: 4,
        shadowColor: Colors.lightBlue,
        child: Container(
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: <Widget>[
                              icon,
                              SizedBox(
                                width: 10,
                              ),
                              Text(heading,
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17))
                            ],
                          ),
                        ),
                        InkWell(
                          child: Icon(
                            Icons.edit_outlined,
                            color: Colors.blue,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PersonalInfoEdit()));
                          },
                        ),
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: topicAns,
                        )),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
