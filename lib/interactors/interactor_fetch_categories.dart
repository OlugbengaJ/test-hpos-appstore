import 'package:hpos_app_store/hpos_app_store.dart';
import 'package:hpos_appstore/providers/library_providers/library_provider.dart';

class InteractorFetchCategories {
  Future requestAllCategories(LibraryProvider provider) async {
    final categories = ['All'];
    final cats = await getHomeCategories();

    categories.addAll(cats);

    provider.homeCategories.value = [...cats];
    provider.categories.value = categories;
  }
}
