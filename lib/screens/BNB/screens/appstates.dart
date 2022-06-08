abstract class AppStates {}

class AppBottomNavState extends AppStates {}

class AppInitialState extends AppStates {}

class GetAdvicesLoadingState extends AppStates {}

class GetAdvicesSuccessState extends AppStates {}

class GetCentersLoadingState extends AppStates {}

class GetCentersSuccessState extends AppStates {}

class GetReportsLoadingState extends AppStates {}

class GetReportsSuccessState extends AppStates {}

class GetReportsErrorState extends AppStates {
  final String error;

  GetReportsErrorState(this.error);
}

class GetCentersErrorState extends AppStates {
  final String error;

  GetCentersErrorState(this.error);
}

class GetAdvicesErrorState extends AppStates {
  final String error;

  GetAdvicesErrorState(this.error);
}