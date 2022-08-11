
import 'package:hpos_app_store/hpos_app_store.dart';
import 'package:hpos_appstore/models/product_model.dart';

class ProductMapper {
  Product productFromDto(AppMetadata appMetadata) {
    return Product(
      id: appMetadata.id,
      name: appMetadata.label,
      category: appMetadata.category,
      description: appMetadata.description,
      longDescription: appMetadata.longDescription,
      logo: appMetadata.iconUrl,
      price: '0',
      avgRatings: appMetadata.rating.toDouble(),
      numRatings: 34,
    );
  }
}
