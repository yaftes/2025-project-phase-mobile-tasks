import 'package:equatable/equatable.dart';

abstract class Failures extends Equatable {
  final List<Object> properties;
  const Failures({required this.properties});

  @override
  List<Object> get props => properties;
}
