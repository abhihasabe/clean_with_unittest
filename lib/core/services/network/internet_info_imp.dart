import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:clean_unittest/core/services/network/network_info.dart';

class InternetInfoImp implements InternetInfo {
  final InternetConnectionChecker checker;

  const InternetInfoImp({
    required this.checker,
  });

  @override
  Future<bool> hasConnexion() => checker.hasConnection;
}
