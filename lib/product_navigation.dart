import 'package:canal_life/pages.dart';
import 'package:canal_life/product_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod/riverpod.dart';

final productNavigatorKey = Provider<GlobalKey<NavigatorState>>((_) => GlobalKey<NavigatorState>());

class ProductDelegate extends RouterDelegate<ProductRoute>
    with PopNavigatorRouterDelegateMixin<ProductRoute>, ChangeNotifier {
  final ProviderReference ref;

  ProductDelegate(this.ref);

  @override
  Widget build(BuildContext context) => Navigator(
        key: navigatorKey,
        pages: ref.watch(productStateNotifierProvider),
        onPopPage: (route, result) {
          final isSuccess = route.didPop(result);
          ref.read(productStateNotifierProvider.notifier).pop();
          return isSuccess;
        },
      );
  @override
  GlobalKey<NavigatorState>? get navigatorKey => ref.read(productNavigatorKey);

  @override
  Future<void> setNewRoutePath(ProductRoute configuration) async {}
}

typedef ProductPage = MaterialPage<void>;

typedef PageKey = ValueKey<String>;

const productProductPage = ProductPage(key: PageKey('product'), child: Product());
const detailsProductPage = ProductPage(key: PageKey('details'), child: Description());
const technicalProductPage = ProductPage(key: PageKey('technical'), child: TechnicalData());

final productStateNotifierProvider =
    StateNotifierProvider<ProductStateNotifier, List<ProductPage>>((_) => ProductStateNotifier());

class ProductStateNotifier extends StateNotifier<List<ProductPage>> {
  ProductStateNotifier() : super([productProductPage]);

  void details() => state = [productProductPage, detailsProductPage];
  void technical() => state = [productProductPage, technicalProductPage];
  void pop() => state = state..removeLast();
}

class ProductInfoParser extends RouteInformationParser<ProductRoute> {
  @override
  Future<ProductRoute> parseRouteInformation(RouteInformation routeInformation) =>
      SynchronousFuture(const ProductProductRoute());
}
