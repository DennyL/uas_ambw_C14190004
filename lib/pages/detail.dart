// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:uas_ambw/dataclass.dart';

class Detail extends StatefulWidget {
  final DataAPI data;
  const Detail({Key? key, required this.data}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF151517),
        title: Text('Detail'),
        actions: [
          GestureDetector(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.only(right: 18),
              child: Icon(
                LineIcons.thumbsUp,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Expanded(
          child: Container(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Image.network(widget.data.cThumbnail),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        widget.data.cTitle,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Text(
                        'Publish Date : ${widget.data.cPubDate}',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: width,
                      child: Text(
                        'Link : ${widget.data.cLink}',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: width,
                      child: Text(
                        'Description :',
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: width,
                      child: Text(
                        widget.data.cDesc,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
