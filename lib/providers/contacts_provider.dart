import 'package:flutter/material.dart';
import '../models/contacts_model.dart';
import '../db_helper/database_handler.dart';

class ContactsProvider with ChangeNotifier {
  List<Contact> _contacts = [];

  List<Contact> get contacts => _contacts;

  Future<void> loadContacts() async {
    _contacts = await DatabaseHandler().getContacts();
    notifyListeners();
  }

  Future<List<Contact>> oldloadContacts() async {
    _contacts = await DatabaseHandler().getContacts();
    notifyListeners();
    return _contacts; // Return the list of contacts
  }

  Future<void> addContact(Contact contact) async {
    await DatabaseHandler().insertContact(contact);
    await _updateContacts();
  }

  Future<void> updateContact(Contact contact) async {
    await DatabaseHandler().updateContact(contact);
    _updateContacts();
  }

  Future<void> deleteContact(int id) async {
    await DatabaseHandler().deleteContact(id);
    _updateContacts();
  }

  Future<void> _updateContacts() async {
    _contacts = await DatabaseHandler().getContacts();
    notifyListeners();
    print('Contacts updated: $_contacts');
  }
}
