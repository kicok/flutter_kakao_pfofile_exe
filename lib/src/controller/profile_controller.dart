import 'dart:io';

import 'package:flutter_kakao_profile_exe/src/model/user_model.dart';
import 'package:flutter_kakao_profile_exe/src/repository/firebase_user_repository.dart';
import 'package:get/get.dart';

import 'image_crop_controller.dart';

enum ProfileImageType { thumbNail, background }

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();
  RxBool isEditMyProfile = false.obs;

  // UserModel originMyProfile = UserModel(
  //   name: "평범하게 살자",
  //   description: "구독과 좋아요 부탁드립니다!",
  // );
  // 위의 originMyProfile 이 없어도 아래의 코드에서 초기화 되므로 위의 코드는 필요 없어짐..(주석처리함)
  UserModel originMyProfile = UserModel();

  void authstateChanges(dynamic firebaseUser) async {
    if (firebaseUser != null) {
      UserModel? userModel =
          await FirebaseUserRepository.findUserByUid(firebaseUser.uid);

      if (userModel != null) {
        originMyProfile = userModel;
        FirebaseUserRepository.updateLastLoginDate(
            userModel.docId!, DateTime.now());
      } else {
        originMyProfile = UserModel(
          uid: firebaseUser.uid,
          name: firebaseUser.displayName,
          avatarUrl: firebaseUser.photoURL,
          createdTime: DateTime.now(),
          lastLoginTime: DateTime.now(),
        );

        String docId = await FirebaseUserRepository.signup(originMyProfile);
        originMyProfile.docId = docId; // 해당 users 정보의 다큐멘트 id
      }
      myProfile(UserModel.clone(originMyProfile));
    }
  }

  Rx<UserModel> myProfile = UserModel().obs;

  @override
  void onInit() {
    isEditMyProfile(false);

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
    myProfile.value.initImagefile();
    myProfile(originMyProfile);
    toggleEditProfile();
  }

  void pickImage(ProfileImageType type) async {
    if (isEditMyProfile.value) {
      File? file = await ImageCropController.to.selectImage(type);
      myProfile.update((my) {
        if (ProfileImageType.thumbNail == type) {
          my?.avatarFile = file;
        } else {
          my?.backgroundFile = file;
        }
      });
    }
  }

  void save() {
    originMyProfile = myProfile.value;
    // 저장이 되더라도 rollback(초기화)를 하면 myProfile.value.initImagefile() 코드 때문에 선택한 이미지는 모두 사라짐.

    FirebaseUserRepository.updateData(originMyProfile.docId!, originMyProfile);
    toggleEditProfile();
  }
}
