import 'package:builder_experiments/data/bicycle.dart';

abstract class BicycleBuilder {
  late Bicycle bicycle;
  late int price;
  void addFrame();
  void addWheels();
  void addBrakes();
  void addShifters();
  void addDerailleurs();

  void createBicycle();
}
