abstract class AppStates {}
class AppBottomNavState extends AppStates {}
class AppInitialState extends AppStates {}

class GetAdvicesLoadingState extends AppStates {}

class GetAdvicesSuccessState extends AppStates {}

class GetAdvicesErrorState extends AppStates
{
  final String error;

  GetAdvicesErrorState(this.error);
}

