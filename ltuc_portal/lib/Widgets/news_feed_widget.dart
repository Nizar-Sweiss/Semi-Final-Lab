import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:ltuc_portal/screens/news_feed_fullscreen.dart';
import 'package:ltuc_portal/utility/utility.dart';

class NewsFeedWidget extends StatefulWidget {
  const NewsFeedWidget({super.key});

  @override
  State<NewsFeedWidget> createState() => _NewsFeedWidgetState();
}

class _NewsFeedWidgetState extends State<NewsFeedWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: newsQuery.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        if (streamSnapshot.hasData) {
          return Expanded(
            child: ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return GestureDetector(
                  child: Stack(
                    children: [
                      Container(
                        height: 150,
                        margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color:
                              secondaryColors[index % secondaryColors.length],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: newsContainer(documentSnapshot),
                      ),
                      // Positioned(
                      //   left: 18,
                      //   bottom: 15,
                      //   child: Container(
                      //     height: 130,
                      //     width: 4,
                      //     decoration: BoxDecoration(
                      //       color: primaryColors[index % primaryColors.length],
                      //       borderRadius: BorderRadius.circular(5),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => NewsFeedFullScreen(
                          snapShot: documentSnapshot,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

Widget newsContainer(
  DocumentSnapshot<Object?> documentSnapshot,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        documentSnapshot['title'],
        style: defaultTextTheme.headline2,
      ),
      const SizedBox(
        height: 5,
      ),
      postInfo(documentSnapshot),
      Expanded(
        child: Text(
          documentSnapshot['description'],
          style: defaultTextTheme.bodyText1,
          maxLines: 3,
        ),
      )
    ],
  );
}

Row postInfo(
  DocumentSnapshot<Object?> documentSnapshot,
) {
  return Row(
    children: [
      FutureBuilder(
        future: users.doc(documentSnapshot['user']).get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(
              "${snapshot.data!['displayName']} posted on ",
              style: defaultTextTheme.subtitle2,
            );
          }
          return Text(
            "Loading...",
            style: defaultTextTheme.subtitle2,
          );
        },
      ),
      Text(
        DateFormat('d LLLL y').add_jm().format(
              (documentSnapshot['createdAt']).toDate(),
            ),
        style: defaultTextTheme.subtitle2,
      ),
      Visibility(
        visible: documentSnapshot['edited'] ? true : false,
        child: Row(
          children: [
            Text(
              " • Edited",
              style: defaultTextTheme.subtitle2,
            ),
          ],
        ),
      )
    ],
  );
}
