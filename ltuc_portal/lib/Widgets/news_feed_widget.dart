import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:ltuc_portal/utility/utility.dart';

class NewsFeedWidget extends StatefulWidget {
  const NewsFeedWidget({super.key});

  @override
  State<NewsFeedWidget> createState() => _NewsFeedWidgetState();
}

class _NewsFeedWidgetState extends State<NewsFeedWidget> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return StreamBuilder(
      stream: newsQuery.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        if (streamSnapshot.hasData) {
          return ListView.builder(
            itemCount: streamSnapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final DocumentSnapshot documentSnapshot =
                  streamSnapshot.data!.docs[index];
              return Container(
                height: 200,
                margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      documentSnapshot['title'],
                      style: themeData.textTheme.headline2,
                    ),
                    Row(
                      children: [
                        FutureBuilder(
                          future: users.doc(documentSnapshot['user']).get(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Text(
                                "${snapshot.data!['displayName']} posted on ",
                                style: themeData.textTheme.subtitle2,
                              );
                            }
                            return Text(
                              "Loading...",
                              style: themeData.textTheme.subtitle2,
                            );
                          },
                        ),
                        Text(
                          DateFormat('d LLLL y').add_jm().format(
                                (documentSnapshot['createdAt']).toDate(),
                              ),
                          style: themeData.textTheme.subtitle2,
                        )
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(documentSnapshot['description'],
                            style: themeData.textTheme.bodyText1),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
