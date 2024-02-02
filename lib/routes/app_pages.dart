import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:vocality/routes/app_routes.dart';
import 'package:vocality/views/home_page/home_view.dart';
import 'package:vocality/views/music_player_page/music_player_view.dart';

class AppPages{

  static const INITIAL = Route.SPLASHSCREEN_PAGE;

  static final routes = [
    GetPage(
      name: Path.SPLASHSCREEN_PAGE, 
      page: () => HomePage(),
      transition: Transition.noTransition
    ),
    GetPage(
      name: Path.MUISC_PLAYER_PAGE, 
      page: () => MusicPlayerPage(),
      transition: Transition.noTransition
    ),
  ];
}