// https://github.com/fluttercommunity/flutter_contacts/tree/master/example
// https://pub.dartlang.org/packages/contacts_service#-readme-tab-

import 'package:flutter/material.dart' show runApp;

import 'package:contacts_androidx_example/src/view.dart'
    show App, ContactsExampleApp;

void main() => runApp(MyApp());

class MyApp extends App {
  @override
  createView() => ContactsExampleApp();
}
