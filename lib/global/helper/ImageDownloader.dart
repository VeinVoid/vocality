import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class ImageController extends GetxController {
  final Dio dio = Dio();

  Future downloadAndSaveImage(String url, String filename) async {
    final appStorage = await getApplicationDocumentsDirectory();

    final coverDirectory = Directory('${appStorage.path}/Cover');
    if (!coverDirectory.existsSync()) {
      coverDirectory.createSync();
    }

    final filePath = '${coverDirectory.path}/$filename';
    final file = File(filePath);

    final response = await dio.get(
      url,
      options: Options(
        responseType: ResponseType.bytes,
      ),
    );
    
    final ref = file.openSync(mode: FileMode.write);
    ref.writeFromSync(response.data);
    await ref.close();

    return file;
  }
}
