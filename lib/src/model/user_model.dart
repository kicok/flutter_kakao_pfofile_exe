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
}
