
import 'package:autismx/screens/activities/puzzle/src/ui/global/widgets/up_to_down.dart';
import 'package:autismx/shared/local/colors.dart';
import 'package:flutter/material.dart';





Future<bool> showConfirmDialog(BuildContext context) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (context) {
   
    
      return Center(
        child: UpToDown(
          child: Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color:  lightColor,
            child: SizedBox(
              width: 320,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.scale(
                    scale: .8,
                    child: Image.asset(
                      'assets/images/confirm.png',
                      width: 200,
                      height: 120,
                    ),
                  ),
                  Text(
                    "Are you sure?",
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text(
                      'Do you really want to restart the current puzzle',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () => Navigator.pop(
                            context,
                            true,
                          ),
                          child: Text('YES'),
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 1,
                        color: ( darkColor).withOpacity(0.2),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('NO'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
  return result ?? false;
}
