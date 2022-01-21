import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/profile_controller.dart';

class Profile extends GetView<ProfileController> {
  const Profile({Key? key}) : super(key: key);

  Widget _header() {
    return Positioned(
      top: Get.mediaQuery.padding.top,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.only(left: 15, right: 15),
        //color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: controller.toggleEditProfile,
              child: Row(
                children: const [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 16,
                  ),
                  Text(
                    "프로필 편집",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                print("프로필 편집 저장");
              },
              child: const Text(
                "완료",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _backgroundImage() {
    return Positioned(
      child: GestureDetector(
        onTap: () {
          print("change my backgroundImage");
        },
        child: Container(
          color: Colors.transparent, // 최소 투명색이든 무슨색이든 넣어줘야 전체 영역을 가질수 있다.
        ),
      ),
    );
  }

  Widget _oneButton(IconData icon, String title, Function()? ontap) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _footer() {
    return Obx(
      () => controller.isEditMyProfile.value
          ? Container()
          : Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        width: 1, color: Colors.white.withOpacity(0.4)),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _oneButton(Icons.chat_bubble, "나와의 채팅", () {}),
                    _oneButton(
                        Icons.edit, "프로필 편집", controller.toggleEditProfile),
                    _oneButton(Icons.chat_bubble_outline, "카카오스토리", () {}),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _profileImage() {
    return Container(
      width: 120,
      height: 120,
      child: Stack(children: [
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: SizedBox(
              height: 100,
              width: 100,
              child: Image.asset(
                "assets/images/default_user.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        controller.isEditMyProfile.value
            ? Positioned(
                left: 0,
                top: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      size: 20,
                    ),
                  ),
                ),
              )
            : Container(),
      ]),
    );
  }

  Widget _profileInfo() {
    return Column(
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Text(
            "평범하게 살자",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          "구독과 좋아요 부탁드립니다.",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _partProfileInfo(String value, Function() ontap) {
    return GestureDetector(
      onTap: ontap,
      child: Stack(children: [
        Container(
          height: 45,
          // 외형이 텍스트 에디터처럼 보이게 처리한다.
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const Positioned(
          right: 0,
          bottom: 15,
          child: Icon(
            Icons.edit,
            color: Colors.white,
            size: 18,
          ),
        ),
      ]),
    );
  }

  Widget _editProfileInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          _partProfileInfo("평범하게 살자", () {
            print("닉네임 변ㅕ 이벤트");
          }),
          _partProfileInfo("구독과 좋아요 부탁드립니다.", () {}),
        ],
      ),
    );
  }

  Widget _myProfile() {
    return Positioned(
      bottom: 120,
      left: 0,
      right: 0,
      child: Container(
        height: 220,
        child: Obx(
          () => Column(
            children: [
              _profileImage(),
              controller.isEditMyProfile.value
                  ? _editProfileInfo()
                  : _profileInfo(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3f3f3f),
      body: SafeArea(
        child: Stack(
          children: [
            _backgroundImage(),
            _header(),
            _myProfile(),
            _footer(),
          ],
        ),
      ),
    );
  }
}