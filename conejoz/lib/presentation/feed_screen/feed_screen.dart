// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  /* List<String> _dreamers = [];

 
 
  @override
  void initState() {
    super.initState();
    readData();
  }

   Future<void> readData() async {
    final QuerySnapshot<Map<String, dynamic>> event =
        await FirebaseFirestore.instance.collection("rabbits").get();
    final List<String> dreamers = [];
    for (var doc in event.docs) {
      dreamers.add("${doc.id} => ${doc.data()}");
    }
    setState(() {
      _dreamers = dreamers;
    });
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Dreamscape"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello dreamer',
            ),
            Text(
              'Here you will see other user\'s dreams:',
            ),
            SizedBox(height: 16),
            /* Expanded(
              child: ListView.builder(
                itemCount: _dreamers.length,
                itemBuilder: (context, index) {
                  return Text(_dreamers[index]);
                },
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
