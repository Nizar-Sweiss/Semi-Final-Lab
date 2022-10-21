import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

/// Creating a reference to the collection called news-feed and then creating a query that orders the
/// collection by the createdAt field in descending order.
final CollectionReference news =
    FirebaseFirestore.instance.collection('news-feed');
final Query newsQuery = news.orderBy('createdAt', descending: true);

/// Creating a reference to the collection called users.
final CollectionReference users =
    FirebaseFirestore.instance.collection('users');
