import 'package:flutter_test/flutter_test.dart';
import 'package:trade021/app.dart';

void main() {
  testWidgets('Watchlist app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const TradeApp());

    // Verify that the app title '021 Trade' is present.
    expect(find.text('Trade'), findsOneWidget);
    expect(find.text('021'), findsOneWidget);
  });
}
