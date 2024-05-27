import 'package:appdevfinal/models/todo.dart';
import 'package:appdevfinal/providers/display_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:appdevfinal/providers/category_provider.dart';
import 'package:intl/intl.dart';

class ItemDisplay extends ConsumerStatefulWidget {
  const ItemDisplay({super.key});

  @override
  ConsumerState<ItemDisplay> createState() => _ItemDisplayState();
}

class _ItemDisplayState extends ConsumerState<ItemDisplay> {
  final selectedCategoryProvider = StateProvider<String>((ref) => 'Shipping');

  String formatPrice(int price) {
    final NumberFormat formatter = NumberFormat('#,###,000.000');
    return formatter.format(price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 40, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: <Widget>[
                Container(
                  height: 38,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Center(
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey[500],
                        ),
                      ),
                      Text(
                        'Search shoes...',
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Consumer(
              builder: (context, ref, child) {
                final categoriesAsyncValue =
                    ref.watch(todosCategoryStreamProvider);
                return categoriesAsyncValue.when(
                  data: (categories) {
                    if (categories.isEmpty) {
                      return const Center(
                        child: Text('No data found'),
                      );
                    }

                    return SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          final category = categories[index];
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                ref
                                    .read(selectedCategoryProvider.notifier)
                                    .state = category;
                              },
                              child: Text(category),
                            ),
                          );
                        },
                      ),
                    );
                  },
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  error: (err, stack) => Center(
                    child: Text('Error: $err'),
                  ),
                );
              },
            ),
            Expanded(
              child: Consumer(
                builder: (context, ref, child) {
                  final selectedCategory = ref.watch(selectedCategoryProvider);
                  final todosAsyncValue =
                      ref.watch(todosStreamProvider(selectedCategory));
                  return todosAsyncValue.when(
                    data: (todos) {
                      if (todos.isEmpty) {
                        return const Center(
                          child: Text('No data found'),
                        );
                      }

                      return ListView.builder(
                        itemCount: todos.length,
                        itemBuilder: (context, index) {
                          ToDo toDo = todos[index];
                          return ListTile(
                            tileColor: Colors.grey[200],
                            title: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      toDo.imageUrl,
                                      width: 80,
                                      height: 80,
                                    ),
                                    const SizedBox(width: 15),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(toDo.name,
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        Text(toDo.description,
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey[600],
                                            )),
                                        Text('Rp ' + formatPrice(toDo.price),
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ],
                                    ),
                                    const Spacer(),
                                    Container(
                                      width: 80,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.green[200],
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Finished',
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(children: [
                                  Text(
                                    'ID.Order',
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    )
                                  ),
                                  const Spacer(),
                                                                    Text(
                                    toDo.id,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    )
                                  ),
                                ],),
                                Row(children: [
                                  Text(
                                    'Total Items',
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    )
                                  ),
                                  const Spacer(),
                                                                    Text(
                                    toDo.total.toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    )
                                  ),
                                ],),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: Icon(Icons.chat_outlined, color: Colors.black)
                                  ),
                                   Container(
                                    width: 100,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: Center(
                                      child: Text(
                                      'View Details',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      )
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 120,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: Center(
                                      child: Text(
                                      'Buy Again',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      )
                                      ),
                                    ),
                                  ),
                                ],)
                              ],
                            ),
                          );
                        },
                      );
                    },
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    error: (err, stack) => Center(
                      child: Text('Error: $err'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.add_home_outlined, color: Colors.grey[700], size: 30),
            Icon(Icons.add_home_outlined, color: Colors.grey[700], size: 30),
            Icon(Icons.add_home_outlined, color: Colors.grey[700], size: 30),
            Icon(Icons.add_home_outlined, color: Colors.grey[700], size: 30),
          ],
        ),
      ),
    );
  }
}
