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
      backgroundColor: white,
      appBar: AppBarWidget(context),
      body: Column(
        children: [
          // Text(auth.currentUser?.uid.toString() ?? "User not found."),
          const NewsFeedWidget(),
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
