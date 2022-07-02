import 'dart:async';
import 'package:autismx/screens/BNB/activity/attentiontodetails.dart';
import 'package:autismx/screens/activities/puzzle/src/domain/models/move_to.dart';
import 'package:autismx/screens/activities/puzzle/src/ui/pages/game/controller/game_controller.dart';
import 'package:autismx/screens/activities/puzzle/src/ui/pages/game/widgets/background.dart';
import 'package:autismx/screens/activities/puzzle/src/ui/pages/game/widgets/game_buttons.dart';
import 'package:autismx/screens/activities/puzzle/src/ui/pages/game/widgets/puzzle_interactor.dart';
import 'package:autismx/screens/activities/puzzle/src/ui/pages/game/widgets/puzzle_options.dart';
import 'package:autismx/screens/activities/puzzle/src/ui/pages/game/widgets/time_and_moves.dart';
import 'package:autismx/screens/activities/puzzle/src/ui/pages/game/widgets/winner_dialog.dart';
import 'package:autismx/screens/activities/puzzle/src/ui/utils/responsive.dart';
import 'package:autismx/shared/local/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class GameView extends StatelessWidget {
  const GameView({Key key}) : super(key: key);

  void _onKeyBoardEvent(BuildContext context, RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      final moveTo = event.logicalKey.keyLabel.moveTo;
      if (moveTo != null) {
        context.read<GameController>().onMoveByKeyboard(moveTo);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final width = responsive.width;
    return ChangeNotifierProvider(
      create: (_) {
        final controller = GameController();
        controller.onFinish.listen(
          (_) {
            Timer(
              const Duration(
                milliseconds: 200,
              ),
              () {
                showWinnerDialog(
                  context,
                  moves: controller.state.moves,
                  time: controller.time.value,
                );
              },
            );
          },
        );
        return controller;
      },
      builder: (context, child) => RawKeyboardListener(
        autofocus: true,
        includeSemantics: false,
        focusNode: FocusNode(),
        onKey: (event) => _onKeyBoardEvent(context, event),
        child: child,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: OrientationBuilder(
            builder: (_, orientation) {
              final isPortrait = orientation == Orientation.portrait;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustombackAppBar(
                    context,
                    () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AttentionToDetails()));
                    },
                  ),
                  Expanded(
                    child: LayoutBuilder(
                      builder: (_, constraints) {
                        final height = constraints.maxHeight;
                        final puzzleHeight =
                            (isPortrait ? height * 0.45 : height * 0.5)
                                .clamp(250, 700)
                                .toDouble();
                        final optionsHeight =
                            (isPortrait ? height * 0.25 : height * 0.2)
                                .clamp(120, 200)
                                .toDouble();

                        return SizedBox(
                          height: height,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: optionsHeight,
                                  child: PuzzleOptions(
                                    width: width,
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.1,
                                ),
                                const TimeAndMoves(),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: SizedBox(
                                    height: puzzleHeight,
                                    child: const AspectRatio(
                                      aspectRatio: 1,
                                      child: PuzzleInteractor(),
                                    ),
                                  ),
                                ),
                                const GameButtons(),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
