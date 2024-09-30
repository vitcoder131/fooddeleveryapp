import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static String userIdKey ="USERKEY";
  static String userNameKey ="USERNAMEKEY";
  static String userEmailKey ="USEREMAILKEY";
  static String userWalletKey ="USERWALLETKEY";
  static String userProfileKey ="USERPROFILEKEY";

  Future<bool> saveUserId(String getUserId)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(userIdKey, getUserId);
  }
  Future<bool> saveUserName(String getUserName)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(userNameKey, getUserName);
  }
  Future<bool> saveUserEmail(String getUserEmail)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(userEmailKey, getUserEmail);
  }
  Future<bool> saveUserWallet(String getUserWallet)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(userWalletKey, getUserWallet);
  }
  Future<bool> saveUserProfile(String getUserProfile)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(userProfileKey, getUserProfile);
  }
  Future<String?>getUserId()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(userIdKey);
  }
  Future<String?>getUserName()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(userNameKey);
  }
  Future<String?>getUserEmail()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(userEmailKey);
  }
  Future<String?>getUserWallet()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(userWalletKey);
  }
  Future<String?>getUserProfile()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(userProfileKey);
  }
}