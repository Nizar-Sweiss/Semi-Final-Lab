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
          DefaultFormField(textHint: "Title", controller: _titleController),
          const SizedBox(height: 20),
          DefaultFormField(
              textHint: "Description", controller: _descriptionController),
          IconButton(
            icon: const Icon(Icons.save),
            iconSize: 20,
            onPressed: () async {
              final String title = _titleController.text;
              final String description = _descriptionController.text;
              if (_titleController.text.isNotEmpty &&
                  _descriptionController.text.isNotEmpty) {
                if (action == 'create') {
                  await news.add(
                    {
                      "user": auth.currentUser?.uid,
                      "title": title,
                      "description": description,
                      "createdAt": Timestamp.now().seconds,
                    },
                  );
                }
                if (action == 'update') {
                  await news.doc(documentSnapshot!.id).update(
                    {
                      "user": auth.currentUser?.uid,
                      "title": title,
                      "description": description,
                      "createdAt": Timestamp.now().seconds,
                    },
                  );
                }
                _titleController.text = '';
                _descriptionController.text = '';
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      );
    },
  );
}
