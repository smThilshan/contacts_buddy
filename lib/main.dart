import 'package:contacts_buddy/models/contacts_model.dart';
import 'package:contacts_buddy/providers/contacts_provider.dart';
import 'package:contacts_buddy/screens/add_contacts_screen.dart';
import 'package:contacts_buddy/screens/contact_screen.dart';
import 'package:contacts_buddy/screens/contacts_detail_screen.dart';
import 'package:contacts_buddy/screens/search_contact_screen.dart';
import 'package:contacts_buddy/screens/update_contact_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: const AddContactScreen(),
    // );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ContactsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const ContactScreen(),
        routes: {
          ContactScreen.routeName: (context) => const ContactScreen(),
          AddContactScreen.routeName: (context) => const AddContactScreen(),
          ContactDetailScreen.routeName: (context) => ContactDetailScreen(
                  contact: Contact(
                id: 0,
                firstName: '',
                lastName: '',
                mobileNumber: '',
              )),
          SearchContactScreen.routeName: (context) =>
              const SearchContactScreen(),
          UpdateContactScreen.routeName: (context) => UpdateContactScreen(
                contact: Contact(
                  id: 0,
                  firstName: '',
                  lastName: '',
                  mobileNumber: '',
                ),
              ),
        },
      ),
    );

    // return MaterialApp(
    //   title: 'Contacts Buddy',
    //   home: const ContactScreen(),
    // );
  }
}
