import 'package:autismx/screens/surveys/configs/colors.dart';
import 'package:autismx/screens/surveys/surveyes_screens/adolescent/adolescentsocialskills.dart';
import 'package:autismx/screens/surveys/surveyes_screens/adult/adultsocialskills.dart';
import 'package:autismx/screens/surveys/surveyes_screens/child/childcategory.dart';
import 'package:autismx/screens/surveys/surveyes_screens/children4/child4socialskills.dart';
import 'package:autismx/screens/surveys/widgets/button.dart';

import 'package:autismx/shared/local/component.dart';
import 'package:flutter/material.dart';

import 'child/child_questionnaire.dart';

class Intro extends StatefulWidget {
  const Intro({Key key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  var nameController = TextEditingController();

  var ageController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  final List<String> _Gender = ['Male', 'Female'];
  String _selectedgender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustombackAppBar(
                context,
                () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Child Information",
                    style: TextStyle(
                        fontSize: 23,
                        color: ColorManager.blue,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: defaultFormField(
                    controller: nameController,
                    type: TextInputType.text,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'Name must not be empty';
                      }
                      return null;
                    },
                    label: "Name",
                    prefix: Icons.person_outline),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: defaultFormField(
                    controller: ageController,
                    type: TextInputType.number,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'Age must not be empty';
                      }
                      return null;
                    },
                    label: "Age",
                    prefix: Icons.numbers),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width - 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: DropdownButton(
                  elevation: 8,
                  isExpanded: true,
                  hint: const Text('Gender'),
                  value: _selectedgender,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedgender = newValue;
                    });
                  },
                  items: _Gender.map((gender) {
                    return DropdownMenuItem(
                      child: Text(gender),
                      value: gender,
                    );
                  }).toList(),
                ),
              ),
              //  Button.primary(buttonLabel: "buttonLabel", onPressed: ()
              //  {
              //    Navigator.push(context, MaterialPageRoute(builder: (context)=>TestTest(name: nameController.text, age: ageController.text, gender: _selectedgender)));
              // })
              const SizedBox(
                height: 30,
              ),
              defaultButton(
                function: () {
                  if (int.parse(ageController.text) >= 16) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdultSocialSkills(
                          name: nameController.text,
                          age: ageController.text,
                          gender: _selectedgender,
                        ),
                      ),
                    );
                  } else if (int.parse(ageController.text) >= 4 &&
                      int.parse(ageController.text) <= 11) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Child4SocialSkills(
                          name: nameController.text,
                          age: ageController.text,
                          gender: _selectedgender,
                        ),
                      ),
                    );
                  } else if (int.parse(ageController.text) >= 12 &&
                      int.parse(ageController.text) <= 15) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdolescentSocialSkills(
                          name: nameController.text,
                          age: ageController.text,
                          gender: _selectedgender,
                        ),
                      ),
                    );
                  } else if (int.parse(ageController.text) >= 1 &&
                      int.parse(ageController.text) <= 3) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChildCategory(
                          name: nameController.text,
                          age: ageController.text,
                          gender: _selectedgender,
                        ),
                      ),
                    );
                  } else {}
                },
                text: "Submit".toUpperCase(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}