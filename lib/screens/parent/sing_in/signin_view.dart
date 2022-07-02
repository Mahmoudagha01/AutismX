import 'package:autismx/screens/BNB/screens/screens.dart';
import 'package:autismx/screens/common/profile_cubit.dart';
import 'package:autismx/screens/common/profile_states.dart';
import 'package:autismx/screens/parent/sing_up/singup_view.dart';
import 'package:autismx/shared/local/colors.dart';
import 'package:autismx/shared/local/component.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/signin_controller.dart';
import 'cubit/singin_states.dart';

class SignInParentLayout extends StatelessWidget {
  const SignInParentLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginScreenStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            ProfileCubit.get(context)
                .emit(ProfileUpdateState(state.signinModel.data.parent));
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Screens()));
          } else {
            print("login Success");
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: formKey,
                  child: Column(children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/Logo.png"),
                        ),
                      ),
                    ),
                    const Text(
                      'Sign In Now',
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
                        suffix: isPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        isPassword: isPassword,
                        suffixPressed: () {
                          isPassword = !isPassword;
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
                            valueFirst = value;
                          },
                        ),
                        const Text(
                          'Remember Me',
                          style: TextStyle(
                              color: ColorManager.greyFont, fontSize: 10),
                        ),
                      ],
                    ),
                    //the whole design collapse
                    const SizedBox(
                      height: 40,
                    ),

                    ConditionalBuilder(
                      builder: (context) => defaultButton1(
                        function: () {
                          if (formKey.currentState.validate()) {
                            LoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text);
                          }
                        },
                        text: 'SIGN IN',
                      ),
                      condition: state is! LoginLoadingState,
                      fallback: (context) =>
                          const Center(child: CircularProgressIndicator()),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: ColorManager.greyFont,
                            fontSize: 14,
                          ),
                        ),
                        defaultTextButton(
                          function: () {
                            navigateAndFinish(context, SingUpParentLayout());
                          },
                          text: Text('Create Account'),
                        ),
                      ],
                    )
                  ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
