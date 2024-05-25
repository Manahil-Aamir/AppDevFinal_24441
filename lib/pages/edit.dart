import 'package:appdevfinal/models/todo.dart';
import 'package:appdevfinal/pages/add.dart';
import 'package:appdevfinal/pages/display.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Edit extends StatefulWidget {
  final ToDo todo;
  final String documentId;

  Edit({
    Key? key,
    required this.todo,
    required this.documentId,
  }) : super(key: key);

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  final _nameController = TextEditingController();
  final _titleController = TextEditingController();
  final _detailController = TextEditingController();

  @override
  void initState() {
    _nameController.text = widget.todo.name;
    _titleController.text = widget.todo.title;
    _detailController.text = widget.todo.description;
  }

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _updateData(String documentId) async {
    try {
      await _firestore.doc('todos/$documentId').update({
        'name': _nameController.text,
        'title': _titleController.text,
        'description': _detailController.text,
      });
      print('Data updated in Firestore');
    } catch (error) {
      print('Error updating data in Firestore: $error');
    }
  }


  Future<void> initialize() async {
    _firestore = FirebaseFirestore.instance;
    final CollectionReference Todo = _firestore.collection('todos');
  }

  void init() {
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EDIT'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const SizedBox(height: 140),
              TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'NAME',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF7B66),
                    ),
                  )),
              const SizedBox(height: 20),
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'TITLE',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFF7B66),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _detailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'DETAIL',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFF7B66),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFFFF7B66)),
                ),
                onPressed: () {
                    _updateData(widget.documentId);
                    FocusScope.of(context).unfocus();
                },
                child: const Text(
                  'UPDATE',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFFFF7B66)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Display()),
                  );
                },
                child: const Text(
                  'VIEW DETAILS',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
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