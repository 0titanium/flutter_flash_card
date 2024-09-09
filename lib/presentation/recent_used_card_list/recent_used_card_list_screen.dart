import 'package:flutter/material.dart';

class RecentUsedCardListScreen extends StatefulWidget {
  const RecentUsedCardListScreen({super.key});

  @override
  State<RecentUsedCardListScreen> createState() => _RecentUsedCardListScreenState();
}

class _RecentUsedCardListScreenState extends State<RecentUsedCardListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('플래시 카드'),
        centerTitle: true,
      ),
      body: const Padding(
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
      ),
    );
  }
}
