import 'package:flutterapp/redux/profile/profile_action.dart';
import 'package:meta/meta.dart';

//read only
@immutable
class ProfileState {
  final Map<String, dynamic> profile;

  ProfileState({this.profile = const {'email': '', 'name': '', 'role': ''}});

  ProfileState copyWith({Map<String, dynamic> profile}) {
    //ถ้า profile ตัวที่ถูกส่งเข้ามาเป็น null ให้ รีเทิน this.profile | rawat boonchoo
    return ProfileState(
        //check null ??
        profile: profile ?? this.profile);
  }
}

//reducer
//ทำหน้าที่ return ProfileState
ProfileState profileReducer(ProfileState state, dynamic action) {
  if (action is ProfileAction) {
    //check ว่ามีข้อมูลการเปลี่ยนแปลง ให้ส่งข้อมูลใหม่ไป
    return state.copyWith(profile: action.profileState.profile);
  }
  return state;
}
