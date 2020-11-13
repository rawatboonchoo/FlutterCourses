import 'package:meta/meta.dart';

//read only
@immutable
class ProfileState {
  final Map<String, dynamic> profile;

  ProfileState(
      {this.profile = const {
        'email': 'man@gmail.com',
        'name': 'rawat boonchoo',
        'role': "member"
      }});

  ProfileState copyWith({Map<String, dynamic> profile}) {
    //ถ้า profile ตัวที่ถูกส่งเข้ามาเป็น null ให้ รีเทิน this.profile | rawat boonchoo
    return ProfileState(
        //check null ??
        profile: profile ?? this.profile);
  }
}

//reducer
//ทำหน้าที่ return ProfileState
profileReducer(ProfileState state, dynamic action) {
  return state;
}
