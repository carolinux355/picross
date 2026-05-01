
abstract class BaseManager {
  abstract final List<Type> dependencies;
  Future initialize(List<BaseManager> managers);
  bool didInitialize = false;
}
