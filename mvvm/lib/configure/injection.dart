
import 'injection.config.dart';
void configureInjection(String environment) =>
    $initGetIt(environment: environment);

abstract class Env {
  static const dev = 'dev';
  static const prod = 'prod';
}