import 'package:hpos_app_store/hpos_app_store.dart';
import 'package:hpos_appstore/mappers/product_mapper.dart';
import 'package:hpos_appstore/models/product_model.dart';
import 'package:hpos_appstore/providers/library_providers/library_provider.dart';

class InteractorFetchApps {
  Future requestAllApps(LibraryProvider provider) async {
    Iterable<AppMetadata> apps = await listAvailableApplications();
    List<Product> products = [];
    for (var app in apps) {
      products.add(ProductMapper().productFromDto(app));
    }
    provider.products.value = products;
  }
}
