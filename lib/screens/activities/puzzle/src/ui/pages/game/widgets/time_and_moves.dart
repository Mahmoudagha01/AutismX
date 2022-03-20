
import 'package:autismx/screens/activities/puzzle/generated/l10n.dart';
import 'package:autismx/screens/activities/puzzle/src/ui/global/widgets/max_text_scale_factor.dart';
import 'package:autismx/screens/activities/puzzle/src/ui/pages/game/controller/game_controller.dart';
import 'package:autismx/screens/activities/puzzle/src/ui/utils/time_parser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// widget to show the time and the moves counter
class TimeAndMoves extends StatelessWidget {
  const TimeAndMoves({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w600,
    );

    final time = Provider.of<GameController>(context, listen: false).time;
    return MaxTextScaleFactor(
      max: 1,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 500,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ValueListenableBuilder<int>(
              valueListenable: time,
              builder: (_, time, icon) {
                return Row(
                  children: [
                    icon,
                    Text(
                      " ${parseTime(time)}",
                      style: textStyle,
                    ),
                  ],
                );
              },
              child: const Icon(
                Icons.lock_clock_outlined,
                size: 25,
              ),
            ),
            Selector<GameController, int>(
              builder: (_, moves, icon) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    icon,
                    const SizedBox(width: 5),
                    Text(
                      "$moves ${S.current.movements}",
                      style: textStyle,
                    ),
                  ],
                );
              },
              selector: (_, controller) => controller.state.moves,
              child: const Icon(
                Icons.multiple_stop_rounded,
                size: 27,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
