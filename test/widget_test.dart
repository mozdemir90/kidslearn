import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kids_learn/main.dart';

void main() {
  testWidgets('App starts and shows Sayıları Öğren button by default (Turkish)', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: KidsLearnApp()));

    // Verify that our home screen shows the Turkish button by default
    expect(find.text('🔢 Sayıları Öğren'), findsOneWidget);

    // Verify the language switch toggle is present
    expect(find.text('TR'), findsOneWidget);
  });

  testWidgets('Navigating to NumberScreen displays number cards', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: KidsLearnApp()));

    // Tap the button to navigate
    await tester.tap(find.text('🔢 Sayıları Öğren'));
    await tester.pumpAndSettle();

    // Verify NumberScreen title and elements
    expect(find.text('Sayıları Öğrenelim'), findsOneWidget);
    expect(find.text('Bir'), findsOneWidget);
    expect(find.text('1'), findsWidgets);
  });
}
