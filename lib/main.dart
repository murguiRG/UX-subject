import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //* This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Design Card',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Cards Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  //* Generates shades of a base color
  List<Color> generateShades(Color baseColor, int numberOfShades) {
    return List<Color>.generate(numberOfShades, (index) {
      final double factor = index / (numberOfShades - 1);
      return Color.lerp(baseColor, Colors.brown.shade400, factor)!;
    });
  }

  @override
  Widget build(BuildContext context) {
    //* Color shades function call
    final List<Color> colorShades = generateShades(Colors.red, 15);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 3 / 5),
              itemCount: colorShades.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: colorShades[index],
                  child: Column(
                    children: [
                      const Expanded(
                        flex: 16,
                        child: Icon(
                          Icons.add_photo_alternate_outlined,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                          flex: 10,
                          child: Container(
                            color: Colors.white,
                            child: const Padding(
                              padding: EdgeInsets.all(8),
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Here are more details"),
                                      Text("Brand or vendor"),
                                      SizedBox(height: 10),
                                      Text('\$100'),
                                    ],
                                  )),
                            ),
                          )),
                    ],
                  ),
                );
              }),
        ));
  }
}