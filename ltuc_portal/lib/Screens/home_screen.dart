import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ltuc_portal/widgets/widgets.dart';
import 'package:ltuc_portal/utility/utility.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        TextButton(
          onPressed: () => FirebaseAuth.instance.signOut(),
          child: const Icon(
            Icons.logout_outlined,
            color: Colors.white,
            size: 36.0,
          ),
        )
      ]),
      body: Column(
        children: [
          Text(auth.currentUser?.uid.toString() ?? "test"),
          const Expanded(
            child: NewsFeedWidget(),
          ),
          IconButton(
            onPressed: () {
              createOrUpdate(context);
            },
            icon: const Icon(
              Icons.add,
            ),
          )
        ],
      ),
    );
  }
}
