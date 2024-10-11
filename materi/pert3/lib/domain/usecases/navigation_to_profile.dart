import 'package:flutter/material.dart';
import '../../core/navigation_service.dart';

void navigateToProfilePage() {
  NavigationService.navigateTo('/profile');
}

void navigateToProfilePageWithAssets() {
  NavigationService.navigateTo('/profile_with_assets');
}
