import 'dart:io';

import 'package:autismx/screens/common/profile_states.dart';
import 'package:autismx/shared/models/signinmodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);
  Parent parentProfile;

  @override
  void onChange(Change<ProfileStates> change) {
    super.onChange(change);
    if (change.nextState is ProfileUpdateState) {
      parentProfile = (change.nextState as ProfileUpdateState).profile;
    }
  }

  File file;

  Future uploadChildImage() async {
    ImagePicker picker = ImagePicker();
    final image = await picker.getImage(source: ImageSource.gallery);

    file = File(image.path);
  }
}
