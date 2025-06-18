import 'package:ditonton/presentation/pages/about_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget _makeTestableWidget(Widget body) {
    return MaterialApp(home: body);
  }

  testWidgets('Page should display app logo and information',
      (WidgetTester tester) async {
    await tester.pumpWidget(_makeTestableWidget(AboutPage()));

    final imageFinder = find.byType(Image);
    final textFinder = find.text(
        'Ditonton merupakan sebuah aplikasi katalog film yang dikembangkan oleh Dicoding Indonesia sebagai contoh proyek aplikasi untuk kelas Menjadi Flutter Developer Expert.');
    final backButtonFinder = find.byIcon(Icons.arrow_back);

    expect(imageFinder, findsOneWidget);
    expect(textFinder, findsOneWidget);
    expect(backButtonFinder, findsOneWidget);
  });

  testWidgets('Back button should pop the page when pressed',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) => ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
            child: Text('Go to About'),
          ),
        ),
      ),
    ));

    await tester.tap(find.text('Go to About'));
    await tester.pumpAndSettle();

    expect(find.byType(AboutPage), findsOneWidget);

    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();

    expect(find.byType(AboutPage), findsNothing);
  });
}