
import 'package:flutter/foundation.dart';

abstract class BaseManager extends ChangeNotifier {
  abstract final List<Type> dependencies;
  Future initialize(List<BaseManager> managers);
  Future? postInitialize(List<BaseManager> allManagers) => null;
  bool didInitialize = false;
}
