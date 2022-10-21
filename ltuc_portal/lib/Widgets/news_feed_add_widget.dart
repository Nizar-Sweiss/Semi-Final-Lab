import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ltuc_portal/utility/utility.dart';
import 'package:ltuc_portal/widgets/widgets.dart';

final TextEditingController _titleController = TextEditingController();
final TextEditingController _descriptionController = TextEditingController();
Future<void> createOrUpdate(context,
    [DocumentSnapshot? documentSnapshot]) async {
  String action = 'create';
  if (documentSnapshot != null) {
    action = 'update';
    _titleController.text = documentSnapshot['title'];
    _descriptionController.text = documentSnapshot['description'];
  }
  await showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultFormField(
            textHint: "Title",
            controller: _titleController,
          ),
          DefaultFormField(
            textHint: "Description",
            controller: _descriptionController,
          ),
          IconButton(
            icon: const Icon(Icons.save),
            iconSize: 20,
            onPressed: () async {
              if (_titleController.text.isEmpty ||
                  _descriptionController.text.isEmpty) return;
              if (action == 'create') {
                await news.add(
                  {
                    "user": auth.currentUser?.uid,
                    "title": _titleController.text,
                    "description": _descriptionController.text,
                    "createdAt": Timestamp.now(),
                    "edited": false,
                  },
                );
              }
              if (action == 'update') {
                await news.doc(documentSnapshot!.id).update(
                  {
                    "title": _titleController.text,
                    "description": _descriptionController.text,
                    "edited": true,
                  },
                );
              }
              _titleController.text = '';
              _descriptionController.text = '';
            },
          ),
        ],
      );
    },
  );
}
