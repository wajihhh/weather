import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAth = FirebaseAuth.instance;
User? _user;

User? get user{
  return _user;
}

  AuthService(){

  _firebaseAth.authStateChanges().listen(authStateChangesStreamListener);
  }

    Future<bool> login(String email, String password) async {
      try {
        final credentials = await _firebaseAth.signInWithEmailAndPassword(
            email: email, password: password);
        if(credentials.user != null){
          _user = credentials.user;
          return true;
        }
      } catch (e) {
        print(e);
      }
      return false;
    }

    void authStateChangesStreamListener(User?user){
  // _user = user;

  if(user!=null){
    _user = user;
  }else{
    _user = null;
  }
    }

    Future<bool> logout()async{
  try{
await _firebaseAth.signOut();
return true;
  }catch(e){

  }
      return false;
    }


}
