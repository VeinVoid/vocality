import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocality/global/controllers/music_controller.dart';
import 'package:vocality/views/home_page/components/home_component_one.dart';
import 'package:vocality/views/home_page/components/home_component_two.dart';

class HomePage extends StatelessWidget {
  final MusicController musicController = Get.put(MusicController());

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.sizeOf(context).width;
    double height= MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {await musicController.fetchMusicData();},
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: height * 0.05
            ),
            child: Column(
              children: [
                HomeComponentOne(),
                SizedBox(
                  height: height * 0.03,
                ),
                HomeComponentTwo(
                  musicData: musicController.musicDataList
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}