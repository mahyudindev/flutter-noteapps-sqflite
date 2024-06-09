import 'package:get/get.dart';

import '../modules/add_note/bindings/add_note_binding.dart';
import '../modules/add_note/views/add_note_view.dart';
import '../modules/edit_note/bindings/edit_note_binding.dart';
import '../modules/edit_note/views/edit_note_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADD_NOTE,
      page: () => AddNoteView(),
      binding: AddNoteBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_NOTE,
      page: () => EditNoteView(),
      binding: EditNoteBinding(),
    ),
  ];
}
