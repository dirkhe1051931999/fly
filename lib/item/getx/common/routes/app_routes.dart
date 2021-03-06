part of 'app_pages.dart';

abstract class AppRoutes {
  static const home = '/home';
  static const list = '/list';
  static const listDetails = '/listDetails';
  static const listDetailsDynamicId = '/listDetailsDynamicId/:id';
  static const notFound = '/notfound';
  static const login = '/login';
  static const my = '/my';
  static const stateObx = '/stateObx';
  static const stateGetx = '/stateGetx';
  static const stateGetBuilder = '/stateGetBuilder';
  static const stateValueBuilder = '/stateValueBuilder';
  static const stateWorks = '/stateWorks';
  static const dependencyPutFind = '/dependencyPutFind';
  static const dependencyLazyPut = '/dependencyLazyPut';
}
