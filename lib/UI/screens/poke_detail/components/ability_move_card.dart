import 'package:practical_testflutter/config/config.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

class AbilityMoveCard extends StatelessWidget {
  final bool isAbility;
  final String name;

  const AbilityMoveCard({super.key, this.isAbility = true, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 8,
          bottom: 8,
          left: 8,
          right: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              toBeginningOfSentenceCase(name),
              style: const TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            isAbility
                ? const Icon(Icons.lightbulb)
                : const Icon(Icons.run_circle_outlined)
          ],
        ),
      ),
    );
    ;
  }
}
