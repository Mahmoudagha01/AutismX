import 'package:autismx/screens/BNB/screens/appstates.dart';
import 'package:autismx/screens/BNB/screens/screens_controller.dart';
import 'package:flutter/material.dart';
import 'package:autismx/screens/surveys/configs/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Screens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AppCubit.get(context);

            return Scaffold(
              body: cubit.screens[cubit.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                selectedItemColor: ColorManager.blue,
                unselectedItemColor: ColorManager.greyFont,
                onTap: (index) {
                  
                  cubit.changeBottomNavBar(index);
                },
                items: cubit.bottomItems,
              ),
            );
          }),
    );
  }
}
