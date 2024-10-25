import 'package:practical_testflutter/config/config.dart';

import 'login/auth_check.dart';

class App extends StatelessWidget {
  final ThemeData? theme;

  const App({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthCheck(),
      theme: theme,
    );
  }
}