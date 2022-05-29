abstract class AppStates {}

class AppBottomNavState extends AppStates {}

class AppInitialState extends AppStates {}

class GetAdvicesLoadingState extends AppStates {}

class GetAdvicesSuccessState extends AppStates {}

class GetCentersLoadingState extends AppStates {}

class GetCentersSuccessState extends AppStates {}

class GetCentersErrorState extends AppStates {
  final String error;

  GetCentersErrorState(this.error);
}

class GetAdvicesErrorState extends AppStates {
  final String error;

  GetAdvicesErrorState(this.error);
}
