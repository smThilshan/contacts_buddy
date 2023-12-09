import 'package:contacts_buddy/screens/contact_screen.dart';
import 'package:contacts_buddy/widgets/my_icon_button.dart';
import 'package:contacts_buddy/widgets/my_textbox.dart';
import 'package:flutter/material.dart';
import '../db_helper/database_handler.dart';
import '../models/contacts_model.dart';
import '../providers/contacts_provider.dart';
import 'package:provider/provider.dart';

class AddContactScreen extends StatelessWidget {
  static const routeName = 'add_contact_screen';

  const AddContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _firstName = TextEditingController();
    final TextEditingController _lastName = TextEditingController();
    final TextEditingController _mobileNumber = TextEditingController();
    // final TextEditingController _address = TextEditingController();
    // final TextEditingController _email = TextEditingController();

    Future<void> _saveContact() async {
      // Create a new Contact instance from the input data
      // Contact newContact = Contact(

      // );

      // // Insert the contact into the database
      // await DatabaseHandler().insertContact(newContact);

      // print('YYYYYYYYYYY');

      // Log a message to check if the insertion is successful

      ContactsProvider contactsProvider =
          Provider.of<ContactsProvider>(context, listen: false);
      Contact newContact = Contact(
        firstName: _firstName.text,
        lastName: _lastName.text,
        mobileNumber: _mobileNumber.text,
      );

      await contactsProvider.addContact(newContact);

      // print('Contact inserted: $newContact');

      Navigator.pop(context);
      // Navigator.popAndPushNamed(context, ContactScreen.routeName);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Contacts ",
          style: TextStyle(
            fontFamily: 'OpenSans',
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 12),
              const CircleAvatar(
                radius: 60.0, // Adjust the size as needed
                backgroundImage:
                    AssetImage('assets/profile_image.jpg'), // Use your image
              ),
              const SizedBox(height: 15),
              MyIconButton(
                  onClick: () {},
                  btnText: "Add image",
                  btnIcon: Icon(Icons.add)),
              SizedBox(height: 10),

              // Add more details or actions as needed
            ],
          ),
          SizedBox(
            height: 15,
          ),
          MyTextBox(
            controller: _firstName,
            text: "First Name",
          ),
          MyTextBox(
            controller: _lastName,
            text: "Last Name",
          ),
          MyTextBox(
            controller: _mobileNumber,
            text: "Mobile No",
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
              Expanded(
                child: MyIconButton(
                    onClick: () {},
                    btnText: "Cancel",
                    btnIcon: Icon(Icons.cancel_rounded)),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: MyIconButton(
                    onClick: _saveContact,
                    btnText: "Save",
                    btnIcon: Icon(Icons.save)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
