import 'package:flutter_kakao_profile_exe/src/model/user_model.dart';
import 'package:get/state_manager.dart';

class ProfileController extends GetxController {
  RxBool isEditMyProfile = false.obs;

  UserModel originMyProfile = UserModel(
    name: "평범하게 살자",
    description: "구독과 좋아요 부탁드립니다!",
  );

  Rx<UserModel> myProfile = UserModel().obs;
  @override
  void onInit() {
    isEditMyProfile(false);
    myProfile(UserModel.clone(originMyProfile));
    super.onInit();
  }

  void toggleEditProfile() {
    isEditMyProfile(!isEditMyProfile.value);
  }

  void updateName(String name) {
    // 1번 방법
    // myProfile.value.name = name;
    // myProfile(myProfile.value);

    // 2번 방법
    myProfile.update((my) {
      my?.name = name;
    });
  }

  void updateDescription(String description) {
    myProfile.update((my) {
      my?.description = description;
    });
  }

  void rollback() {
    myProfile(originMyProfile);
    toggleEditProfile();
  }
}
