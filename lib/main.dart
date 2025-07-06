import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameStateProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.blue),

        body: Center(
          child: Text(
            name,
            style: TextStyle(fontSize: 34, color: Colors.black),
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final randomNames = List.from(names);
            randomNames.shuffle();
            ref.watch(nameStateProvider.notifier).state = randomNames[0];
          },
          child: const Icon(Icons.refresh),
        ),
      ),
    );
  }
}

List<String> names = ['Alice', 'Bob', 'Charlie'];

final nameStateProvider = StateProvider<String>((ref) {
  return 'Hello, Riverpod!';
});
