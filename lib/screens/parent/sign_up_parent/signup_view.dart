
import 'package:autismx/screens/BNB/home/home_view.dart';
import 'package:autismx/screens/parent/sign_in/signin_view.dart';
import 'package:autismx/screens/surveys/configs/colors.dart';
import 'package:autismx/shared/local/component.dart';
import 'package:flutter/material.dart';



import 'signup_controller.dart';
class SingUpParentLayout extends StatefulWidget {
  const SingUpParentLayout({Key key}) : super(key: key);

  @override
  State<SingUpParentLayout> createState() => _SingUpParentLayoutState();
}

class _SingUpParentLayoutState extends State<SingUpParentLayout> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key:formKey ,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    Image(image: const AssetImage('assets/images/Logo.png'),height: MediaQuery.of(context).size.height/6,),
                    const Text('Parent',style: TextStyle(color: ColorManager.blueFont,fontSize: 20,fontWeight: FontWeight.w600),),
                    const SizedBox(height: 20,),
                    defaultFormField(
                        controller: firstNameController,
                        type: TextInputType.name,
                        validate: (String value)
                        {
                          if(value.isEmpty)
                            {
                              return 'You must complete this field';
                            }
                          return null;
                        },
                        label: 'First Name',
                        prefix: Icons.person,
                    ),const SizedBox(height: 20,),
                    defaultFormField(
                      controller: lastNameController,
                      type: TextInputType.name,
                      validate: (String value)
                      {
                        if(value.isEmpty)
                        {
                          return 'You must complete this field';
                        }
                        return null;
                      },
                      label: 'Last Name',
                      prefix: Icons.person,
                    ),const SizedBox(height: 20,),
                    defaultFormField(
                      controller: addressController,
                      type: TextInputType.streetAddress,
                      validate: (String value)
                      {
                        if(value.isEmpty)
                        {
                          return 'You must complete this field';
                        }
                        return null;
                      },
                      label: 'Address',
                      prefix: Icons.location_on_rounded,
                    ),const SizedBox(height: 20,),
                    defaultFormField(
                      controller: phoneController,
                      type: TextInputType.phone,
                      validate: (String value)
                      {
                        if(value.isEmpty)
                        {
                          return 'You must complete this field';
                        }
                        return null;
                      },
                      label: 'Phone',
                      prefix: Icons.phone,
                    ),const SizedBox(height: 20,),
                    defaultFormField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validate: (String value)
                      {
                        if(value.isEmpty)
                        {
                          return 'You must complete this field';
                        }
                        return null;
                      },
                      label: 'Email',
                      prefix: Icons.email,
                    ),const SizedBox(height: 20,),
                    defaultFormField(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      validate: (String value)
                      {
                        if(value.isEmpty)
                        {
                          return 'You must complete this field';
                        }
                        return null;
                      },
                      label: 'Password',
                      prefix: Icons.lock,
                      isPassword: isPassword,
                      suffix:isPassword? Icons.visibility:Icons.visibility_off,
                      suffixPressed: ()
                      {
                        setState(() {
                          isPassword =!isPassword;
                        });

                      }
                    ),const SizedBox(height: 10,),
                    CheckboxListTile(value:checkbox ,
                        title:const Text('I agree to the term and Condition',style: TextStyle(
                          color: ColorManager.blueFont,
                          fontSize: 12
                        ),),
                        controlAffinity: ListTileControlAffinity.leading,

                        onChanged: (bool value)
                        {
                          setState(() {
                            checkbox=value;
                          });
                        }
                    ),
                    defaultButton1(function: ()
                    {
                      if(formKey.currentState.validate())
                        {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Home()));
                        }
                    },
                        text: 'SING UP',

                    ),
                    const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       const Text('Already have an account',style: TextStyle(
                      color: ColorManager.greyFont,
                      fontSize: 12
                    ),),
                    const SizedBox(height: 10,),
                    defaultTextButton(function: ()
                    {
                      navigateAndFinish(context,const SignInParentLayout());
                    },
                        text:const Text('Sing In',style: TextStyle(color: ColorManager.blueFont),),
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
  }
}

