import 'package:ditonton/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Add TV Series to Watchlist Flow Test', () {
    testWidgets('Verify adding TV series to watchlist', (
      WidgetTester tester,
    ) async {
      app.main();

      await tester.pumpAndSettle(const Duration(seconds: 3));

      expect(find.text('TV Series'), findsOneWidget);

      final scrollView = find.byType(SingleChildScrollView);

      for (int i = 0; i < 3; i++) {
        await tester.drag(scrollView, const Offset(0, -300));
        await tester.pumpAndSettle();
        if (find.text('Popular').evaluate().isNotEmpty) break;
      }

      await tester.pumpAndSettle();

      final tvSeriesList = find.byType(ListView).first;
      final tvSeriesItem = find
          .descendant(of: tvSeriesList, matching: find.byType(InkWell))
          .first;

      await tester.tap(tvSeriesItem);
      await tester.pumpAndSettle(const Duration(seconds: 2));

     expect(find.text('Overview'), findsOneWidget);

      final watchlistButton = find.widgetWithText(FilledButton, 'Watchlist');
      expect(watchlistButton, findsOneWidget);

      await tester.tap(watchlistButton);
      await tester.pumpAndSettle();

      expect(find.text('Added to Watchlist'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Watchlist'));
      await tester.pumpAndSettle();

      expect(find.text('Watchlist'), findsOneWidget);

      await tester.tap(find.text('Tv Series'));
      await Future.delayed(
        const Duration(milliseconds: 500),
      ); 
      await tester.pumpAndSettle();

      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(Card), findsWidgets);
    });
  });
}
