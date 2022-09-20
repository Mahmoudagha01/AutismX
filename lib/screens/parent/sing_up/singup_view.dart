

import 'package:autismx/screens/parent/sing_in/signin_view.dart';
import 'package:autismx/screens/parent/sing_up/cubit/signup_controller.dart';
import 'package:autismx/screens/surveys/configs/colors.dart';

import 'package:autismx/shared/local/component.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/profile_cubit.dart';
import '../../common/profile_states.dart';
import 'cubit/singup_states.dart';

class SingUpParentLayout extends StatelessWidget {
  SingUpParentLayout({Key key}) : super(key: key);

  var firstNameController = TextEditingController();

  var lastNameController = TextEditingController();

  var addressController = TextEditingController();
  var childNameController = TextEditingController();
  var childAgeController = TextEditingController();
  var childImageController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool isPassword = true;
  bool checkbox = false;
  int childGender = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterScreenStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            ProfileCubit.get(context)
                .emit(ProfileUpdateState(state.signupModel.data));
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const SignInParentLayout()));
          } else if (state is RegisterUploadImageState) {
            childImageController.text = state.imagePath;
          }  else if (state is RegisterErrorState) {
             print(state.error);
          } else {
           print("no");
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        children: [
                          Image(
                            image: const AssetImage('assets/images/Logo.png'),
                            height: MediaQuery.of(context).size.height / 6,
                          ),
                          const Text(
                            'Parent',
                            style: TextStyle(
                                color: ColorManager.blueFont,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          defaultFormField(
                            controller: firstNameController,
                            type: TextInputType.name,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'You must complete this field';
                              }
                              return null;
                            },
                            label: 'First Name',
                            prefix: Icons.person,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          defaultFormField(
                            controller: lastNameController,
                            type: TextInputType.name,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'You must complete this field';
                              }
                              return null;
                            },
                            label: 'Last Name',
                            prefix: Icons.person,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          defaultFormField(
                            controller: addressController,
                            type: TextInputType.streetAddress,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'You must complete this field';
                              }
                              return null;
                            },
                            label: 'Address',
                            prefix: Icons.location_on_rounded,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          defaultFormField(
                            controller: phoneController,
                            type: TextInputType.phone,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'You must complete this field';
                              }
                              return null;
                            },
                            label: 'Phone',
                            prefix: Icons.phone,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          defaultFormField(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'You must complete this field';
                              }
                              return null;
                            },
                            label: 'Email',
                            prefix: Icons.email,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          defaultFormField(
                              controller: passwordController,
                              type: TextInputType.visiblePassword,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'You must complete this field';
                                }
                                return null;
                              },
                              label: 'Password',
                              prefix: Icons.lock,
                              isPassword: isPassword,
                              suffix: isPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              suffixPressed: () {
                                isPassword = !isPassword;
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                          defaultFormField(
                            controller: childNameController,
                            type: TextInputType.text,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'You must complete this field';
                              }
                              return null;
                            },
                            label: 'Child Name',
                            prefix: Icons.child_care_sharp,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          defaultFormField(
                            controller: childAgeController,
                            type: TextInputType.number,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'You must complete this field';
                              }
                              return null;
                            },
                            label: 'Child Age',
                            prefix: Icons.child_care,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          defaultFormField(
                              controller: childImageController,
                              type: TextInputType.url,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'You must complete this field';
                                }
                                return null;
                              },
                              label: 'Child Photo',
                              prefix: Icons.photo,
                              suffix: Icons.upload_rounded,
                              suffixPressed: () {
                                RegisterCubit.get(context).uploadChildImage();
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                          DropdownButtonFormField<int>(
                            items: const [
                              DropdownMenuItem(
                                child: Text("Male"),
                                value: 0,
                              ),
                              DropdownMenuItem(
                                child: Text("Female"),
                                value: 1,
                              ),
                            ],
                            value: childGender,
                            onChanged: (val) {
                              childGender = val;
                            },
                            validator: (value) {
                              if (value != 0 && value != 1) {
                                return 'You must complete this field';
                              }
                              return null;
                            },
                            //borderRadius: BorderRadius.circular(20),
                            decoration: InputDecoration(
                              labelText: "Child Gender",
                              prefixIcon: const Icon(
                                Icons.merge_type,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CheckboxListTile(
                              value: checkbox,
                              title: const Text(
                                'I agree to the term and Condition',
                                style: TextStyle(
                                    color: ColorManager.blueFont, fontSize: 12),
                              ),
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (bool value) {
                                checkbox = value;
                              }),
                          ConditionalBuilder(
                            builder: (context) => defaultButton1(
                              function: () {
                                if (formKey.currentState.validate()) {
                                  RegisterCubit.get(context).userRegister(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                    address: addressController.text,
                                    phone: phoneController.text,
                                    childAge:
                                        int.parse(childAgeController.text),
                                    childGender: childGender,
                                    childName: childNameController.text,
                                  );
                                  //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Screens()));
                                }
                              },
                              text: 'SIGN UP',
                            ),
                            condition: state is! RegisterLoadingState,
                            fallback: (context) => const Center(
                                child: CircularProgressIndicator()),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already have an account',
                                style: TextStyle(
                                    color: ColorManager.greyFont, fontSize: 12),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              defaultTextButton(
                                function: () {
                                  navigateAndFinish(
                                      context, const SignInParentLayout());
                                },
                                text: Text('Sign In'),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
