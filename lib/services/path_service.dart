import 'dart:io';

import 'package:path_provider/path_provider.dart';

class PathService {
  Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> localFile(String filename) async {
    final path = await localPath;
    return File('$path/$filename');
  }
}
