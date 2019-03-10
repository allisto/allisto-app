import 'package:allisto_app/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('app should work', (tester) async {
    await tester.pumpWidget(new Allisto());
    expect(find.text('Allisto'), findsOneWidget);
  });
}
