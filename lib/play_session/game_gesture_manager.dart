import 'package:basic/math/constant_vector.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

// manage the more complex gesture types needed for core picross gameplay
// callbacks: tapReceived(index), dragReceived(index)
class GameGestureManager extends StatefulWidget {
  final Widget child;
  final Function(int)? onTapReceived;
  final Function(int)? onDragReceived;
  final double cellSize;
  final ConstantVector2 gridSize;

  const GameGestureManager({
    super.key,
    required this.child,
    required this.cellSize,
    required this.gridSize,
    this.onTapReceived,
    this.onDragReceived,
  });

  @override
  State<GameGestureManager> createState() => _GameGestureManagerState();
}

class _GameGestureManagerState extends State<GameGestureManager> {
  final Logger logger = Logger('GameGestureManager');

  final List<int> _targetedIndices = [];

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: _onPointerDown,
      onPointerMove: _onPointerMove,
      onPointerUp: _onPointerUp,
      onPointerCancel: _onPointerCancel,
      child: widget.child
    );
  }

  void _onPointerDown(PointerDownEvent args) {
    int index = _getIndexFromLocalPosition(args.localPosition);
    if (index >= 0 && !_targetedIndices.contains(index))
    {
      _targetedIndices.add(index);
      widget.onTapReceived!(index);
    }
  }

  void _onPointerMove(PointerMoveEvent args) {
    int index = _getIndexFromLocalPosition(args.localPosition);
    if (index >= 0 && !_targetedIndices.contains(index))
    {
      _targetedIndices.add(index);
      widget.onDragReceived!(index);
    }
  }

  void _onPointerUp(PointerUpEvent args) {
    _onGestureEnd();
  }
  void _onPointerCancel(PointerCancelEvent args) {
    _onGestureEnd();
  }

  void _onGestureEnd() {
    _targetedIndices.clear();
  }

  int _getIndexFromLocalPosition(Offset localPosition) {
    // offset is from top left of grid
    int x = (localPosition.dx / widget.cellSize).floor();
    int y = (localPosition.dy / widget.cellSize).floor();

    if (x < 0 || y < 0 || x >= widget.gridSize.x || y >= widget.gridSize.y) {
      // out of bounds
      return -1;
    }

    int index = (y * widget.gridSize.x + x).toInt(); 
    return index;
  }
}