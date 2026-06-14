import 'package:basic/generated/persistence/GameState.pb.dart';
import 'package:basic/persistence/game_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// A full-screen dialog that asks the player to name their ship.
///
/// Usage:
/// showDialog(context: context, builder: (_) => NameShipWidget(onConfirmed: (name) { ... }));
class NameShipWidget extends StatefulWidget implements PreferredSizeWidget {
  final String initialName;
  final ValueChanged<String> onConfirmed;

  NameShipWidget({Key? key, this.initialName = '', required this.onConfirmed}) : super(key: key);

  @override
  _NameShipWidgetState createState() => _NameShipWidgetState();

  // PreferredSizeWidget requires this; not used but provided for compatibility
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _NameShipWidgetState extends State<NameShipWidget> {
  late TextEditingController _controller;
  static const kMaxNameLength = 15;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialName);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _confirm() {
    final name = _controller.text.trim();
    if (name.isEmpty) return;
    if (name.length > kMaxNameLength) return;
    widget.onConfirmed(name);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final gameStateManager = context.read<GameStateManager>();

    return Scaffold(
      backgroundColor: Colors.black54,
      body: SafeArea(
        child: SimpleDialog(
          insetPadding: EdgeInsets.zero,
          contentPadding: const EdgeInsets.all(16.0),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Name your ship',
                textAlign: TextAlign.center,
              ),
            ),
            TextField(
              controller: _controller,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                hintText: 'Enter ship name',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => _confirm(),
            ),
            const SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Visibility(
                  visible: gameStateManager.gameState.ship.hasShipName(),
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _confirm,
                  child: const Text('Confirm'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
