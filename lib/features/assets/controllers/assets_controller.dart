import 'dart:io';
import 'package:archive/archive_io.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class AssetController extends GetxController {

  var isLoading = false.obs;
  var assetsPath = "".obs;

  Future<void> initAssets() async {
    isLoading.value = true;
    await prepareAssets();
    assetsPath.value = await _getAppDirPath();
    print("Assets stored at: $assetsPath");

    isLoading.value = false;
  }

  Future<void> prepareAssets() async {
    final already = await isAlreadyDownloaded();
    if (!already) {
      await downloadAndExtractAssets();
    }
  }

  final String zipUrl =
      "https://violet-goat-729461.hostingersite.com/Blossom%20Kids/assets.zip";
  final String folderName = "blossom_assets";

  Future<String> _getAppDirPath() async {
    final dir = await getApplicationDocumentsDirectory();
    final path = "${dir.path}/$folderName";
    return path;
  }
  //if another file uses
  // Future<String> getAssetsPath() async {
  //   return await _getAppDirPath();
  // }


  Future<bool> isAlreadyDownloaded() async {
    final path = await _getAppDirPath();
    final dir = Directory(path);
    print("assets Already exits? = ${dir.existsSync() && dir.listSync().isNotEmpty}");
    return dir.existsSync() && dir.listSync().isNotEmpty;
  }

  Future<void> downloadAndExtractAssets() async {
    print("Start downloadAndExtractAssets");
    final path = await _getAppDirPath();
    final dir = Directory(path);

    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }
    final response = await http.get(Uri.parse(zipUrl));
    final bytes = response.bodyBytes;

    final zipFile = File("$path/assets.zip");
    await zipFile.writeAsBytes(bytes);

    final archive = ZipDecoder().decodeBytes(bytes);
    extractArchiveToDisk(archive, path);

    await zipFile.delete();

    print("Finish downloadAndExtractAssets");

  }
}
