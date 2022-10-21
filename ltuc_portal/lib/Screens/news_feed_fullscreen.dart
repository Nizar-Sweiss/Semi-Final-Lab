import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ltuc_portal/Widgets/news_feed_widget.dart';
import 'package:ltuc_portal/utility/students_mark.dart';

class NewsFeedFullScreen extends StatefulWidget {
  // get the image data that was passed from the main page
  final DocumentSnapshot<Object?> snapShot;
  const NewsFeedFullScreen({
    Key? key,
    required this.snapShot,
  }) : super(key: key);

  @override
  State<NewsFeedFullScreen> createState() => _NewsFeedFullScreenState();
}

class _NewsFeedFullScreenState extends State<NewsFeedFullScreen> {
  final DataTableSource _data = Marks();
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(title: Text("doc_ID: ${widget.snapShot.id}")),
      body: Container(
        margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Hero(
          tag: widget.snapShot.id,
          flightShuttleBuilder:
              (flightContext, animation, direction, fromContext, toContext) {
            return const Icon(
              Icons.newspaper,
              size: 150.0,
            );
          },
          child: Column(
            children: [
              SizedBox(
                  height: 100,
                  child: newsData(widget.snapShot, Theme.of(context))),
              PaginatedDataTable(
                source: _data,
                columns: const [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Score'))
                ],
                columnSpacing: 20,
                horizontalMargin: MediaQuery.of(context).size.width / 8,
                rowsPerPage: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
