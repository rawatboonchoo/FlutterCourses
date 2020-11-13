import 'package:flutterapp/redux/profile/profile_reducer.dart';
import 'package:meta/meta.dart';

@immutable
class ProfileAction {
  final ProfileState profileState;
  ProfileAction(this.profileState);
}

//action
//ประกาศตัวแปร เพื่อรับข้อมูลมาจาก shared_preferences
updateProfileAction(Map<String, dynamic> newProfile) {
  //logic for  change stage
  return ProfileAction(ProfileState(profile: newProfile));
}
