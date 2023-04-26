import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HOME_URL =
      'https://lms-demo.alleaze.in/'; //"https://lms-demo.alleaze.in/";

  bool flag = false;

  _launchURLApp() async {
    var url = Uri.parse(HOME_URL);
    if (true) {
      //canLaunch() function is returning false
      await launchUrl(url, mode: LaunchMode.inAppWebView);
      flag = true;
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<bool> _onWillPop() async {
    return exit(0);
  }

  @override
  void initState() {
    log("Screen Created");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _launchURLApp();
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.warning_amber_rounded,
                color: Colors.orangeAccent,
                size: 80,
              ),
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  'Press again to exit',
                  style: TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
