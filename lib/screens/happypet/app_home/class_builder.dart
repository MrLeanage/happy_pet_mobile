
import 'package:happy_pet/screens/happypet/app_home/home.dart';
import 'package:happy_pet/screens/happypet/app_remedies/remedies.dart';
import 'package:happy_pet/screens/happypet/app_myPet/myPets.dart';

typedef Object Constructor<Object>();

Map<String, Constructor<Object>> _constructors = new Map();

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor as Constructor<Object>;
}

class ClassBuilder {
  static void registerClasses() {
    register<Home>(() => Home());
    register<MyPets>(() => MyPets());
    register<Remedies>(() => Remedies());
  }

  static dynamic fromString(String type) {
    return Home();
  }
}