import 'package:kiwi/kiwi.dart';

abstract class Injector {
  @Register.factory(ServiceA)
  void configure(KiwiContainer? scopedContainer);
}

class ServiceA {}
