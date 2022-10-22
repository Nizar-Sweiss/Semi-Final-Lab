import 'package:flutter/material.dart';
import 'package:ltuc_portal/utility/utility.dart';

Future<void> deletePost(context, String noteID) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.grey.shade900,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: SizedBox(
          height: 300,
          width: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Are you sure you wan't to delete this post?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade600,
                      fixedSize: const Size(100, 50),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Cancel"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      fixedSize: const Size(100, 50),
                    ),
                    onPressed: () {
                      news.doc(noteID).delete();
                      Navigator.of(context).pop();
                    },
                    child: const Text("Delete"),
                  )
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}