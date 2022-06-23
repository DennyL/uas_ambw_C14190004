// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:uas_ambw/dataclass.dart';
import 'package:uas_ambw/main.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF151517),
        title: Text('Home'),
      ),
      body: SafeArea(
        child: Expanded(
          child: Container(
            padding: EdgeInsets.all(12),
            child: FutureBuilder<List<DataAPI>>(
              future: DataList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<DataAPI> isiData = snapshot.data!;
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: isiData.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(isiData[index].cTitle),
                          leading: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    NetworkImage(isiData[index].cThumbnail),
                              ),
                            ),
                          ),
                          subtitle: Text(isiData[index].cPubDate),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }
}
