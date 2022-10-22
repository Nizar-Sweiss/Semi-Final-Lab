import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ltuc_portal/utility/style.dart';
import 'package:ltuc_portal/widgets/widgets.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        foregroundColor: black,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: ListView(
              children: [
                Text(widget.snapShot['title']),
                postInfo(widget.snapShot),
                Text(
                  widget.snapShot['description'],
                  style: defaultTextTheme.bodyText1,
                ),
                Text(widget.snapShot.id)
              ],
            ),
          ),
          Positioned(
            bottom: 25,
            right: 25,
            child: EditDeleteButtons(
              postDocument: widget.snapShot,
            ),
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