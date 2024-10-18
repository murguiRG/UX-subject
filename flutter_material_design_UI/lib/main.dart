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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Products Page'),
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
  void _showCustomSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: const IntrinsicWidth(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Text(
                'Product added to cart',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )),
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: const EdgeInsets.all(20),
          backgroundColor: Colors.green.shade300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _showCustomSnackBar(context);
      },
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
    final List<Color> colorShades = generateShades(Colors.red.shade400, 9);

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
                                          const SizedBox(height: 8),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '\$100',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16,
                                                    color:
                                                        Colors.grey.shade700),
                                              ),
                                              TextButton(
                                                  onPressed: () {},
                                                  child: const Text(
                                                    'View details',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                  ))
                                            ],
                                          )
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
