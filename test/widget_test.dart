import "package:bible_overview/main.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  testWidgets("首頁顯示標題", (tester) async {
    await tester.pumpWidget(const BibleOverviewApp());
    expect(find.text("聖經概覽"), findsOneWidget);
  });
}
