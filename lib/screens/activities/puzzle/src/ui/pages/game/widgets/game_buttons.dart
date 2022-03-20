import 'dart:math';
import 'package:autismx/screens/activities/puzzle/generated/l10n.dart';
import 'package:autismx/screens/activities/puzzle/src/ui/global/widgets/my_text_icon_button.dart';
import 'package:autismx/screens/activities/puzzle/src/ui/pages/game/controller/game_controller.dart';
import 'package:autismx/screens/activities/puzzle/src/ui/pages/game/controller/game_state.dart';
import 'package:autismx/screens/activities/puzzle/src/ui/pages/game/widgets/confirm_dialog.dart';
import 'package:autismx/screens/activities/puzzle/src/ui/utils/responsive.dart';
import 'package:autismx/shared/local/colors.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class GameButtons extends StatelessWidget {
  const GameButtons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<GameController>();
    final state = controller.state;
    final responsive = Responsive.of(context);
    final buttonHeight = responsive.dp(3).clamp(kMinInteractiveDimension, 100).toDouble();

    return Padding(
      padding: const EdgeInsets.all(10).copyWith(
        bottom: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyTextIconButton(
            height: buttonHeight,
            onPressed: () => _reset(context),
            icon: const Icon(
              Icons.replay_rounded,
            ),
            label: state.status == GameStatus.created ? S.current.start : S.current.restart,
          ),
          const SizedBox(width: 20),
          Container(
            decoration: BoxDecoration(
              color: lightColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<int>(
                itemHeight: buttonHeight,
                dropdownColor: (lightColor).withOpacity(0.9),
                borderRadius: BorderRadius.circular(30),
                icon: Padding(
                  padding: const EdgeInsets.only(
                    right: 10,
                  ),
                  child: Transform.rotate(
                    angle: 90 * pi / 180,
                    child: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color:  darkColor,
                    ),
                  ),
                ),
                items: [3, 4, 5, 6]
                    .map(
                      (e) => DropdownMenuItem(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                          ).copyWith(left: 15),
                          child: Text(
                            "${e}x$e ",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: darkColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        value: e,
                      ),
                    )
                    .toList(),
                onChanged: (crossAxisCount) {
                  if (crossAxisCount != null && crossAxisCount != state.crossAxisCount) {
                    controller.changeGrid(
                      crossAxisCount,
                      controller.puzzle.image,
                    );
                  }
                },
                value: state.crossAxisCount,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _reset(BuildContext context) async {
    final controller = context.read<GameController>();
    final state = controller.state;
    if (state.moves == 0 || state.status == GameStatus.solved) {
      controller.shuffle();
    } else {
      final isOk = await showConfirmDialog(context);
      if (isOk) {
        controller.shuffle();
      }
    }
  }
}
