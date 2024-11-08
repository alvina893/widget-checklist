import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map> categories = [
    {"name": "Broom", "isChecked": false},
    {"name": "Minced Chicken", "isChecked": false},
    {"name": "Sesame Oil", "isChecked": false},
    {"name": "Mouse Trap", "isChecked": false},
    {"name": "Spoons", "isChecked": false},
    {"name": "Cabinet", "isChecked": false},
    {"name": "Apple", "isChecked": false},
    {"name": "Wipes", "isChecked": false},
    {"name": "Puzzle", "isChecked": false},
    {"name": "Paper", "isChecked": false},
  ];

@override
Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'CHECKLIST WIDGET PROTOTYPE',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: categories.map((favorite) {
                  return CheckboxListTile(
                    activeColor: Colors.green,
                    onChanged: (val) {
                      setState(() {
                        favorite['isChecked'] = val ?? false;
                      });
                    },
                    value: favorite['isChecked'],
                    title: Text(
                      favorite['name'] ?? '',
                      style: TextStyle(
                        fontSize: 20,
                        decoration: favorite['isChecked']
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                  );
                }).toList(),
              )
            ],
          ),
          ),
        )
    );
  }
}
