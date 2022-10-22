import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ltuc_portal/widgets/widgets.dart';
import 'package:ltuc_portal/utility/utility.dart';

class EditDeleteButtons extends StatefulWidget {
  final DocumentSnapshot postDocument;
  const EditDeleteButtons({
    required this.postDocument,
    Key? key,
  }) : super(key: key);

  @override
  State<EditDeleteButtons> createState() => _EditDeleteButtonsState();
}

class _EditDeleteButtonsState extends State<EditDeleteButtons> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: users.doc(authUser?.uid).get(),
      builder: (context, snapshot) {
        bool showWidget = false;
        if (snapshot.hasData) {
          /// Checking if the user is the owner of the post or if the user is an admin.
          /// 0: USER: Only READ
          /// 1: TEACHER: Post owner EDIT/DELETE
          /// 2: ADMIN: EDIT/DELETE
          double role = snapshot.data!['role'];
          if (role == 0) {
            showWidget = false;
          } else if (widget.postDocument['user'] == authUser?.uid &&
              role == 1) {
            showWidget = true;
          } else if (role == 2) {
            showWidget = true;
          }
          return Visibility(
            visible: showWidget,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    createOrUpdate(context, widget.postDocument);
                  },
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () {
                    deletePost(context, widget.postDocument.id);
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          );
        }
        return const SizedBox(
          height: 15,
          width: 15,
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}