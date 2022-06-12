import 'package:autismx/screens/BNB/screens/screens_controller.dart';
import 'package:autismx/screens/common/profile_cubit.dart';
import 'package:autismx/screens/parent/sing_in/signin_view.dart';
import 'package:autismx/shared/local/colors.dart';
import 'package:autismx/shared/network/dio/profile_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget defaultButton1({
  Color background = ColorManager.blue,
  bool isUpperCase = true,
  double radius = 30,
  @required Function function,
  @required String text,
}) =>
    Container(
      width: 130,
      height: 50.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );

Widget CustomAppBar(
    {BuildContext context, GlobalKey<ScaffoldState> scaffoldkey}) {
  return Stack(
    children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: 10,
        color: const Color.fromRGBO(236, 240, 243, 1),
      ),
      SvgPicture.asset("assets/images/appbar.svg"),
      Positioned(
        left: 25,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          height: 90,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/header.png"),
            ),
          ),
        ),
      ),
      Positioned(
        right: 10,
        child: IconButton(
          onPressed: () {
            scaffoldkey.currentState.openEndDrawer();
          },
          icon: const Icon(
            Icons.segment,
            size: 40,
            color: ColorManager.blue,
          ),
        ),
      )
    ],
  );
}

Widget fullAppbar(
    {BuildContext context, GlobalKey<ScaffoldState> scaffoldkey}) {
  return Stack(
    children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: 10,
        color: const Color.fromRGBO(236, 240, 243, 1),
      ),
      SvgPicture.asset("assets/images/Path1.svg"),
      Positioned(
        top: 0,
        left: MediaQuery.of(context).size.width * 0.32,
        child: SizedBox(
            width: 140,
            height: 100,
            child: Image.asset("assets/images/header.png")),
      ),
      Positioned(
        right: 10,
        child: IconButton(
          onPressed: () {
            scaffoldkey.currentState.openEndDrawer();
          },
          icon: const Icon(
            Icons.segment,
            size: 40,
            color: ColorManager.blue,
          ),
        ),
      ),
      IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: ColorManager.blue,
          ))
    ],
  );
}

Widget defaultContinueAsButton({
  Color background = ColorManager.blue,
  bool isUpperCase = true,
  double radius = 10,
  @required Function function,
  @required String text,
}) =>
    Container(
      width: 200,
      height: 50.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );

Widget defaultTextButton({
  @required Function function,
  @required Text text,
}) =>
    TextButton(onPressed: function, child: text);

Widget defaultFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  bool isPassword = false,
  @required Function validate,
  @required String label,
  @required IconData prefix,
  IconData suffix,
  Function suffixPressed,
  bool isClickable = true,
  Function onChange,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      validator: validate,
      onChanged: onChange,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
void navigateAndFinish(
  context,
  widget,
) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) {
        return false;
      },
    );

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    @required Key key,
    @required this.text,
    @required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialButton(
        onPressed: onClicked,
        color: Theme.of(context).primaryColor,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      );
}

Widget CustombackAppBar(BuildContext context, Function back) {
  return SafeArea(
    child: Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 20,
          color: const Color.fromRGBO(236, 240, 243, 1),
        ),
        Positioned(child: SvgPicture.asset("assets/images/Path1.svg")),
        Positioned(
          top: 0,
          left: MediaQuery.of(context).size.width * 0.32,
          child: SizedBox(
              width: 140,
              height: 100,
              child: Image.asset("assets/images/header.png")),
        ),
        IconButton(
            onPressed: back,
            icon: const Icon(
              Icons.arrow_back,
              color: ColorManager.blue,
            ))
      ],
    ),
  );
}

Widget myDrawer(BuildContext context, Function tab1, Function tab2,
    Function tab3, Function tab4, Function tab5, Function tab6) {
  return Drawer(
    child: SafeArea(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/drawer1.png"),
                    fit: BoxFit.fill)),
            child: Stack(
              children: [
                Positioned(
                  top: 90,
                  left: 50,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    child: CircleAvatar(
                      radius: 48,
                      backgroundImage: NetworkImage(
                        ProfileCubit.get(context).parentProfile.childImage,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 27,
                        color: Colors.white,
                      )),
                  right: 0,
                  top: 0,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          ListTile(
            onTap: tab1,
            leading: const Icon(
              Icons.person_outline,
              size: 30,
            ),
            title: const Text(
              'My Profile',
              style: TextStyle(fontSize: 25, color: ColorManager.greyFont),
            ),
            selectedTileColor: Colors.blueGrey,
          ),
          ListTile(
            onTap: tab2,
            leading: const Icon(
              Icons.hub_outlined,
              size: 30,
            ),
            title: const Text(
              'Centers',
              style: TextStyle(fontSize: 25, color: ColorManager.greyFont),
            ),
          ),
          ListTile(
            onTap: tab3,
            leading: const Icon(
              Icons.receipt_long_sharp,
              size: 30,
            ),
            title: const Text(
              'Reports',
              style: TextStyle(fontSize: 25, color: ColorManager.greyFont),
            ),
            selectedTileColor: Colors.blueGrey,
          ),
          ListTile(
            onTap: tab4,
            leading: const Icon(
              Icons.feedback_outlined,
              size: 30,
            ),
            title: const Text(
              'FeedBack',
              style: TextStyle(fontSize: 25, color: ColorManager.greyFont),
            ),
            selectedTileColor: Colors.blueGrey,
          ),
          ListTile(
            onTap: tab5,
            leading: const Icon(
              Icons.info_outlined,
              size: 30,
            ),
            title: const Text(
              'About Autismx',
              style: TextStyle(fontSize: 25, color: ColorManager.greyFont),
            ),
            selectedTileColor: Colors.blueGrey,
          ),
          ListTile(
            onTap: () {
              ProfileDioHelper.logout().then((response) {
                AppCubit.get(context).clearData();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInParentLayout()));
              }).catchError((error) {
                print(error.toString());
              });
            },
            leading: const Icon(
              Icons.logout,
              size: 30,
            ),
            title: const Text(
              'Log Out',
              style: TextStyle(fontSize: 25, color: ColorManager.greyFont),
            ),
            selectedTileColor: Colors.blueGrey,
          ),
        ],
      ),
    ),
  );
}
