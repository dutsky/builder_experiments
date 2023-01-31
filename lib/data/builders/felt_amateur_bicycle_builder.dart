import 'package:builder_experiments/data/bicycle.dart';
import 'package:builder_experiments/data/builders/bicycle_builder.dart';

class FeltAmateurTierBicycleBuilder extends BicycleBuilder {
  @override
  void addBrakes() => bicycle.brakes = 'Middle Tier Brakes';

  @override
  void addDerailleurs() => bicycle.derailleurs = 'Middle Tier Derailleurs';

  @override
  void addFrame() => bicycle.frame = 'Middle Tier Alu Frame';

  @override
  void addShifters() => bicycle.shifters = 'Middle Tier Shifters';

  @override
  void addWheels() => bicycle.wheels = 'Middle Tier Alu Wheels';

  @override
  void createBicycle() => bicycle = Bicycle(name: 'Felt Middle Tier Bicycle', price: 33333);
}
