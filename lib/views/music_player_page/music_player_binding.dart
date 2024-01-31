import 'package:get/get.dart';
import 'package:vocality/views/music_player_page/music_player_controller.dart';

class MusicPlayerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MusicPlayerController>(() => MusicPlayerController());
  }
}
