import 'package:canal_life/product_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final productInfoParser = Provider<ProductInfoParser>((_) => ProductInfoParser());
final productDelegate = Provider<ProductDelegate>((ref) => ProductDelegate(ref));

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return MaterialApp.router(
      routeInformationParser: watch(productInfoParser),
      routerDelegate: watch(productDelegate),
      title: 'Navigating Riverpod',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
