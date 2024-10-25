import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practical_testflutter/config/config.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';

import 'package:practical_testflutter/UI/screens/login/components/login_register_form.dart';

import 'controller/auth_controller.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>(
  (ref) => FirebaseAuth.instance,
);

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bienvenido"),
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Consumer(builder: (context, ref, child) { return GestureFlipCard(
            animationDuration: const Duration(milliseconds: 300),
            axis: FlipAxis.vertical,
            enableController: false,
            frontWidget: Card(
              child: LogRegForm(
                swipe_label: "registrarte",
                fun: ref.read(authControllerProvider.notifier).login,
              ),
            ),
            backWidget: Card(
              child: LogRegForm(
                title: "Registrate",
                button_label: "Registrate",
                swipe_label: "iniciar sesión",
                fun: ref.read(authControllerProvider.notifier).signup,
              ),
            )); },),
      ),
    );
  }
}
