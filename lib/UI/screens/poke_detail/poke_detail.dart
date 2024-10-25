import 'package:practical_testflutter/config/config.dart';
import 'package:practical_testflutter/UI/screens/poke_detail/components/poke_detail_card.dart';
import 'package:practical_testflutter/UI/screens/poke_detail/components/abilities_moves_list.dart';
import 'package:practical_testflutter/data/datasource/remote/poke_detail_call.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

class PokeDetail extends StatefulWidget {
  final String number;
  final String pokeURL;

  const PokeDetail({super.key, required this.pokeURL, required this.number});

  @override
  State<PokeDetail> createState() => _PokeDetailState();
}

class _PokeDetailState extends State<PokeDetail> {
  Map<String, dynamic> pokeData = {};
  bool _visibility = false;
  Widget replacement = const CircularProgressIndicator();

  @override
  void initState() {
    getPokeData();
    super.initState();
  }

  getPokeData() async {
    pokeData = await getPokeInfo(widget.pokeURL);
    if (pokeData.isNotEmpty) {
      _visibility = true;
    } else {
      replacement = const Text("Ocurrio un error, intentalo mas tarde");
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalle pokemon"),
        elevation: 2,
      ),
      body: Visibility(
        visible: _visibility,
        replacement: Center(child: replacement),
        child: Builder(builder: (context) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  PokeDetailCard(
                    number: widget.number,
                    imageURL: pokeData["image"],
                    name: toBeginningOfSentenceCase(pokeData["name"]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Habilidades",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 220,
                    child: AbilitiesMovesList(
                      isAbility: true,
                      abilitiesMoves: pokeData["abilities"],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Movimientos",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 220,
                    child: AbilitiesMovesList(
                      isAbility: false,
                      abilitiesMoves: pokeData["moves"],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
