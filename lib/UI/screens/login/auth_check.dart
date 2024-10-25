import 'package:practical_testflutter/config/config.dart';
import 'package:practical_testflutter/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthCheck extends ConsumerWidget {
  const AuthCheck({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    return authState.when(
        data: (user) {
          if(user!= null) return const PokeList();
          return const Login();
        },
        error: (e, trace) => const Login(),
        loading: () => const Splash());
  }
}

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
