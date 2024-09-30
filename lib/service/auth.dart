import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods{
  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrenUser()async{
    return auth.currentUser;
  }

  Future signOut()async{
    await FirebaseAuth.instance.signOut();
  }

  Future deleteuser()async{
    User? user = FirebaseAuth.instance.currentUser;
    user?.delete();
  }
}