import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
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
              onTap: () {
                print("프로필 편집 취소");
              },
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
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1, color: Colors.white.withOpacity(0.4)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _oneButton(Icons.chat_bubble, "나와의 채팅", () {}),
            _oneButton(Icons.edit, "프로필 편집", () {}),
            _oneButton(Icons.chat_bubble_outline, "카카오스토리", () {}),
          ],
        ),
      ),
    );
  }

  Widget _profileImage() {
    return Container(
      width: 120,
      height: 120,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Image.asset(
          "assets/images/default_user.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _profileInfo() {
    return Column(
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Text(
            "평범하게살자",
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

  Widget _myProfile() {
    return Positioned(
        bottom: 120,
        left: 0,
        right: 0,
        child: Container(
          height: 200,
          child: Column(
            children: [
              _profileImage(),
              _profileInfo(),
            ],
          ),
        ));
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
