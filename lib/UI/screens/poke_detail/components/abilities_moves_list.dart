import 'package:practical_testflutter/config/config.dart';
import 'package:practical_testflutter/UI/screens/poke_detail/components/ability_move_card.dart';

class AbilitiesMovesList extends StatelessWidget {
  final bool isAbility;
  final List<dynamic> abilitiesMoves;

  const AbilitiesMovesList(
      {super.key, this.isAbility = true, required this.abilitiesMoves});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: abilitiesMoves.length,
      itemBuilder: (context, index) {
        String text = "";
        if (isAbility) {
          text = abilitiesMoves[index]["ability"]["name"];
        } else {
          text = abilitiesMoves[index]["move"]["name"];
        }
        return AbilityMoveCard(
          isAbility: isAbility,
          name: text,
        );
      },
    );
  }
}
