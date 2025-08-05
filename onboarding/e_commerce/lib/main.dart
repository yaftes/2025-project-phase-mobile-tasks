import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';
import 'features/product/presentation/bloc/product_bloc.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (context) => getIt<ProductBloc>())],
      child: MyApp(),
    ),
  );
}
