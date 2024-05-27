// import 'package:appdevfinal/models/todo.dart';
// import 'package:appdevfinal/pages/display.dart';
// import 'package:appdevfinal/providers/todo_provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class Add extends ConsumerStatefulWidget {
//   Add({Key? key}) : super(key: key);

//   @override
//   ConsumerState<Add> createState() => _AddState();
// }

// class _AddState extends ConsumerState<Add>{
//   final _nameController = TextEditingController();
//   final _titleController = TextEditingController();
//   final _detailController = TextEditingController();
//   final _formAdd = GlobalKey<FormState>();

//   @override
//   void initState() {
//     super.initState();
//     final user = FirebaseAuth.instance.currentUser;
//     _nameController.text = user?.displayName ?? '';
//   }

//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('CREATE'),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Form(
//             key: _formAdd,
//             child: Column(
//               children: [
//                 const SizedBox(height: 140),
//                 TextFormField(
//                   controller: _nameController,
//                   decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'NAME',
//                     labelStyle: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFFFF7B66),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 TextFormField(
//                   controller: _titleController,
//                   decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'TITLE',
//                     labelStyle: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFFFF7B66),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter title';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 20),
//                 TextFormField(
//                   controller: _detailController,
//                   decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'DETAIL',
//                     labelStyle: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFFFF7B66),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter description';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFF7B66)),
//                   ),
//                   onPressed: () {
//                     if (_formAdd.currentState?.validate() ?? false) {
//                       final newTodo = ToDo(
//           name: _nameController.text,
//           title: _titleController.text,
//           description: _detailController.text,
//           id: ''
//         );

//         ref.read(todoNotifierProvider.notifier).addData(newTodo);
//                       FocusScope.of(context).unfocus();
//                     }
//                   },
//                   child: const Text(
//                     'ADD',
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFF7B66)),
//                   ),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => Display()),
//                     );
//                   },
//                   child: const Text(
//                     'VIEW DETAILS',
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomAppBar(
//         color: const Color(0xFFFF7B66),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             IconButton(
//               icon: const Icon(
//                 Icons.home,
//                 color: Colors.white,
//                 size: 50,
//               ),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const Display()),
//                 );
//               },
//             ),
//             IconButton(
//               icon: const Icon(
//                 Icons.create,
//                 color: Colors.white,
//                 size: 50,
//               ),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => Add(),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
