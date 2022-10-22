import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ltuc_portal/widgets/widgets.dart';
import 'package:ltuc_portal/utility/utility.dart';

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
  final double HORIZONTAL_MARGIN = 80;
  final double NEWSDATA_HEIGHT = 100;
  final int ROWS_PER_PAGE = 6;
  final double COLUMN_SPACING = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("doc_ID: ${widget.snapShot.id}")),
      body: Container(
        margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(5),
        ),
        child: ListView(
          children: [
            SizedBox(
                height: NEWSDATA_HEIGHT,
                child: newsFeedWidget(widget.snapShot, Theme.of(context))),
            PaginatedDataTable(
              source: _data,
              columns: const [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Score'))
              ],
              columnSpacing: COLUMN_SPACING,
              horizontalMargin: HORIZONTAL_MARGIN,
              rowsPerPage: ROWS_PER_PAGE,
            ),
          ],
        ),
      ),
    );
  }
}
