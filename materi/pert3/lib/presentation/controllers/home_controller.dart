import '../../domain/usecases/navigation_to_profile.dart';

class HomeController {
  void onGoToProfilePagePressed() {
    navigateToProfilePage(); // Call the use case to handle the logic
  }

  void onGoToProfilePageWithAssetsPressed() {
    navigateToProfilePageWithAssets(); // Call the use case to handle the logic
  }
}
