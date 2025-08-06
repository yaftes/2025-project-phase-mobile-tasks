import 'package:bloc_test/bloc_test.dart';
import 'package:e_commerce/features/product/domain/entities/product.dart';
import 'package:e_commerce/features/product/presentation/bloc/product_bloc.dart';
import 'package:e_commerce/features/product/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockProductBloc extends Mock implements ProductBloc {}

void main() {
  late MockProductBloc mockProductBloc;

  setUp(() {
    mockProductBloc = MockProductBloc();
  });

  testWidgets('displays list of products with name and price', (
    WidgetTester tester,
  ) async {
    final products = [
      Product(
        id: '1',
        name: 'Coffee Beans',
        description: 'High quality beans',
        imageUrl: 'https://example.com/coffee.jpg',
        price: 99.99,
      ),
      Product(
        id: '2',
        name: 'Green Tea',
        description: 'Organic tea',
        imageUrl: 'https://example.com/tea.jpg',
        price: 59.49,
      ),
    ];

    when(
      mockProductBloc.state,
    ).thenReturn(LoadedAllProductState(products: products));
    whenListen(
      mockProductBloc,
      Stream<ProductState>.fromIterable([
        LoadedAllProductState(products: products),
      ]),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<ProductBloc>.value(
          value: mockProductBloc,
          child: const HomePage(),
        ),
      ),
    );

    await tester.pump();

    expect(find.text('Coffee Beans'), findsOneWidget);
    expect(find.text('Green Tea'), findsOneWidget);
    expect(find.textContaining('99.99'), findsOneWidget);
    expect(find.textContaining('59.49'), findsOneWidget);
  });
}
