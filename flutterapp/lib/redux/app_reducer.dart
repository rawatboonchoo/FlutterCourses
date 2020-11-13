//ไว้สำหรับรวม Reducer

import 'package:flutterapp/redux/profile/profile_reducer.dart';
import 'package:meta/meta.dart';

//read only
@immutable
class AppState {
  final ProfileState profileState;
  //final ProfileState productState;
  AppState({this.profileState});

  factory AppState.inital() {
    //factory จะไม่สร้าง instances ใหม่
    return AppState(profileState: ProfileState());
  }
}

//reducer
//ทำหน้าที่ return AppState
AppState appReducer(AppState state, dynamic action) {
  return AppState(profileState: profileReducer(state.profileState, action));
}
