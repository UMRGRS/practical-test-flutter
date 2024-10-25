import 'package:firebase_auth/firebase_auth.dart';
import 'package:practical_testflutter/data/repositories/auth_repo.dart';
import 'package:riverpod/riverpod.dart';

final authRespositoryProvider = Provider<AuthRepository>((ref){
  return AuthRepository(FirebaseAuth.instance);
});

final authStateProvider = StreamProvider<User?>((ref){
  return ref.read(authRespositoryProvider).authStateChange;
});