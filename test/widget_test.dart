import 'package:daywise/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('DayWise splash screen renders', (tester) async {
    await tester.pumpWidget(const DayWiseApp());

    expect(find.text('DayWise'), findsOneWidget);
    expect(
      find.text('Daily guidance from the Myanmar Calendar'),
      findsOneWidget,
    );

    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();
  });
}
