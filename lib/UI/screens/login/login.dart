import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practical_testflutter/config/config.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';

import 'package:practical_testflutter/UI/screens/login/components/login_register_form.dart';

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
      body: const Padding(
        padding: EdgeInsets.all(25),
        child: GestureFlipCard(
            animationDuration: Duration(milliseconds: 300),
            axis: FlipAxis.vertical,
            enableController: false,
            frontWidget: Card(
              child: LogRegForm(swipe_label: "registrarte",),
            ),
            backWidget: Card(
              child: LogRegForm(
                title: "Registrate",
                button_label: "Registrate",
                swipe_label: "iniciar sesión",
              ),
            )),
      ),
    );
  }
}
