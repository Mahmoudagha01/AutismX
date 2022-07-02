import 'package:autismx/screens/activities/puzzle/src/ui/pages/game/controller/game_controller.dart';
import 'package:autismx/screens/activities/puzzle/src/ui/pages/game/controller/game_state.dart';
import 'package:autismx/screens/activities/puzzle/src/ui/pages/game/widgets/puzzle_tile.dart';
import 'package:autismx/shared/local/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PuzzleInteractor extends StatelessWidget {
  const PuzzleInteractor({Key key}) : super(key: key);

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
          final tileSize = constraints.maxWidth / state.crossAxisCount;
          final puzzle = state.puzzle;

          return AbsorbPointer(
            absorbing: state.status != GameStatus.playing,
            child: Stack(
              children: puzzle.tiles
                  .map(
                    (e) => PuzzleTile(
                      tile: e,
                      size: tileSize,
                      gameStatus: state.status,
                      showNumbersInTileImage: state.crossAxisCount > 4,
                      onTap: () => controller.onTileTapped(e),
                      imageTile: puzzle.segmentedImage != null
                          ? puzzle.segmentedImage[e.value - 1]
                          : null,
                    ),
                  )
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}
