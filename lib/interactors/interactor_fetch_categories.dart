import 'package:hpos_app_store/hpos_app_store.dart';
import 'package:hpos_appstore/providers/library_providers/library_provider.dart';

class InteractorFetchCategories {
   Future requestAllCategories(LibraryProvider provider) async {

     final categories = ['All'];
     categories.addAll(await getHomeCategories().then((categories) => categories));

     provider.categories.value = categories;
  }
}
