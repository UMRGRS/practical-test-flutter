import 'package:practical_testflutter/config/config.dart';

class PokeDetailCard extends StatelessWidget {
  final String number;
  final String imageURL;
  final String name;

  const PokeDetailCard(
      {super.key,
      required this.number,
      required this.imageURL,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        textColor: Colors.black,
        title: Column(
          children: [
            Text(
              number,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Image.network(
              height: 120,
              scale: 5,
              imageURL,
            ),
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
