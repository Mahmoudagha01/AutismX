import 'package:autismx/screens/activities/Emotion/src/ui/pages/game/controller/game_controller.dart';
import 'package:autismx/screens/activities/Emotion/src/ui/pages/game/controller/game_state.dart';
import 'package:autismx/shared/local/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmotionInteractor extends StatelessWidget {
  const EmotionInteractor({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: lightColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(4),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final controller = context.watch<GameController>();
          final state = controller.state;
          final tileSize = constraints.minWidth / state.crossAxisCount;
          final puzzle = state.puzzle;

          return Stack(
            children: puzzle.tiles
                .map((e) => puzzle.image != null
                    ? Image.asset(
                        puzzle.image.gifPath,
                        fit: BoxFit.cover,
                        height: 400,
                      )
                    : Image.asset(
                        "assets/images/start1.gif",
                        fit: BoxFit.cover,
                        height: 400,
                      ))
                .toList(),
          );
        },
      ),
    );
  }
}
