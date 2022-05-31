
import 'package:autismx/screens/common/profile_cubit.dart';
import 'package:autismx/screens/common/profile_states.dart';
import 'package:autismx/shared/local/colors.dart';
import 'package:autismx/shared/local/component.dart';
import 'package:autismx/shared/models/signinmodel.dart';
import 'package:autismx/shared/network/dio/profile_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isobsecure = true;
  TextEditingController _Namecontroller = TextEditingController();
  TextEditingController _Emailcontroller = TextEditingController();
  TextEditingController _Passwordcontroller = TextEditingController();
  TextEditingController _Phonecontroller = TextEditingController();
  TextEditingController _Adresscontroller = TextEditingController();
  TextEditingController _Childnamecontroller = TextEditingController();
  TextEditingController _Childagecontroller = TextEditingController();
  int childGender;

  Widget _Textformfield(
      {@required TextEditingController controller,
      @required String hintText,
      @required String lableText,
      @required Widget prifixicon,
      @required TextInputType keyboardType,
      String initialValue,
      String Prefixtext,
      Widget suffixicon,
      bool visiblepassword = false}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: lableText,
          labelStyle: const TextStyle(fontSize: 25, color: Colors.blueAccent),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: prifixicon,
          suffixIcon: suffixicon,
          prefixText: Prefixtext,
        ),
        keyboardType: keyboardType,
        obscureText: visiblepassword,
      ),
    );
  }

  GlobalKey<ScaffoldState> Scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Scaffoldkey,
      body: SafeArea(
        child: BlocConsumer<ProfileCubit, ProfileStates>(
          listener: (context, state) {},
          builder: (context, state) {
            final parent = (state as ProfileUpdateState).profile;
            print(parent.address);
            _Namecontroller.text = _Namecontroller.text.isEmpty
                ? "${parent.firstName} ${parent.secondName}"
                : _Namecontroller.text;
            _Emailcontroller.text = _Emailcontroller.text.isEmpty
                ? parent.email
                : _Emailcontroller.text;
            _Phonecontroller.text = _Phonecontroller.text.isEmpty
                ? parent.phone
                : _Phonecontroller.text;
            _Adresscontroller.text = _Adresscontroller.text.isEmpty
                ? parent.address
                : _Adresscontroller.text;
            _Childnamecontroller.text = _Childnamecontroller.text.isEmpty
                ? parent.childName
                : _Childnamecontroller.text;
            _Childagecontroller.text = _Childagecontroller.text.isEmpty
                ? parent.childAge.toString()
                : _Childagecontroller.text;
            childGender = parent.childGender == "female" ? 1 : 0;
            return Column(
              children: [
                 CustombackAppBar(context, (){Navigator.pop(context);}),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 170,
                          child: Stack(
                            children: [
                              Positioned(
                                left:
                                    MediaQuery.of(context).size.width / 2 - 50,
                                top: 20,
                                child: CircleAvatar(
                                  radius: 52,
                                  backgroundColor: Colors.grey.withOpacity(0.2),
                                  child: CircleAvatar(
                                    radius: 48,
                                    backgroundColor: Colors.white,
                                    child: Image.network(
                                      parent.childImage,
                                      fit: BoxFit.cover,
                                      width: 70,
                                      height: 70,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left:
                                    MediaQuery.of(context).size.width / 2 - 50,
                                top: 90,
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: ColorManager.blueFont,
                                  child: IconButton(
                                    onPressed: () {
                                      ProfileCubit.get(context)
                                          .uploadChildImage();
                                    },
                                    icon: const Icon(
                                      Icons.insert_photo_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                left:
                                    MediaQuery.of(context).size.width / 2.5,
                                child: Text(
                                  parent.firstName,
                                  style: const TextStyle(
                                    fontSize: 25,
                                    color: ColorManager.blueFont,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        _Textformfield(
                          controller: _Namecontroller,
                          hintText: 'Enter Full Name',
                          lableText: 'Name',
                          prifixicon: const Icon(
                            Icons.person,
                            color: ColorManager.blueFont,
                          ),
                          keyboardType: TextInputType.text,
                        ),
                        _Textformfield(
                            controller: _Emailcontroller,
                            hintText: 'Enter Email Adress',
                            lableText: 'E-mail',
                            prifixicon: const Icon(
                              Icons.email,
                              color: ColorManager.blueFont,
                            ),
                            keyboardType: TextInputType.emailAddress),
                        _Textformfield(
                          controller: _Passwordcontroller,
                          hintText: 'Enter Password',
                          lableText: 'Password',
                          prifixicon: const Icon(
                            Icons.lock,
                            color: ColorManager.blueFont,
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          suffixicon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isobsecure = !_isobsecure;
                                });
                              },
                              icon: Icon(_isobsecure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              color: ColorManager.blueFont),
                          visiblepassword: _isobsecure,
                        ),
                        _Textformfield(
                          controller: _Phonecontroller,
                          hintText: 'Enter phone Number',
                          lableText: 'Phone Number',
                          prifixicon: const Icon(
                            Icons.phone,
                            color: ColorManager.blueFont,
                          ),
                          keyboardType: TextInputType.phone,
                          Prefixtext: '+20   ',
                        ),
                        _Textformfield(
                            controller: _Adresscontroller,
                            hintText: 'Enter Address',
                            lableText: 'Address',
                            prifixicon: const Icon(
                              Icons.location_on,
                              color: ColorManager.blueFont,
                            ),
                            keyboardType: TextInputType.streetAddress),
                        _Textformfield(
                            controller: _Childnamecontroller,
                            hintText: 'Enter Child Name',
                            lableText: 'Child Name',
                            prifixicon: const Icon(
                              Icons.child_care,
                              size: 30,
                              color: ColorManager.blueFont,
                            ),
                            /*ImageIcon(
                                   AssetImage('assets/images/childd.png',),
                                   size: 3,
                                   color: ColorManager.blueFont,
                                 ),*/
                            keyboardType: TextInputType.text),
                        _Textformfield(
                            controller: _Childagecontroller,
                            hintText: 'Enter Child Age',
                            lableText: 'Child Age',
                            prifixicon: const Icon(
                              Icons.tag,
                              size: 30,
                              color: ColorManager.blueFont,
                            ),
                            keyboardType: TextInputType.number),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, top: 8.0, right: 8.0),
                          child: DropdownButtonFormField<int>(
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
                            decoration: const InputDecoration(
                              labelText: "Child Gender",
                              prefixIcon: Icon(
                                Icons.merge_type,
                                size: 30,
                                color: ColorManager.blueFont,
                              ),
                              labelStyle: TextStyle(
                                  fontSize: 25, color: Colors.blueAccent),
                            ),
                          ),
                        ),
                        // _Textformfield(
                        //     controller: _Gendercontroller,
                        //     hintText: 'Enter Child Gender',
                        //     lableText: 'Child Gender',
                        //     prifixicon: const Icon(
                        //       Icons.merge_type,
                        //       size: 30,
                        //       color: ColorManager.blueFont,
                        //     ),
                        //     keyboardType: TextInputType.text),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: 60,
                            decoration: BoxDecoration(
                                color: ColorManager.blueFont,
                                borderRadius: BorderRadius.circular(10)),
                            child: MaterialButton(
                              onPressed: () {
                                ProfileDioHelper.updateParentProfile(
                                        firstName:
                                            _Namecontroller.text.split(" ")[0],
                                        lastName:
                                            _Namecontroller.text.split(" ")[0],
                                        address: _Adresscontroller.text,
                                        phone: _Phonecontroller.text,
                                        email: _Emailcontroller.text,
                                        password:
                                            _Passwordcontroller.text.isNotEmpty
                                                ? _Passwordcontroller.text
                                                : null,
                                        childName: _Childnamecontroller.text,
                                        childAge:
                                            int.parse(_Childagecontroller.text),
                                        childGender: childGender,
                                        childImageFile:
                                            ProfileCubit.get(context).file)
                                    .then((response) {
                                  final newParent =
                                      Parent.fromJson(response.data["data"]);
                                  ProfileCubit.get(context)
                                      .emit(ProfileUpdateState(newParent));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "Profile updated successfully")));
                                  Navigator.of(context).pop();
                                }).catchError((err) {
                                  print(err);
                                });
                              },
                              child: const Text(
                                'Save',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
     
    );
  }
}
