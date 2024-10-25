import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practical_testflutter/UI/screens/login/controller/auth_state.dart';
import 'package:practical_testflutter/providers/auth_provider.dart';

class AuthController extends StateNotifier<AuthState> {
  final Ref ref;

  AuthController(this.ref) : super(const AuthStateInitial());

  void login(String email, String password) async {
    state = const AuthStateLoading();
    try {
      await ref
          .read(authRespositoryProvider)
          .signInWithEmailAndPassword(email, password);
      state = const AuthStateSuccess();
    } catch (e) {
      state = AuthStateError(e.toString());
    }
  }

  void signup(String email, String password) async{
    state = const AuthStateLoading();
    try {
      await ref
          .read(authRespositoryProvider)
          .registerUser(email, password);
      state = const AuthStateSuccess();
    } catch (e) {
      state = AuthStateError(e.toString());
    }
  }

  void logout() async{
    ref.read(authRespositoryProvider).logout();
  }
}

final authControllerProvider =
    StateNotifierProvider<AuthController, AuthState>((ref) {
  return AuthController(ref);
});
