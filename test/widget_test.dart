// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:flutter/services.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:contacts_androidx_example/src/view.dart' show Item;

import 'package:contacts_androidx_example/src/model.dart'
    show Contact, ContactsService, PostalAddress;

void main() {
  test('should get contacts', () async {
    final bool init = await ContactsService.initState();
    if (!init) return;
    final Iterable contacts = await ContactsService.getContacts();
    expect(contacts.length, greaterThan(0));
    expect(contacts, everyElement(isInstanceOf<Contact>()));
//    expect(contacts.toList()[0].givenName, 'givenName1');
//    expect(contacts.toList()[1].postalAddresses.toList()[0].label, 'label');
//    expect(contacts.toList()[1].emails.toList()[0].label, 'label');
  });

  test('should add contact', () async {
    await ContactsService.addContact({
      "givenName": 'givenName',
      "emails": [Item(label: 'label')],
      "phones": [Item(label: 'label')],
      "postalAddresses": [PostalAddress(label: 'label')],
    });
  });

  test('should delete contact', () async {
    await ContactsService.deleteContact({
      "givenName": 'givenName',
      "emails": [Item(label: 'label')],
      "phones": [Item(label: 'label')],
      "postalAddresses": [PostalAddress(label: 'label')],
    });
  });
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
        'postalAddresses': [
          {
            'label': 'label',
            'street': null,
            'city': null,
            'postcode': null,
            'region': null,
            'country': null
          }
        ],
        'avatar': null
      },
    ),
  ]);
}
