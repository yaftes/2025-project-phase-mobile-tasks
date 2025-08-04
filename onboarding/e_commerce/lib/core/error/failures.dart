import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  String message;
  Failure(this.message);
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {
  ServerFailure(String message) : super(message = 'Server Failure');
}

class CacheFailure extends Failure {
  CacheFailure(String message) : super(message = 'Cache Failure')
}
