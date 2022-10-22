import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ltuc_portal/utility/style.dart';
import 'package:ltuc_portal/widgets/widgets.dart';

import '../utility/utility.dart';

class NewsFeedFullScreen extends StatefulWidget {
  final DocumentSnapshot<Object?> snapShot;
  const NewsFeedFullScreen({
    required this.snapShot,
    Key? key,
  }) : super(key: key);

  @override
  State<NewsFeedFullScreen> createState() => _NewsFeedFullScreenState();
}

class _NewsFeedFullScreenState extends State<NewsFeedFullScreen> {
  final DataTableSource _data = Marks();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.snapShot['title']),
        elevation: 0,
        backgroundColor: white,
        foregroundColor: black,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: Column(
                children: [
                  postInfo(
                    documentSnapshot: widget.snapShot,
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  Text(
                    widget.snapShot['description'],
                    style: defaultTextTheme.bodyText1,
                  ),
                  Text(widget.snapShot.id)
                ],
              ),
            ),
          ),
          // ToDo: TO BE MOVED TO A DIFFERENT SCREEN.
          PaginatedDataTable(
            source: _data,
            columns: const [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Score'))
            ],
            columnSpacing: 20,
            horizontalMargin: MediaQuery.of(context).size.width / 3,
            rowsPerPage: 6,
          ),
        ],
      ),
    );
  }
}

/// TO BE MOVED TO A DIFFERENT SCREEN
//   final DataTableSource _data = Marks();
//   final double HORIZONTAL_MARGIN = 80;
//   final double NEWSDATA_HEIGHT = 100;
//   final int ROWS_PER_PAGE = 6;
//   final double COLUMN_SPACING = 20;
// PaginatedDataTable(
//               source: _data,
//               columns: const [
//                 DataColumn(
//                   label: Text('ID'),
//                 ),
//                 DataColumn(
//                   label: Text('Name'),
//                 ),
//                 DataColumn(
//                   label: Text('Score'),
//                 )
//               ],
//               columnSpacing: COLUMN_SPACING,
//               horizontalMargin: HORIZONTAL_MARGIN,
//               rowsPerPage: ROWS_PER_PAGE,
//             ),