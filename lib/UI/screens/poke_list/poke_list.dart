import 'package:practical_testflutter/config/config.dart';
import 'package:practical_testflutter/UI/screens/poke_list/components/poke_card.dart';
import 'package:practical_testflutter/data/datasource/remote/poke_list_call.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

class PokeList extends StatefulWidget {
  const PokeList({super.key});

  @override
  State<PokeList> createState() => _PokeListState();
}

class _PokeListState extends State<PokeList> {
  List<dynamic> pokes = [];
  bool visibility = false;
  Widget replacement = const CircularProgressIndicator();
  @override
  void initState() {
    super.initState();
    getPokes();
  }

  getPokes() async {
    pokes = await getPokeList();
    if (pokes.isNotEmpty) {
      visibility = true;
    } else {
      replacement = const Text("Ocurrio un error, intentalo mas tarde");
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de pokemon :3"),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Profile()));
              },
              child: const Text("Perfil"))
        ],
        elevation: 2,
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Visibility(
            visible: visibility,
            replacement: Center(child: replacement),
            child: ListView.builder(
              itemCount: pokes.length,
              itemBuilder: (context, index) {
                String prefix = "000";
                // Look for a better solution later
                if (index + 1 >= 10 && index + 1 < 100) {
                  prefix = "00";
                } else if (index + 1 >= 100 && index + 1 < 1000) {
                  prefix = "0";
                } else if (index + 1 >= 1000) {
                  prefix = "";
                }
                return PokeCard(
                  pokeNumber: "$prefix${index + 1}",
                  pokemon: toBeginningOfSentenceCase(
                      pokes[index]["name"].toString()),
                  pokeURL: pokes[index]["url"],
                );
              },
            ),
          )),
    );
  }
}
