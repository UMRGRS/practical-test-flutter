import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practical_testflutter/config/config.dart';
import 'package:practical_testflutter/providers/auth_provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil"),
        elevation: 2,
      ),
      body: SizedBox(
        width: double.maxFinite,
        child: Consumer(
          builder: (context, ref, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Correo electrónico",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  ref.read(authRespositoryProvider).user!.email.toString(),
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                FilledButton(
                  onPressed: () {
                    ref.read(authRespositoryProvider).logout();
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Cerrar sesión",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
