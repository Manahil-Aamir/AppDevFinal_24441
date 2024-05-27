
// import 'package:appdevfinal/models/todo.dart';
// import 'package:appdevfinal/pages/add.dart';
// import 'package:appdevfinal/pages/edit.dart';
// import 'package:appdevfinal/providers/display_provider.dart';
// import 'package:appdevfinal/providers/todo_provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class Display extends ConsumerStatefulWidget {
//   const Display({super.key});

//   @override
//   ConsumerState<Display> createState() => _DisplayState();
// }

// class _DisplayState extends ConsumerState<Display> {
//   final user = FirebaseAuth.instance.currentUser!;


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           ElevatedButton(
//               onPressed: () {
//                 _auth.googleSignOut(context);
//               },
//               child: const Text("Logout")),
//           Expanded(
//             child: Consumer(
//               builder: (context, ref, child) {
//                 final todosAsyncValue = ref.watch(todosStreamProvider);

//                 return todosAsyncValue.when(
//                   data: (todos) {
//                     if (todos.isEmpty) {
//                       return const Center(
//                         child: Text('No data found'),
//                       );
//                     }

//                     return ListView.builder(
//                       itemCount: todos.length,
//                       itemBuilder: (context, index) {
//                         ToDo toDo = todos[index];

//                         return ListTile(
//                           title: Row(
//                             children: [
//                               Text(toDo.title),
//                               const Spacer(),
//                               Text(toDo.name),
//                             ],
//                           ),
//                           subtitle: Column(
//                             children: [
//                               Text(toDo.description),
//                               Container(
//                                 width: 10,
//                                 color: Colors.white,
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   IconButton(
//                                     onPressed: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) => Edit(
//                                                 todo: toDo,
//                                                 documentId: toDo.id)),
//                                       );
//                                     },
//                                     icon: Icon(Icons.edit),
//                                   ),
//                                   IconButton(
//                                     onPressed: () {
//                                       ref
//                                           .read(todoNotifierProvider.notifier)
//                                           .removeData(toDo.id);
//                                     },
//                                     icon: const Icon(Icons.remove),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     );
//                   },
//                   loading: () => const Center(
//                     child: CircularProgressIndicator(),
//                   ),
//                   error: (err, stack) => Center(
//                     child: Text('Error: $err'),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
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
