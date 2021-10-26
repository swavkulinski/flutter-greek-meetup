import 'package:canal_life/product_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Product extends StatelessWidget {
  const Product({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => _CustomisedScaffold(
        title: 'Product',
        child: _Product(),
      );
}

class _Product extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) => Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Description'),
              onPressed: () {
                watch(productStateNotifierProvider.notifier).details();
              },
            ),
            ElevatedButton(
              child: const Text('Technical Data'),
              onPressed: () {
                watch(productStateNotifierProvider.notifier).technical();
              },
            ),
          ],
        ),
      );
}

class Description extends StatelessWidget {
  const Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      _CustomisedScaffold(title: 'Description', child: _Description());
}

class _Description extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) => const Center(
        child: Text('Product Description'),
      );
}

class TechnicalData extends StatelessWidget {
  const TechnicalData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      _CustomisedScaffold(child: _TechnicalData(), title: 'Technical Data');
}

class _TechnicalData extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) => const Center(
        child: Text('Success!'),
      );
}

class _CustomisedScaffold extends StatelessWidget {
  final Widget child;
  final String title;

  const _CustomisedScaffold({Key? key, required this.title, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: child,
      );
}
