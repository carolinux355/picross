import 'dart:convert';
import 'package:basic/constants.dart';
import 'package:basic/generated/configuration/BaseMessage.pb.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

class GameDataManager {
  late String filePath;
  final Logger logger = Logger('GameDataManager');
  final Map<String, BaseMessage> _data = <String, BaseMessage>{};

  GameDataManager() {
    initialize();
  }

  Future initialize() async {
    filePath = Constants.CONFIGURATION_PATH;
    await _readGameData();
  }

  Future _readGameData() async {
    final assetManifest = await AssetManifest.loadFromAssetBundle(rootBundle);
    final assets = assetManifest.listAssets();
    logger.info('found ${assets.length} assets');

    final textPaths = assets.where((String key) => key.startsWith(filePath) && key.endsWith('.json')).toList();

    final List<String> contents = await Future.wait(textPaths.map((path) => rootBundle.loadString(path)));

    for (String contentsRaw in contents) {
      final contents = jsonDecode(contentsRaw);
      var message = BaseMessage.create()..mergeFromProto3Json(contents);
      _data[message.id] = message;
    }

    logger.info('finished reading ${_data.length} entries from data');
  }

  BaseMessage? getData(String id) {
    if (_data.containsKey(id)) {
      return _data[id];
    }

    return null;
  }
}