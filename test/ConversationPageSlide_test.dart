import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/pages/ConversationPage.dart';
import '../lib/pages/ConversationPageSlide.dart';
import '../lib/widgets/input.dart';

void main(){
  const MaterialApp app = MaterialApp(
    home: Scaffold(
        body:  const ConversationPageSlide()
    ),
  );
  testWidgets('ConversationPageSlide UI Test', (WidgetTester tester) async {
    // Build our app and trigger wa frame.
    await tester.pumpWidget(app);
    expect(find.byType(ConversationPage),findsOneWidget);
    expect(find.byType(PageView),findsOneWidget);
    expect(find.byType(InputWidget),findsOneWidget);

  });
} 