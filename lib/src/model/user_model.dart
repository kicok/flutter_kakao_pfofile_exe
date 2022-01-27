// ignore_for_file: prefer_initializing_formals

import 'dart:io';

class UserModel {
  String? uid; // 고유의 고객 key
  String? docId; // firebase로 data를 주고 받을때 필요한 다큐멘트 Id
  String? name;
  String? description;
  DateTime? lastLoginTime;
  DateTime? createdTime;

  String? avatarUrl;
  String? backgroundUrl;

  // 아래의 2 file은 스토리지에 저장이 되고
  // DB에는 스토리지의 avatarUrl, backgroundUrl 만 저장되면 된다.
  File? avatarFile;
  File? backgroundFile;

  UserModel({
    this.uid,
    this.docId,
    this.name,
    this.description,
    this.lastLoginTime,
    this.createdTime,
    this.avatarUrl,
    this.backgroundUrl,
  });

  UserModel.clone(UserModel user)
      : this(
          uid: user.uid,
          docId: user.docId,
          name: user.name,
          description: user.description,
          lastLoginTime: user.lastLoginTime,
          createdTime: user.createdTime,
          avatarUrl: user.avatarUrl,
          backgroundUrl: user.backgroundUrl,
        );

  void initImagefile() {
    avatarFile = null;
    backgroundFile = null;
  }

  // 로그인 할때 전달 받은 데이터를 Map으로 전환한다.
  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "name": name,
      "description": description,
      "avatar_url": avatarUrl,
      "background_url": backgroundUrl,
      "created_time": createdTime,
      "last_login_time": lastLoginTime,
    };
  }

  UserModel.fromJson(Map<String, dynamic> json, String docId)
      : uid = json['uid'] as String,
        docId = docId,
        name = json['name'] as String,
        description = json['description'] ?? "",
        lastLoginTime = json['last_login_time'].toDate(),
        createdTime = json['created_time'].toDate(),
        avatarUrl = json['avatar_url'] as String,
        backgroundUrl = json['background_url'] ?? "";
}
