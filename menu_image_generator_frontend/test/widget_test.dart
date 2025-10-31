import 'package:flutter_test/flutter_test.dart';
import 'package:menu_image_generator_frontend/main.dart';

void main() {
  testWidgets('Initial screen shows Capture Menu title', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
    expect(find.text('Capture Menu'), findsOneWidget);
  });
}
