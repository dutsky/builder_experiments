import 'package:builder_experiments/data/bicycle.dart';
import 'package:builder_experiments/data/builders/bicycle_builder.dart';

class MerdiaBeginnerBicycleBuilder extends BicycleBuilder {
  @override
  void addBrakes() => bicycle.brakes = 'Low Tier Brakes';

  @override
  void addDerailleurs() {}

  @override
  void addFrame() => bicycle.frame = 'Low Tier Steel Frame';

  @override
  void addShifters() {}

  @override
  void addWheels() => bicycle.wheels = 'Low Tier Steel Wheels';

  @override
  void createBicycle() => bicycle = Bicycle(name: 'Merida Low Tier Bicycle', price: 11111);
}
