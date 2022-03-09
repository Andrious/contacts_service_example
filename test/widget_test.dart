// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:contacts_service_example/src/controller.dart';

import 'package:contacts_service_example/src/model.dart' show Contact;

import 'package:flutter/services.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  final Controller con = Controller();
  final Contact contact = Contact();
  test('should get contacts', () async {
    final bool init = await con.initAsync();
    if (!init) {
      return;
    }
    final List<Contact>? contacts = await con.getContacts();
    expect(contacts!.length, greaterThan(0));
    expect(contacts, everyElement(isInstanceOf<Contact>()));
//    expect(contacts.toList()[0].givenName, 'givenName1');
//    expect(contacts.toList()[1].postalAddresses.toList()[0].label, 'label');
//    expect(contacts.toList()[1].emails.toList()[0].label, 'label');
  });

  // test('should add contact', () async {
  //   await contact.add({
  //     'givenName': 'givenName',
  //     'emails': [DataFieldItem(label: 'label')],
  //     'phones': [DataFieldItem(label: 'label')],
  //   });
  // });
  //
  // test('should delete contact', () async {
  //   await contact.delete({
  //     'givenName': 'givenName',
  //     'emails': [DataFieldItem(label: 'label')],
  //     'phones': [DataFieldItem(label: 'label')],
  //   });
  // });
}

void expectMethodCall(List<MethodCall> log, String methodName) {
  expect(log, <Matcher>[
    isMethodCall(
      methodName,
      arguments: <String, dynamic>{
        'identifier': null,
        'displayName': null,
        'givenName': 'givenName',
        'middleName': null,
        'familyName': null,
        'prefix': null,
        'suffix': null,
        'company': null,
        'jobTitle': null,
        'emails': [
          {'label': 'label', 'value': null}
        ],
        'phones': [
          {'label': 'label', 'value': null}
        ],
        'avatar': null
      },
    ),
  ]);
}
