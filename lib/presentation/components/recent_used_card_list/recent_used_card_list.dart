import 'package:flutter/material.dart';

class RecentUsedCardList extends StatefulWidget {
  const RecentUsedCardList({super.key});

  @override
  State<RecentUsedCardList> createState() => _RecentUsedCardListState();
}

class _RecentUsedCardListState extends State<RecentUsedCardList> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Card(
            child: ListTile(
              title: Text('sample1'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('sample2'),
            ),
          ),
        ],
      ),
    );
  }
}
