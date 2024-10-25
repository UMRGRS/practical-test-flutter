import 'package:practical_testflutter/UI/screens/login/controller/auth_controller.dart';
import 'package:practical_testflutter/UI/screens/login/controller/auth_state.dart';
import 'package:practical_testflutter/config/config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogRegForm extends ConsumerStatefulWidget {
  final String title;
  final String button_label;
  final String swipe_label;
  final Function(String, String) fun;
  const LogRegForm(
      {super.key,
      this.title = "Iniciar sesión",
      this.button_label = "Inciar sesión",
      required this.swipe_label,
      required this.fun});

  @override
  ConsumerState<LogRegForm> createState() => _LogRegFormState();
}

class _LogRegFormState extends ConsumerState<LogRegForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthState>(authControllerProvider, ((previous, state) {
      if (state is AuthStateError) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.error)));
      }
    }));
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomInputField(
            label: "Correo electrónico",
            inputType: TextInputType.emailAddress,
            controller: emailController,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomInputField(
            label: "Contraseña",
            isPassword: true,
            controller: passwordController,
          ),
          const SizedBox(
            height: 20,
          ),
          FilledButton(
            onPressed: ()=>{
              widget.fun(emailController.text, passwordController.text)
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              widget.button_label,
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
              'Arrastra para ${widget.swipe_label} ---->',
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
