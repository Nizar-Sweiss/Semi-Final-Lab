// ignore_for_file: non_constant_identifier_names, unused_local_variable, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ltuc_portal/Screens/login_screen.dart';

void main() {
  //  print("### RAMZI     ${email_TextFieldKey}     RAMZI ###");

  group(
    "test Chips Auto Fillin, in LogInScreen",
    () {
      late Finder clear_ChipKey;
      late Finder test_ChipKey;
      late Finder email_TextFieldKey;
      late Finder pass_TextFieldKey;
      const String email_TextHint = "E-mail";
      const String pass_TextHint = "Password";
      setUp(() {
        clear_ChipKey = find.byKey(const Key("clear_chip"));
        test_ChipKey = find.byKey(const Key("test_chip"));
        email_TextFieldKey = find.byKey(const Key("pass_textfield"));
        pass_TextFieldKey = find.byKey(const Key("email_textfield"));
      });

      testWidgets(
        "successful fill for both email & pass TextFields",
        (tester) async {
          //   // Build our app and trigger a frame.
          await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

          // Verify that our TextFields start empty.
          expect(find.text(email_TextHint), findsOneWidget);
          expect(find.text(pass_TextHint), findsOneWidget);

          // Tap the Text Chip and trigger a frame.
          await tester.tap(test_ChipKey);
          await tester.pump();

          // Verify that our Screen has many of these texts;
          // because Chips and TextFields have the same texts.
          // In this textWidget (sub-group), we are only expecting 2 of these texts.
          // However, sometimes we might be expecting only one text.
          expect(find.text("test@test.com"), findsNWidgets(2));
          expect(find.text("test1234"), findsNWidgets(2));
        },
      );
    },
  );
}
