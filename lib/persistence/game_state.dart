import 'dart:io';
import 'package:basic/constants.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';
import 'package:basic/generated/persistence/GameState.pb.dart';

class GameStateManager {
  late String filePath;
  late GameState gameState;
  final Logger logger = Logger('GameStateManager');

  GameStateManager() {
    initialize();
  }

  Future initialize() async {
    filePath = await _getPersistentDataPath();
    gameState = (await _readGameState()) ?? GameState();
  }

  Future<String> _getPersistentDataPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path + Constants.PERSISTENT_FILE_NAME;
  }

  Future<GameState?> _readGameState() async {
    final file = File(filePath);

    if (!await file.exists()) {
      return null;
    }

    final contents = await file.readAsBytes();
    return GameState.fromBuffer(contents);
  }

  Future<void> save() async {
    logger.info('saving game data to $filePath!');
    final file = File(filePath);
    file.create();
    file.writeAsBytes(gameState.writeToBuffer());
  }
}