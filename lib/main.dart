// ignore_for_file: prefer_const_constructors, TODO

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:uas_ambw/apiservices.dart';
import 'package:uas_ambw/dataclass.dart';
import 'package:uas_ambw/firebase_options.dart';
import 'package:uas_ambw/pages/detail.dart';
import 'package:uas_ambw/pages/home.dart';
import 'package:uas_ambw/pages/like.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const MaterialApp(
      title: 'UAS AMBW',
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

late Future<List<DataAPI>> DataList;

class _MyAppState extends State<MyApp> {
  int actIndex = 0;
  Service ServiceAPI = Service();

  void changeActivePage(int index) {
    setState(() {
      actIndex = index;
    });
  }

  List<Widget> pages = [];

  @override
  void initState() {
    // TODO: implement initState
    pages = [
      Home(),
      Like(),
    ];
    DataList = ServiceAPI.getAllData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0xFF151517),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              rippleColor: Color.fromARGB(15, 224, 224, 224),
              hoverColor: Color.fromARGB(15, 224, 224, 224),
              gap: 8,
              activeColor: Color.fromARGB(225, 255, 255, 255),
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 500),
              tabBackgroundColor: Color.fromARGB(15, 224, 224, 224),
              color: Color(0xFFa7a7a7),
              tabs: const [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.thumbsUp,
                  text: 'Like',
                ),
              ],
              selectedIndex: actIndex,
              onTabChange: (index) {
                setState(() {
                  actIndex = index;
                });
              },
            ),
          ),
        ),
      ),
      body: pages[actIndex],
    );
  }
}
