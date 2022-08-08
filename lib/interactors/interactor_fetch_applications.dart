import 'package:hpos_app_store/hpos_app_store.dart';
import 'package:hpos_appstore/mappers/product_mapper.dart';
import 'package:hpos_appstore/providers/library_providers/library_provider.dart';

class InteractorFetchApps {
  Future requestAllApps(LibraryProvider provider) async {
    var productMapper = ProductMapper();

    var apps = await listAvailableApplications()
        .then((applications) => applications.map((app) => productMapper.productFromDto(app)));

    provider.products.value = apps.toList();
  }
}
