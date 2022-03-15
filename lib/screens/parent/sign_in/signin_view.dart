import 'package:autismx/screens/BNB/screens.dart';
import 'package:autismx/screens/parent/sign_up_parent/signup_view.dart';
import 'package:autismx/screens/surveys/configs/colors.dart';
import 'package:autismx/shared/local/component.dart';
import 'package:flutter/material.dart';



import 'signin_controller.dart';

class SignInParentLayout extends StatefulWidget {
  const SignInParentLayout({Key key}) : super(key: key);

  @override
  State<SignInParentLayout> createState() => _SignInParentLayoutState();
}

class _SignInParentLayoutState extends State<SignInParentLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            child: Column(
           
              children: [
               SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image:  AssetImage("assets/images/Logo.png"),
                  ),
                ),
              ),
              const Text(
                'Sing In Now',
                style: TextStyle(
                  color: ColorManager.blueFont,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              defaultFormField(
                  controller: emailController,
                  type: TextInputType.emailAddress,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'email must not be empty';
                    }
                    return null;
                  },
                  label: 'email',
                  prefix: Icons.email_outlined),
              const SizedBox(
                height: 20,
              ),
              defaultFormField(
                  controller: passwordController,
                  type: TextInputType.visiblePassword,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'Password must not be empty';
                    }
                    return null;
                  },
                  label: 'Password',
                  prefix: Icons.lock,
                  suffix:
                      isPassword ? Icons.visibility : Icons.visibility_off,
                  isPassword: isPassword,
                  suffixPressed: () {
                    setState(() {
                      isPassword = !isPassword;
                    });
                  }),
              const SizedBox(
                height: 10,
              ),
              // here is a row where it suppose to be a checkboxListTile but whenever i try to make it
              Row(
                children: [
                  //here is a check box but when i try to make it  is not working
                  Checkbox(
                    activeColor: ColorManager.blue,
                    value: valueFirst,
                    onChanged: (bool value) {
                      setState(() {
                        valueFirst = value;
                      });
                    },
                  ),
                  const Text(
                    'Remember Me',
                    style:
                        TextStyle(color: ColorManager.greyFont, fontSize: 12),
                  ),
                  const Spacer(),
                  defaultTextButton(
                      function: () {},
                      text: const Text(
                        'forget Password?',
                        style: TextStyle(color: ColorManager.greyFont),
                      ))
                ],
              ),
              //the whole design collapse
              const SizedBox(
                height: 40,
              ),
              defaultButton1(
                function: () {
                  if (formKey.currentState.validate()) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Screens()));
                  }
                },
                text: 'SING IN',
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                 [
                  const Text(
                "Don't have an account?",
                style: TextStyle(
                  color: ColorManager.greyFont,
                  fontSize: 14,
                ),
              ),
              defaultTextButton(
                  function: () {
                    navigateAndFinish(context, const SingUpParentLayout());
                  },
                  text: const Text(
                    'Create Account',
                    style:
                        TextStyle(color: ColorManager.blueFont, fontSize: 14),
                  )),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
