import 'package:e_commerce/features/product/presentation/bloc/product_bloc.dart';
import 'package:e_commerce/features/product/presentation/pages/detail_page.dart';
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

  testWidgets('System back button on DetailPage navigates back to HomePage', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [BlocProvider(create: (context) => getIt<ProductBloc>())],
          child: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const DetailPage()),
                );
              },
              child: const Text('Go to Detail'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Go to Detail'));
    await tester.pumpAndSettle();

    expect(find.byType(DetailPage), findsOneWidget);
    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(find.text('Go to Detail'), findsOneWidget);
  });
}
