import 'package:builder_experiments/data/bicycle.dart';
import 'package:builder_experiments/data/builders/bicycle_builder.dart';

class BicycleCrafter {
  BicycleBuilder _builder;

  Bicycle? get bicycle => _builder.bicycle;

  BicycleCrafter(this._builder);

  void changeBuilder(BicycleBuilder newBuilder) => _builder = newBuilder;

  void craftBicycle() {
    _builder.createBicycle();
    _builder.addFrame();
    _builder.addWheels();
    _builder.addBrakes();
    _builder.addShifters();
    _builder.addDerailleurs();
  }
}
