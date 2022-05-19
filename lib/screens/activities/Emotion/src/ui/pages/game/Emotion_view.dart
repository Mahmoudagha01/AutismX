
import 'package:audioplayers/audio_cache.dart';
import 'package:autismx/screens/activities/Emotion/src/ui/pages/game/controller/game_controller.dart';
import 'package:autismx/screens/activities/Emotion/src/ui/pages/game/widgets/Emotion_interactor.dart';
import 'package:autismx/screens/activities/Emotion/src/ui/pages/game/widgets/Emotion_options.dart';
import 'package:autismx/screens/activities/Emotion/src/ui/utils/responsive.dart';
import 'package:autismx/shared/local/component.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';







class EmotionView extends StatefulWidget {
  const EmotionView({Key key}) : super(key: key);

  @override
  State<EmotionView> createState() => _EmotionViewState();
}

class _EmotionViewState extends State<EmotionView> {
     var player = AudioCache();
    
@override
  void initState() {
 player.play("sounds/start.mp3");
    super.initState();
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
            
          },
        );
        return controller;
      },
      builder: (context, child) => RawKeyboardListener(
        autofocus: true,
        includeSemantics: false,
        focusNode: FocusNode(),
        
        child: child,
        
      ),
     
     
      child:  Scaffold(
          
          backgroundColor: Colors.white,
          body: SafeArea(
            child: OrientationBuilder(
              builder: (_, orientation) {
                final isPortrait = orientation == Orientation.portrait;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustombackAppBar(context,() {
              Navigator.pop(context);
            },),
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
                                  const Padding(
                                    padding: EdgeInsets.all(20),
                                    child: SizedBox(
                                      height: 400,
                                      child: EmotionInteractor(),
                                    ),
                                  ),
                                 SizedBox(
                                    height: optionsHeight,
                                    child: EmotionOptions(
                                      width: width,
                                    ),
                                  ),
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
