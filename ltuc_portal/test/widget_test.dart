// ignore_for_file: non_constant_identifier_names, unused_local_variable, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ltuc_portal/Screens/login_screen.dart';

late String _Valid_Email;
late String _Valid_Pass;
void _setValid_EmailPass(
    {required String validEmail_ShouldBe, required String validPass_ShouldBe}) {
  _Valid_Email = validEmail_ShouldBe;
  _Valid_Pass = validPass_ShouldBe;
}

void main() {
  group(
    "test Chips Auto Fillin, in LogInScreen",
    () {
      const String email_TextHint = "E-mail";
      const String pass_TextHint = "Password";
      late Finder clear_ChipKey;
      late Finder test_ChipKey;
      late Finder email_TextFieldKey;
      late Finder pass_TextFieldKey;

      setUp(() {
        clear_ChipKey = find.byKey(const Key("clear_chip"));
        test_ChipKey = find.byKey(const Key("test_chip"));
        email_TextFieldKey = find.byKey(const Key("pass_textfield"));
        pass_TextFieldKey = find.byKey(const Key("email_textfield"));
      });

      testWidgets(
        "chip_Clear, it SHOULD EMPTY both of the email & pass TextFields",
        (widgetTester) async {
          // This sets what our expectations for both of the TextFields at the end of the operation.
          _setValid_EmailPass(
            validEmail_ShouldBe: email_TextHint,
            validPass_ShouldBe: pass_TextHint,
          );

          // todo: to build the app in side setUp().
          // Build our app and trigger a frame.
          await widgetTester.pumpWidget(const MaterialApp(home: LoginScreen()));

          // todo: get random text
          // Enter random texts in both of the TextFields.
          await widgetTester.enterText(email_TextFieldKey, "clear_chip test0");
          await widgetTester.enterText(pass_TextFieldKey, "clear_chip test1");

          // Tap the Clear Chip and trigger a frame.
          await widgetTester.tap(clear_ChipKey);
          await widgetTester.pump();

          // In this textWidget (sub-group),
          // we are only expecting the TestHint for each TextField;
          // means there will be no Text in both of the Email & Pass TextFields.
          expect(find.text(email_TextHint), findsOneWidget);
          expect(find.text(pass_TextHint), findsOneWidget);
        },
      );
      testWidgets(
        "chip_Test, it SHOULD FILL both the email & pass TextFields",
        (tester) async {
          // This sets what our expectations for both of the TextFields at the end of the operation.
          _setValid_EmailPass(
            validEmail_ShouldBe: "test@test.com",
            validPass_ShouldBe: "test1234",
          );

          // Build our app and trigger a frame.
          await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

          // Verify that our TextFields are empty when initialized.
          expect(find.text(email_TextHint), findsOneWidget);
          expect(find.text(pass_TextHint), findsOneWidget);

          // Tap the Text Chip and trigger a frame.
          await tester.tap(test_ChipKey);
          await tester.pump();

          // Verify that our Screen has many of these texts;
          // because Chips and TextFields have the same texts.
          // In this textWidget (sub-group), we are only expecting 2 of these texts.
          // However, sometimes we might be expecting only one text.
          expect(find.text(_Valid_Email), findsNWidgets(2));
          expect(find.text(_Valid_Pass), findsOneWidget);
        },
      );
    },
  );
}
