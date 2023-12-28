import 'package:flutter/material.dart';
import 'package:contacts_buddy/models/contacts_model.dart';
import 'package:contacts_buddy/providers/contacts_provider.dart';
import 'package:provider/provider.dart';
import 'contacts_detail_screen.dart';

class SearchContactScreen extends StatefulWidget {
  static const routeName = 'search_contact_screen';

  const SearchContactScreen({super.key});

  @override
  _SearchContactScreenState createState() => _SearchContactScreenState();
}

class _SearchContactScreenState extends State<SearchContactScreen> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search Contacts",
          style: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              setState(() {
                _searchController.clear();
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: (query) {
                // Trigger search as the user types

                _performSearch(context, query);
              },
              decoration: InputDecoration(
                labelStyle: const TextStyle(color: Colors.black),
                fillColor: Colors.white,
                labelText: "Search",
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 14.0,
                    horizontal: 12.0), // Adjust the padding as needed
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.blue.shade400),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.blue.shade400),
                ),
              ),
            ),
          ),
          Expanded(
            child: _buildSearchResults(context),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults(BuildContext context) {
    final ContactsProvider contactsProvider = context.read<ContactsProvider>();
    final List<Contact> searchResults =
        contactsProvider.searchContacts(_searchController.text);

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        final Contact contact = searchResults[index];
        return ListTile(
          title: Text("${contact.firstName} ${contact.lastName}"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ContactDetailScreen(contact: contact),
              ),
            );
          },
        );
      },
    );
  }

  void _performSearch(BuildContext context, String query) {
    setState(() {});
  }
}
