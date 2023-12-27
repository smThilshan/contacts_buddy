import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contacts_buddy/models/contacts_model.dart';
import 'package:contacts_buddy/widgets/my_icon_button.dart';
import 'package:contacts_buddy/providers/contacts_provider.dart';
import 'package:contacts_buddy/screens/add_contacts_screen.dart';
import 'package:contacts_buddy/screens/search_contact_screen.dart';
import 'contacts_detail_screen.dart';

class ContactScreen extends StatefulWidget {
  static const routeName = 'contact_screen';

  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    ContactsProvider contactsProvider = context.read<ContactsProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Contacts Buddy",
          style: TextStyle(
            fontFamily: 'OpenSans',
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      body: FutureBuilder<List<Contact>>(
        future: contactsProvider.oldloadContacts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<Contact> contacts = snapshot.data!;

            return Container(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MyIconButton(
                        btnIcon: Icon(Icons.add),
                        btnText: "Add Contacts",
                        onClick: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddContactScreen(),
                            ),
                          );
                        },
                      ),
                      MyIconButton(
                        btnIcon: Icon(Icons.search),
                        btnText: "Search Contacts",
                        onClick: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchContactScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Divider(),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: contacts.length,
                      itemBuilder: (_, index) => Card(
                        margin: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 5,
                        ),
                        child: ListTile(
                          title: Text(
                            '${contacts[index].firstName} ${contacts[index].lastName}',
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ContactDetailScreen(
                                  contact: contacts[index],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
