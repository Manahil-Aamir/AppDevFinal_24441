import 'package:appdevfinal/methods/google.dart';
import 'package:appdevfinal/models/todo.dart';
import 'package:appdevfinal/pages/add.dart';
import 'package:appdevfinal/pages/edit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Display extends StatefulWidget {
  const Display({super.key});

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  final user = FirebaseAuth.instance.currentUser!;
  final _auth = GoogleSignInProvider();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void remove(String documentId) {
    FirebaseFirestore.instance.collection("todos").doc(documentId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                _auth.googleSignOut(context);
              },
              child: const Text("Logout")),
          Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('todos')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    }

                    if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                      return const Center(
                        child: Text('No data found'),
                      );
                    }
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        // Assuming ToDo is a class you have defined to match your Firestore document structure
                        ToDo toDo =
                            ToDo.fromQuerySnapshot(snapshot.data!.docs[index]);
                        // Create a ListTile for each item
                        return ListTile(
                          title: Row(
                            children: [
                              Text(toDo.title),
                              Spacer(),
                              Text(toDo.name),
                            ],
                          ),
                          subtitle: Column(
                            children: [
                              Text(toDo.description),
                              Container(
                                width: 10,
                                color: Colors.white,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Edit(
                                            todo: toDo, documentId: toDo.id)),
                                  );
                                },
                                icon: Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () {
                                  remove(toDo.id);
                                },
                                icon: Icon(Icons.remove),
                              ),

                              ],)
                            ],
                          ),
                        );
                      },
                    );
                  })),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFFFF7B66),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(
                Icons.home,
                color: Colors.white,
                size: 50,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Display()),
                );
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.create,
                color: Colors.white,
                size: 50,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Add(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
