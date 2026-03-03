import 'package:flutter_test/flutter_test.dart';
import 'package:sramik_app/main.dart';

void main() {
  testWidgets('App builds successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const SramikApp());

    expect(find.text('sramik'), findsOneWidget);
  });
}
