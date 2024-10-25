import 'package:practical_testflutter/config/config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PokeCard extends StatelessWidget {
  final String poke_number;
  final String pokemon;
  final String pokeURL;

  const PokeCard({super.key, required this.poke_number, required this.pokemon, required this.pokeURL});

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
              "$poke_number - $pokemon",
              style: const TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PokeDetail(pokeURL: pokeURL, number: poke_number)));
              },
              icon: SvgPicture.asset(
                "assets/icons/pokeball-pokemon-svgrepo-com.svg",
                height: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
