import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:vocality/view/vw_login.dart';
import 'package:vocality/view/vw_main.dart';
import 'package:vocality/view/vw_on_boarding.dart';
import 'package:vocality/view/vw_player.dart';
import 'package:vocality/view/vw_register.dart';

class RouteConfig{
  final routes = [
    GetPage(
      name: '/', 
      page: () => MainPage(),
      title: 'Vocality'
    ),
    GetPage(
      name: '/onboard', 
      page: () => OnBoadringPage(),
      title: 'On Boarding'
    ),
    GetPage(
      name: '/register', 
      page: () => RegisterPage(),
      title: 'Register'
    ),
    GetPage(
      name: '/login', 
      page: () => LoginPage(),
      title: 'Login'
    ),
    GetPage(
      name: '/player', 
      page: () => PlayerPage(),
      title: 'Music Player'
    ),
  ];
}