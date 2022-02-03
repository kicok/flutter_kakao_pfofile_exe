import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_kakao_profile_exe/src/model/user_model.dart';

class FirebaseUserRepository {
  static Future<String> signup(UserModel user) async {
    // id만들기 : users
    CollectionReference users = FirebaseFirestore.instance.collection("users");

    // user Object를 Map으로 변환하여 firestore의 users id에 추가한다.
    DocumentReference drf = await users.add(user.toMap());
    return drf.id; // documnet id
  }

  static Future<UserModel?> findUserByUid(String uid) async {
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    QuerySnapshot data = await users.where("uid", isEqualTo: uid).get();
    if (data.size == 0) {
      return null;
    } else {
      //return data.docs[0].data();
      return UserModel.fromJson(
          data.docs[0].data() as Map<String, dynamic>, data.docs[0].id);
    }
  }

  static void updateLastLoginDate(String docId, DateTime dateTime) {
    CollectionReference users = FirebaseFirestore.instance.collection("users");

    if (docId.isNotEmpty) {
      // if (docId.isNotEmpty) 이 구문이 반드시 있어야 함.
      users.doc(docId).update({"last_login_time": dateTime});
    }
  }

  static void updateData(String docId, UserModel originMyProfile) {
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    users.doc(docId).update(originMyProfile.toMap());
  }
}
