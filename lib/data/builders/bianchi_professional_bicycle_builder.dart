import 'package:builder_experiments/data/bicycle.dart';
import 'package:builder_experiments/data/builders/bicycle_builder.dart';

class BianchiProfessionalBicycleBuilder extends BicycleBuilder {
  @override
  void addBrakes() => bicycle.brakes = 'Top Tier Brakes';

  @override
  void addDerailleurs() => bicycle.derailleurs = 'Top Tier Electro Derailleurs';

  @override
  void addFrame() => bicycle.frame = 'Top Tier Carbon Frame';

  @override
  void addShifters() => bicycle.shifters = 'Top Tier Electro Shifters';

  @override
  void addWheels() => bicycle.wheels = 'Top Tier Carbon Wheels';

  @override
  void createBicycle() => bicycle = Bicycle(name: 'Bianci Top Tier Bicycle', price: 55555);
}
