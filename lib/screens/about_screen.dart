import 'dart:io';

import 'package:flutter/material.dart';
import 'package:roboclub_flutter/helper/custom_icons.dart';
import 'package:roboclub_flutter/screens/map_screen.dart';
import 'package:roboclub_flutter/widgets/appBar.dart';
import 'package:roboclub_flutter/widgets/drawer.dart';
import '../widgets/developer_card.dart';
import '../helper/dimensions.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  AnimationController _animationController;
  Animation _animation;

  void initState() {
    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween(begin: 60.0, end: 85.0).animate(_animationController);
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var vpH = getViewportHeight(context);
    var vpW = getViewportWidth(context);
    var title = TextStyle(fontWeight: FontWeight.bold, fontSize: vpH * 0.03);
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: appdrawer(context, page: "About us"),
        appBar: appBar(
          context,
          strTitle: "About Us",
          isDrawer: true,
          isNotification: false,
          scaffoldKey: _scaffoldKey,
        ),
        body: Container(
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverAppBar(
                leading: new Container(),
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                expandedHeight: vpH * 0.60,
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: vpW * 0.05, vertical: vpH * 0.020),
                    child: Container(
                      width: vpW * 0.90,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text("Introduction", style: title),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: vpW * 0.028,
                                      vertical: vpH * 0.005),
                                  child: Text(
                                      "Have you ever wondered how robots are made and function? Do you want to build your robot or understand the science and technology behind it? If yes, then you have visited the right place!",
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: vpH * 0.020)),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: vpW * 0.028,
                                      vertical: vpH * 0.015),
                                  child: AnimatedBuilder(
                                      animation: _animation,
                                      builder: (context, _) {
                                        return GestureDetector(
                                          onTap: () {
                                            launch('https://amuroboclub.in/');
                                          },
                                          child: Column(
                                            children: [
                                              Text("Click ME !!",style: TextStyle(fontSize:vpH*0.02,color: Colors.pink[300],fontWeight: FontWeight.w600,),),
                                              Image.asset(
                                                'assets/img/NoPath.png',
                                                width: _animation.value,
                                                height: _animation.value,
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: vpW * 0.028, vertical: vpH * 0.005),
                            child: Text(
                                "AMURoboclub is a student's body that nurtures the needs of curious and innovative minds. As conveyed by its motto, 'Where Innovation Meets Implementation', AMURoboclub puts forward a learning as well as a challenging environment that ignites the techie inside a person. Moreover, it provides hands-on experience with various technologies and tools which renders your knowledge and skills in the field of robotics. The club works under the supervision of our faculty advisors from various branches of Zakir Husain College of Engineering and Technology, Aligarh Muslim University.",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: vpH * 0.020)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: vpW * 0.05, vertical: vpH * 0.02),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        width: vpW * 0.01,
                        height: vpH * 0.85,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 20.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Social Handles",
                                  style: title,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: vpH * 0.006,
                                      horizontal: vpW * 0.02),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: IconButton(
                                      icon: Icon(SocialMedia.facebook),
                                      iconSize: vpW * 0.080,
                                      color: Color(0xFF3B5998),
                                      onPressed: () {
                                        launch(
                                            'https://www.facebook.com/groups/amuroboculb/');
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: vpH * 0.005,
                                      horizontal: vpW * 0.02),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: IconButton(
                                      icon: Icon(SocialMedia.linkedin),
                                      iconSize: vpW * 0.080,
                                      color: Color(0xFF2867B2),
                                      onPressed: () {
                                        launch(
                                            'https://www.linkedin.com/in/amuroboclub');
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: vpH * 0.013,
                                      horizontal: vpW * 0.02),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: GestureDetector(
                                      onTap: () {
                                        launch(
                                            'https://www.instagram.com/amuroboclub');
                                      },
                                      child: Image.asset(
                                        'assets/img/insta.png',
                                        fit: BoxFit.cover,
                                        width: vpW * 0.080,
                                        height: vpH * 0.040,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: vpH * 0.005,
                                      horizontal: vpW * 0.02),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: IconButton(
                                      icon: Icon(SocialMedia.youtube),
                                      iconSize: vpW * 0.090,
                                      color: Colors.red,
                                      onPressed: () {
                                        launch(
                                            'https://www.youtube.com/amuroboclub');
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: vpH * 0.005,
                                      horizontal: vpW * 0.02),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: IconButton(
                                      icon: Icon(SocialMedia.github),
                                      iconSize: vpW * 0.080,
                                      color: Colors.black,
                                      onPressed: () {
                                        launch(
                                            'https://github.com/open-roboclub');
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Location",
                                  style: title,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                try {
                                  final result = await InternetAddress.lookup(
                                      'google.com');
                                  if (result.isNotEmpty &&
                                      result[0].rawAddress.isNotEmpty) {
                                    print('connected');
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => MapView(),
                                    ));
                                  }
                                } on SocketException catch (_) {
                                  print('not connected');
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: vpW * 0.028,
                                    vertical: vpH * 0.015),
                                child: Image.asset(
                                  'assets/img/map.jpg',
                                  width: vpW * 0.9,
                                  height: vpH * 0.25,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Developers",
                                  style: title,
                                ),
                              ),
                            ),
                            Container(
                                height: vpH * 0.25,
                                width: vpW,
                                child: Column(
                                  children: [
                                    DeveloperCard(
                                      name: "Rishabh Sharma",
                                      img: 'assets/img/rishabh.jpg',
                                    ),
                                    DeveloperCard(
                                        name: "Samiksha Agrawal",
                                        img: 'assets/img/samiksha.jpeg'),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
