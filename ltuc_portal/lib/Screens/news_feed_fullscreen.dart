import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ltuc_portal/widgets/widgets.dart';

class NewsFeedFullScreen extends StatelessWidget {
  final DocumentSnapshot<Object?> snapShot;
  const NewsFeedFullScreen({
    Key? key,
    required this.snapShot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("doc_ID: ${snapShot.id}"),
      ),
      body: newsFeedWidget(
        snapShot,
        Theme.of(context),
      ),
    );
  }
}
