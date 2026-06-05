import 'dart:io';
import 'package:basic/constants.dart';
import 'package:basic/game_internals/base_manager.dart';
import 'package:basic/utils/time_utils.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';
import 'package:basic/generated/persistence/GameState.pb.dart';

class GameStateManager extends BaseManager {
  @override List<Type> dependencies = [];

  late String filePath;
  late GameState gameState;
  final Logger logger = Logger('GameStateManager');

  static const int kSaveTimeStepMs = 5000; // save at most once every 0.5s
  DateTime? lastSaveTime;
  Future? scheduledSave;

  GameStateManager();

  @override
  Future initialize(List<BaseManager> managers) async {
    filePath = await _getPersistentDataPath();
    gameState = (await _readGameState()) ?? GameState();
  }

  Future<String> _getPersistentDataPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path + Constants.kPersistentFileName;
  }

  Future<GameState?> _readGameState() async {
    final file = File(filePath);

    if (!await file.exists()) {
      return null;
    }

    try{
      final contents = await file.readAsBytes();
      return GameState.fromBuffer(contents);
    } catch (exception) {
      logger.severe('corrupted save data! deleting blob');
      file.delete();
    }
    
    return null;
  }

  Future<void> save() async {
    if (scheduledSave != null) {
      //logger.info('save already scheduled, skipping save call');
      return;
    }
    if (scheduledSave == null && lastSaveTime != null && TimeUtils.timeSince(TimeUtils.now(), lastSaveTime!).inMilliseconds < kSaveTimeStepMs) {
      // schedule a save in the future
      scheduledSave = Future.delayed(Duration(milliseconds: kSaveTimeStepMs), () 
        { 
          scheduledSave = null;
          save();
        }
      );
      return;
    }

    logger.info('SAVING game data to $filePath!');
    final file = File(filePath);
    file.create();
    file.writeAsBytes(gameState.writeToBuffer());
    lastSaveTime = TimeUtils.now();
  }

  Future<void> clearAllData() async {
    logger.info('clearing game data!');
    final file = File(filePath);
    file.delete();
  }
}