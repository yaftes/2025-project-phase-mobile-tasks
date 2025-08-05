import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'network_info.dart';

class NetworkInfoImpl extends NetworkInfo {
  final InternetConnection connection;

  NetworkInfoImpl(this.connection);

  @override
  Future<bool> get isConnected => connection.hasInternetAccess;
}
