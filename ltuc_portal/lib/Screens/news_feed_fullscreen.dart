import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ltuc_portal/Widgets/news_feed_widget.dart';

class NewsFeedFullScreen extends StatelessWidget {
  // get the image data that was passed from the main page
  final DocumentSnapshot<Object?> snapShot;
  const NewsFeedFullScreen({
    Key? key,
    required this.snapShot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(title: Text("doc_ID: ${snapShot.id}")),
      body: Center(
        child: Hero(
          tag: snapShot.id,
          child: newsData(snapShot, Theme.of(context)),
          flightShuttleBuilder:
              (flightContext, animation, direction, fromContext, toContext) {
            return const Icon(
              Icons.newspaper,
              size: 150.0,
            );
          },
        ),
      ),
    );
  }
}
