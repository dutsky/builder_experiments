class Bicycle {
  final String name;
  final int price;
  String? frame;
  String? wheels;
  String? brakes;
  String? shifters;
  String? derailleurs;

  String get components => 'Frame: $frame, Wheels: $wheels, Brakes: $brakes, '
      'Shifters: $shifters, Derailleurs: $derailleurs';

  Bicycle({
    required this.name,
    required this.price,
    this.frame,
    this.wheels,
    this.brakes,
    this.shifters,
    this.derailleurs,
  });
}
