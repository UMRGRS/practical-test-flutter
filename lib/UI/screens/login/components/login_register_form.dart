import 'package:practical_testflutter/config/config.dart';

class LogRegForm extends StatelessWidget {
  final String title;
  final String button_label;
  final String swipe_label;

  const LogRegForm(
      {super.key,
      this.title = "Iniciar sesión",
      this.button_label = "Inciar sesión",
      required this.swipe_label});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomInputField(
            label: "Correo electrónico",
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomInputField(
            label: "Contraseña",
            isPassword: true,
          ),
          const SizedBox(
            height: 20,
          ),
          FilledButton(
            onPressed: () => {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              button_label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              'Arrastra para $swipe_label ---->',
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
          )
        ],
      ),
    );
  }
}
