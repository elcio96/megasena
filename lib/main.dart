import 'dart:math';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MegaSena());
}

class MegaSena extends StatelessWidget {
  const MegaSena({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homepage(),
    );
  }
}

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    final list = nextNumbers(6, min: 1, max: 60);
    list.sort();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Sortear 6 numeros de 1 a 60',
                        style: TextStyle(fontSize: 28),
                        textAlign: TextAlign.center,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black, // background (button) color
                          onPrimary: Colors.white, // foreground (text) color
                          fixedSize: const Size(165, 70),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        onPressed: () {
                          setState(() {});
                        },
                        child: const Text(
                          'Sortear',
                          style: TextStyle(
                            fontSize: 40,
                          ),
                        ),
                      ),
                      Text(
                        list.join("  "),
                        style: const TextStyle(
                          fontSize: 35,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset('assets/image/mega.png'),
                      ),
                    ]),
              ),
              const SizedBox(
                child: Text('Feito por: Elcio Caldeira Andrade',
                    textAlign: TextAlign.center),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int nextNumber({required int min, required int max}) =>
      min + Random().nextInt(max - min + 1);

  List<int> nextNumbers(int length, {required int min, required int max}) {
    final numbers = Set<int>();
    while (numbers.length < length) {
      final number = nextNumber(min: min, max: max);
      numbers.add(number);
    }
    return List.of(numbers);
  }
}
