import 'package:builder_experiments/data/bicycle.dart';
import 'package:builder_experiments/data/builders/bianchi_professional_bicycle_builder.dart';
import 'package:builder_experiments/data/builders/bicycle_builder.dart';
import 'package:builder_experiments/data/builders/bicycle_crafter.dart';
import 'package:builder_experiments/data/builders/felt_amateur_bicycle_builder.dart';
import 'package:builder_experiments/data/builders/merida_beginner_bicycle_builder.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      home: const MyHomePage(title: 'Bicycle Builder'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _bicycleCrafter = BicycleCrafter(BianchiProfessionalBicycleBuilder());
  final _bicyclesSelector = <DropdownMenuItem<BicycleBuilder>>[];

  final _bicycles = <Bicycle>[];
  Bicycle? _selectedBicycle;
  BicycleBuilder? _selectedBuilder;
  int total = 0;

  @override
  void initState() {
    super.initState();
    _bicyclesSelector.addAll([
      DropdownMenuItem<BicycleBuilder>(
        value: BianchiProfessionalBicycleBuilder(),
        child: const Text('Bianchi'),
      ),
      DropdownMenuItem<BicycleBuilder>(
        value: FeltAmateurTierBicycleBuilder(),
        child: const Text('Felt'),
      ),
      DropdownMenuItem<BicycleBuilder>(
        value: MerdiaBeginnerBicycleBuilder(),
        child: const Text('Merida'),
      ),
    ]);
  }

  void _onSelect(BicycleBuilder? builder) {
    if (builder == null) return;
    _bicycleCrafter.changeBuilder(builder);
    _bicycleCrafter.craftBicycle();
    setState(() {
      _selectedBuilder = builder;
      _selectedBicycle = _bicycleCrafter.bicycle;
    });
  }

  void _addBicycle() {
    setState(() {
      if (_selectedBicycle != null) _bicycles.add(_selectedBicycle!);
      total += _selectedBicycle!.price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      const Text('Select bicycle:'),
                      DropdownButton<BicycleBuilder>(
                          value: _selectedBuilder, items: _bicyclesSelector, onChanged: _onSelect)
                    ],
                  ),
                  const SizedBox(width: 12.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Bicycle information:'),
                      _LabelledText(label: 'Name', text: _selectedBicycle?.name),
                      _LabelledText(label: 'Frame', text: _selectedBicycle?.frame),
                      _LabelledText(label: 'Brakes', text: _selectedBicycle?.brakes),
                      _LabelledText(label: 'Shifters', text: _selectedBicycle?.shifters),
                      _LabelledText(label: 'Derailleurs', text: _selectedBicycle?.derailleurs),
                      _LabelledText(label: 'Wheels', text: _selectedBicycle?.wheels),
                      const Divider(),
                      _LabelledText(label: 'Price', text: _selectedBicycle?.price.toString()),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 24.0),
              const Text('Bicycles crafted:'),
              Expanded(
                child: ListView.builder(
                  itemCount: _bicycles.length,
                  itemBuilder: (_, index) => Text(_bicycles[index].name),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addBicycle,
        tooltip: 'Add to cart',
        label: Row(children: [
          const Icon(Icons.add),
          Text('\$ $total'),
        ]),
      ),
    );
  }
}

class _LabelledText extends StatelessWidget {
  final String label;
  final String? text;

  const _LabelledText({required this.label, this.text});

  @override
  Widget build(BuildContext context) {
    return Text('$label: ${text ?? '--'}');
  }
}
