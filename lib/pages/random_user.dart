import 'package:flutter/material.dart';
import '../models/random_user_model.dart';
import '../services/random_user_service.dart';

class RandomUserPage extends StatefulWidget {
  const RandomUserPage({super.key});

  @override
  State<RandomUserPage> createState() => _RandomUserPageState();
}

class _RandomUserPageState extends State<RandomUserPage> {
  String name = "Batista";
  String email = "Batista@random.com";
  String image = "https://randomuser.me/api/portraits/thumb/men/5.jpg";
  RandomUser? data;

  void handleGetRandomUser() async {
    final response = await getRandomUser();

    setState(() => data = response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.94),
      appBar: AppBar(
        title: const Text("USUARIO ALEATORIO"),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(700),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Card(
                shape: const RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.purple,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: data != null
                          ? ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  data!.results[0].picture.thumbnail,
                                ),
                              ),
                              title: Text(data!.results[0].name.first),
                              subtitle: Text(data!.results[0].email),
                            )
                          : ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(image),
                              ),
                              title: Text(name),
                              subtitle: Text(email),
                            ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => handleGetRandomUser(),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                shape: const StadiumBorder(),
              ),
              child: const Text(
                "Gerar Usuario",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
