import 'package:flutter/material.dart';

class SearchContactScreen extends StatefulWidget {
  static const routeName = 'search_contact_screen';
  const SearchContactScreen({super.key});

  @override
  State<SearchContactScreen> createState() => _SearchContactScreenState();
}

class _SearchContactScreenState extends State<SearchContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Search Contacts",
            style: TextStyle(
              fontFamily: 'OpenSans',
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: Colors.lightBlue,
          centerTitle: true,
        ),
        body: ListView());
  }
}
