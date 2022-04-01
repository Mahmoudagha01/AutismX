import 'package:flutter/material.dart';

mixin signUpMixin
{
  var firstNameController =TextEditingController();
  var lastNameController =TextEditingController();
  var addressController =TextEditingController();
  var childNameController =TextEditingController();
  var childAgeController =TextEditingController();
  var childImageController =TextEditingController();
  var childGenderController =TextEditingController();
  var phoneController =TextEditingController();
  var emailController =TextEditingController();
  var passwordController =TextEditingController();
  var formKey =GlobalKey<FormState>();
  bool isPassword=true;
  bool checkbox=false;

}