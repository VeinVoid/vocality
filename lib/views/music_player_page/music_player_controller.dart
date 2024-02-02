import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class MusicPlayerController extends GetxController {
  AudioPlayer audioPlayer = AudioPlayer();
  RxBool isPlaying = false.obs;

  Future<void> playMusic(url) async {
    await audioPlayer.play(url);
    isPlaying.value = true;
  }

  Future<void> pause() async {
    await audioPlayer.pause();
    isPlaying.value = false;
  }

  Future<void> stop() async {
    await audioPlayer.stop();
    isPlaying.value = false;
  }
}