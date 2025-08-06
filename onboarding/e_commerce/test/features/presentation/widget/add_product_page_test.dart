import 'package:e_commerce/features/product/presentation/bloc/product_bloc.dart';
import 'package:e_commerce/features/product/presentation/pages/add_product_page.dart';
import 'package:e_commerce/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    getIt.reset();
    await init();
  });

  testWidgets('Verify the add product form shows errors for empty fields', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [BlocProvider(create: (context) => getIt<ProductBloc>())],
          child: const AddProductPage(),
        ),
      ),
    );

    await tester.tap(find.byKey(const Key('submit')));
    await tester.pump();

    expect(find.text('Price is required'), findsOneWidget);
    expect(find.text('Description is required'), findsOneWidget);
  });

  testWidgets('Verify the add product show success from valid inputs', (
    widgetTester,
  ) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [BlocProvider(create: (context) => getIt<ProductBloc>())],
          child: const AddProductPage(),
        ),
      ),
    );
    await widgetTester.enterText(find.byKey(Key('price')), '24.0');
    await widgetTester.tap(find.byKey(Key('submit')));
    await widgetTester.pump();

    expect(find.text('Price is required'), findsNothing);
  });
}
