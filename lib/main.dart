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

class AddToCart extends StatefulWidget {
  const AddToCart({super.key});

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //* Shows a snackbar with a message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Added to cart')),
        );
      },
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          shape: MaterialStateProperty.all<CircleBorder>(
            const CircleBorder(
              side: BorderSide.none,
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            Theme.of(context).colorScheme.secondary,
          ),
          minimumSize: MaterialStateProperty.all<Size>(const Size(45, 45)),
          elevation: MaterialStateProperty.all<double>(3),
        ),
        child: const Icon(
          Icons.add_rounded,
          color: Colors.white,
        ),
      ),
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
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          const Expanded(
                            flex: 16,
                            child: Icon(
                              Icons.image_outlined,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          Expanded(
                              flex: 10,
                              child: Container(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Product name",
                                            style: TextStyle(
                                                color: Colors.grey.shade600),
                                          ),
                                          const SizedBox(height: 5),
                                          const Text(
                                            "Brand or vendor",
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          const SizedBox(height: 20),
                                          Text(
                                            '\$100',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                color: Colors.grey.shade700),
                                          ),
                                        ],
                                      )),
                                ),
                              )),
                        ],
                      ),
                      const Positioned(
                        top: 10,
                        right: 0,
                        child: AddToCart(),
                      )
                    ],
                  ),
                );
              }),
        ));
  }
}
