import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'vazir'),
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: _getAppbar(),
        body: SafeArea(
          child: _getMainBody(),
        ),
        bottomNavigationBar: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Copyright © 0xflutter.xyz 2023',
                style: TextStyle(fontSize: 14.0, color: Colors.white),
              ),
            ],
          ),
          height: 50.0,
          color: Colors.grey[900],
        ),
      ),
    );
  }

  PreferredSizeWidget _getAppbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.grey[900],
      title: Text(
        '0xFlutter',
        textAlign: TextAlign.center,
      ),
      titleTextStyle: TextStyle(color: Colors.white),
    );
  }

  Widget _getMainBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
          ),
          _getHeader(),
        ],
      ),
    );
  }

  Widget _getHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
        ),
        SizedBox(
          height: 20.0,
        ),
        CircleAvatar(
          backgroundImage: AssetImage('images/profile.jpg'),
          radius: 60,
        ),
        SizedBox(
          height: 20.0,
        ),
        Container(
          child: Text(
            'Reza - Flutter/Dart Developer',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            'Blockchain Technology Reasearcher',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(
          height: 12.0,
        ),
        _getRowIcon(),
        SizedBox(
          height: 14.0,
        ),
        _getSkillTitle()
      ],
    );
  }

  Widget _getSkillTitle() {
    var list = ['flutter', 'dart', 'react'];
    return Wrap(
      children: [
        for (var skill in list)
          Card(
            elevation: 6.0,
            shadowColor: Colors.white,
            child: Column(
              children: [
                Container(
                  height: 80.0,
                  child: Image(
                    image: AssetImage('images/$skill.png'),
                    width: 70.0,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      '$skill',
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            ),
          ),
      ],
    );
  }

  Widget _getRowIcon() {
    return Wrap(
      spacing: 20.0,
      alignment: WrapAlignment.center,
      children: [
        IconButton(
          onPressed: () async {
            goToWebPage("https://twitter.com/0xflutter");
          },
          icon: FaIcon(FontAwesomeIcons.squareXTwitter),
          color: Colors.grey,
        ),
        IconButton(
          onPressed: () async {
            goToWebPage("/");
          },
          icon: FaIcon(FontAwesomeIcons.linkedin),
          color: Colors.blueAccent,
        ),
        IconButton(
          onPressed: () {
            goToWebPage("https://github.com/0xflutter");
          },
          icon: FaIcon(FontAwesomeIcons.github),
          color: Colors.blueGrey,
        ),
        IconButton(
          onPressed: () {
            goToWebPage("https://t.me/X_FUNDA");
          },
          icon: FaIcon(FontAwesomeIcons.telegram),
          color: Colors.blue,
        ),
      ],
    );
  }

  void goToWebPage(String urlString) async {
    final Uri _url = Uri.parse(urlString);
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}
