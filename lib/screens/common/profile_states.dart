import 'package:autismx/shared/models/signinmodel.dart';

abstract class ProfileStates {}

class ProfileInitialState extends ProfileStates {}

class ProfileUpdateState extends ProfileStates {
  final Parent profile;
  ProfileUpdateState(this.profile);
}
