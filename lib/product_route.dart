import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_route.freezed.dart';

@freezed
class ProductRoute with _$ProductRoute {
  const factory ProductRoute.product() = ProductProductRoute;
  const factory ProductRoute.details() = DetailsProductRoute;
  const factory ProductRoute.technicalData() = TechnicalDataProductRoute;
}
