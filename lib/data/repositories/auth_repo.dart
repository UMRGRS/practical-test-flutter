import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository{
  final FirebaseAuth _auth;

  Stream<User?> get authStateChange => _auth.idTokenChanges();

  AuthRepository(this._auth);

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if(e.code == "user-not-found"){
        throw AuthException("Usuario no encontrado");
      } else if(e.code == "wrong-password"){
        throw AuthException("Contrseña incorrecta");
      } else{
        throw AuthException("Ocurrio un error intenta mas tarde");
      }
    }
  }

  Future<User?> registerUser(String email, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if(e.code == "email-already-in-use"){
        throw AuthException("El correo ya está en uso");
      } else if(e.code == "invalid-email"){
        throw AuthException("Correo electronico invalido");
      } else{
        throw AuthException("Ocurrio un error intenta mas tarde");
      }
    }
  }

  Future<void> signOut() async {
    return _auth.signOut();
  }
}

class AuthException implements Exception{
  final String message;

  AuthException(this.message);

  @override
  String toString(){
    return message;
  }
}