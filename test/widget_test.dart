
import 'dart:math';

import 'package:cubotest/Presentation/state_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cubotest/main.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('Check the UI Flow /Widgets', (WidgetTester tester) async {
    Get.put(StateManager());
    await tester.pumpWidget(const MyApp());
    expect(find.text("Total"), findsOneWidget);
    expect(find.text("Minha Lista"), findsOneWidget);
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text("Novo Produto"), findsOneWidget);
    await tester.tap(find.text("Cancelar"));
    await tester.pump();
    expect(find.text("Novo Produto"), findsNothing);
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    await tester.tap(find.text("Salvar"));
    await tester.pump();

  });
}
