import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class ProfileController extends GetxController {
  RxBool isEditMyProfile = false.obs;
  @override
  void onInit() {
    isEditMyProfile(false);
    super.onInit();
  }

  void toggleEditProfile() {
    isEditMyProfile(!isEditMyProfile.value);
  }
}
