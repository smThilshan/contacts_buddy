import 'package:contacts_buddy/models/contacts_model.dart';
import 'package:contacts_buddy/providers/contacts_provider.dart';
import 'package:contacts_buddy/screens/update_contact_screen.dart';
import 'package:contacts_buddy/widgets/my_icon_button.dart';
import 'package:contacts_buddy/widgets/my_textbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactDetailScreen extends StatelessWidget {
  static const routeName = 'contact_detail_screen';

  final Contact contact;

  const ContactDetailScreen({required this.contact, super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _firstName = TextEditingController();
    final TextEditingController _lastName = TextEditingController();
    final TextEditingController _mobileNumber = TextEditingController();
    // final TextEditingController _address = TextEditingController();
    // final TextEditingController _email = TextEditingController();

    final ContactsProvider contactsProvider = context.read<ContactsProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${contact.firstName} ${contact.lastName}",
          style: TextStyle(
            fontFamily: 'OpenSans',
            color: Colors.white,
            // fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 12),
              CircleAvatar(
                radius: 60.0, // Adjust the size as needed
                backgroundImage:
                    AssetImage('assets/profile_image.jpg'), // Use your image
              ),
              SizedBox(height: 15),
              // MyIconButton(
              //     onClick: () {},
              //     btnText: "Change image",
              //     btnIcon: Icon(Icons.edit)),
              // SizedBox(height: 10),

              // Add more details or actions as needed
            ],
          ),
          SizedBox(
            height: 15,
          ),
          MyTextBox(
            controller: _firstName,
            text: "First Name: ${contact.firstName}",
            boolValue: true,
          ),
          MyTextBox(
            controller: _lastName,
            text: "Last Name: ${contact.lastName}",
            boolValue: true,
          ),
          MyTextBox(
            controller: _mobileNumber,
            text: "Mobile No: ${contact.mobileNumber}",
            boolValue: true,
          ),
          // MyTextBox(
          //   controller: _address,
          //   text: "Address",
          // ),
          // MyTextBox(
          //   controller: _email,
          //   text: "Email",
          // ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Expanded(
              //   child: MyIconButton(
              //       onClick: () {},
              //       btnText: "Back",
              //       btnIcon: Icon(Icons.arrow_back_ios)),
              // ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: MyIconButton(
                    onClick: () async {
// Show a confirmation dialog before deleting
                      bool confirmDelete = await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Confirm Delete"),
                            content: Text(
                                "Are you sure you want to delete this contact?"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                                child: Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                                child: Text("Delete"),
                              ),
                            ],
                          );
                        },
                      );

                      if (confirmDelete == true) {
                        // Delete the contact
                        await contactsProvider.deleteContact(contact.id);

                        // Navigate back to the ContactScreen
                        Navigator.pop(context);
                      }
                    },
                    btnText: "Delete",
                    btnIcon: Icon(Icons.delete)),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: MyIconButton(
                    onClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateContactScreen(
                            contact: contact,
                          ),
                        ),
                      );
                    },
                    btnText: "Edit",
                    btnIcon: Icon(Icons.edit)),
              ),
            ],
          ),
        ],
      ),

      // body: Center(
      //   child: SingleChildScrollView(
      //     child:
      //   ),
      // ),
    );
  }
}
