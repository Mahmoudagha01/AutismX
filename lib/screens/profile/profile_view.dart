import 'package:autismx/screens/centers/center_view.dart';
import 'package:autismx/shared/local/colors.dart';
import 'package:autismx/shared/local/component.dart';
import 'package:flutter/material.dart';


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
  TextEditingController _Gendercontroller = TextEditingController();

  Widget _Textformfield(
      {@required TextEditingController controller,
      @required String hintText,
      @required String lableText,
      @required Widget prifixicon,
      @required TextInputType keyboardType,
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
  GlobalKey<ScaffoldState> Scaffoldkey=GlobalKey<ScaffoldState>();
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
       key: Scaffoldkey,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(context: context,scaffoldkey: Scaffoldkey),
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
                            left: MediaQuery.of(context).size.width / 2 - 50,
                            top: 20,
                            child: CircleAvatar(
                              radius: 52,
                              backgroundColor: Colors.grey.withOpacity(0.2),
                              child: CircleAvatar(
                                radius: 48,
                                backgroundColor: Colors.white,
                                child: Image.asset(
                                  'assets/images/Profile.png',
                                  fit: BoxFit.cover,
                                  width: 70,
                                  height: 70,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width / 2 - 50,
                            top: 90,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: ColorManager.blueFont,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.insert_photo_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                         
                        Positioned(
                          bottom: 10,
                           left: MediaQuery.of(context).size.width / 2 - 60,
                          child: const Text(
                            'Mohamed',
                            style:  TextStyle(
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
                     _Textformfield(
                         controller: _Gendercontroller,
                         hintText: 'Enter Child Gender',
                         lableText: 'Child Gender',
                         prifixicon: const ImageIcon(
                           AssetImage(
                             'assets/images/gender.png',
                           ),
                           
                           color: ColorManager.blueFont,
                         ),
                         keyboardType: TextInputType.text),
                     Padding(
                       padding: const EdgeInsets.symmetric(vertical: 20),
                       child: Container(
                         width: MediaQuery.of(context).size.width * 0.7,
                         height: 60,
                         decoration: BoxDecoration(
                             color: ColorManager.blueFont,
                             borderRadius: BorderRadius.circular(10)),
                         child: MaterialButton(
                           onPressed: () {},
                           child: const Text(
                             'Save',
                             style: TextStyle(color: Colors.white, fontSize: 25),
                           ),
                         ),
                       ),
                     )
                  ],
                ),
              ),
            )
          ],
        ),
        
      ),
      endDrawer: myDrawer(context, () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ProfileScreen(),
            ),
          );
        }, () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => CenterLayout(),
            ),
          );
        }, () {}, () {}, () {}, () {}),
    );
  }
}
