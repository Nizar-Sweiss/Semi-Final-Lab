// ignore_for_file: non_constant_identifier_names, unused_local_variable, constant_identifier_names

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ltuc_portal/Screens/login_screen.dart';

/// ## ChipLogin
///
/// Chips are used in the `LogInScreen` to assist auto-fill
/// for both of the TextFields `Email` and `Pass`.
/// ## Examples
/// ```dart
/// // sets email_TextField.text to `test@test.com`
/// // and pass_TextField.text to 'test1234'
/// DefaultChipLogIn(
///   key: const Key("test_chip"),
///   email: "test@test.com",
///   pass: "test1234",
///   emailController: emailController,
///   passwordController: passwordController,
/// )
///
/// // clears the email_TextField.text and pass_TextField.text
/// DefaultChipLogIn(
///   key: const Key("clear_chip"),
///   email: "",
///   pass: "",
///   emailController: emailController,
///   passwordController: passwordController,
///   chipLabel: "Clear",
/// )
/// ```
void main() {
  late String Valid_Email;
  late String Valid_Pass;
  const String email_TextHint = "E-mail";
  const String pass_TextHint = "Password";
  late Finder clear_ChipKey;
  late Finder test_ChipKey;
  late Finder email_TextFieldKey;
  late Finder pass_TextFieldKey;
  Map<String, String> Accounts_EmailPass = {
    "test@test.com": "test1234",
  };
  List<String> BannableStrings = [
    "E-mail",
    "Password",
    "Clear",
  ];

  void addAccounts_ToBannableStrings() {
    BannableStrings.addAll(
        Accounts_EmailPass.keys.toList() + Accounts_EmailPass.values.toList());
  }

  // This sets our expectations for both TextFields after the operation.
  void setValid_EmailPass(
      {required String validEmail_ShouldBe,
      required String validPass_ShouldBe}) {
    Valid_Email = validEmail_ShouldBe;
    Valid_Pass = validPass_ShouldBe;
  }

  addAccounts_ToBannableStrings();

  String GenerateRandomString(int len) {
    final random = Random();
    final result = String.fromCharCodes(
        List.generate(len, (index) => random.nextInt(33) + 89));
    if (BannableStrings.contains(result)) {
      debugPrint(
          "regenerating string! due to the generated string matching one of the bannable strings in _BannableStrings List.");
      GenerateRandomString(len);
    }
    debugPrint("the generated String is: $result\nat ${DateTime.now()}");
    return result;
  }

  setUp(() {
    clear_ChipKey = find.byKey(const Key("clear_chip"));
    test_ChipKey = find.byKey(const Key("test_chip"));
    email_TextFieldKey = find.byKey(const Key("pass_textfield"));
    pass_TextFieldKey = find.byKey(const Key("email_textfield"));
  });

  group("clear Chip", () {
    testWidgets(
      "chip_Clear, it SHOULD EMPTY both of the email & pass TextFields",
      (widgetTester) async {
        // This sets what our expectations for both of the TextFields at the end of the operation.
        setValid_EmailPass(
          validEmail_ShouldBe: email_TextHint,
          validPass_ShouldBe: pass_TextHint,
        );
        // ToDo: to build the app in side setUp().
        // Build our app and trigger a frame.
        await widgetTester.pumpWidget(const MaterialApp(home: LoginScreen()));

        // Enter random texts in both of the TextFields.
        await widgetTester.enterText(
            email_TextFieldKey, GenerateRandomString(22));
        await widgetTester.enterText(
            pass_TextFieldKey, GenerateRandomString(8));

        // Tap the Clear Chip and trigger a frame.
        await widgetTester.tap(clear_ChipKey);
        await widgetTester.pump();

        // In this sub-group,
        // we are only expecting the TestHint for each TextField;
        // means there will be no Text in both of the Email & Pass TextFields.
        expect(find.text(email_TextHint), findsOneWidget);
        expect(find.text(pass_TextHint), findsOneWidget);
      },
    );
  });
  group(
    "auto fill-in Chips",
    () {
      testWidgets(
        "chip_Test, it SHOULD FILL both the email & pass TextFields",
        (tester) async {
          setValid_EmailPass(
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

          // Verify that our Screen has
          // one of each Valid Email & Pass.
          expect(find.text(Valid_Email), findsOneWidget);
          expect(find.text(Valid_Pass), findsOneWidget);
        },
      );
    },
  );
}
