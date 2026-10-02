import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kids_learn/main.dart';

void main() {
  testWidgets('Home displays 3 categories: Numbers, Colors, and Shapes', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: KidsLearnApp()));

    // Verify category titles in Turkish (default)
    expect(find.text('Sayıları Öğren'), findsOneWidget);
    expect(find.text('Renkleri Öğren'), findsOneWidget);
    expect(find.text('Şekilleri Öğren'), findsOneWidget);

    // Verify language flag
    expect(find.text('TR'), findsOneWidget);
  });

  testWidgets('Navigating to Numbers category displays number cards', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: KidsLearnApp()));

    final numbersBtn = find.text('Sayıları Öğren');
    await tester.ensureVisible(numbersBtn);
    await tester.tap(numbersBtn);
    await tester.pumpAndSettle();

    expect(find.text('Sayıları Öğrenelim'), findsOneWidget);
    expect(find.text('Bir'), findsOneWidget);
  });

  testWidgets('Navigating to Colors category displays color cards', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: KidsLearnApp()));

    final colorsBtn = find.text('Renkleri Öğren');
    await tester.ensureVisible(colorsBtn);
    await tester.tap(colorsBtn);
    await tester.pumpAndSettle();

    expect(find.text('Renkleri Öğrenelim'), findsOneWidget);
    expect(find.text('Kırmızı'), findsWidgets);
    expect(find.text('Mavi'), findsWidgets);
  });

  testWidgets('Navigating to Shapes category displays shape cards', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: KidsLearnApp()));

    final shapesBtn = find.text('Şekilleri Öğren');
    await tester.ensureVisible(shapesBtn);
    await tester.tap(shapesBtn);
    await tester.pumpAndSettle();

    expect(find.text('Şekilleri Öğrenelim'), findsOneWidget);
    expect(find.text('Daire'), findsWidgets);
    expect(find.text('Kare'), findsWidgets);
  });
}
