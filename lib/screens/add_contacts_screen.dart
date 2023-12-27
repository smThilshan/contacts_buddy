import 'package:contacts_buddy/screens/contact_screen.dart';
import 'package:contacts_buddy/widgets/my_icon_button.dart';
import 'package:contacts_buddy/widgets/my_textbox.dart';
import 'package:flutter/material.dart';
import '../db_helper/database_handler.dart';
import '../models/contacts_model.dart';
import '../providers/contacts_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../models/contacts_model.dart';
import '../providers/contacts_provider.dart';
import '../widgets/my_icon_button.dart';
import '../widgets/my_textbox.dart';
import 'package:provider/provider.dart';

class AddContactScreen extends StatelessWidget {
  static const routeName = 'add_contact_screen';

  const AddContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _firstName = TextEditingController();
    final TextEditingController _lastName = TextEditingController();
    final TextEditingController _mobileNumber = TextEditingController();

    Future<void> _saveContact() async {
      ContactsProvider contactsProvider =
          Provider.of<ContactsProvider>(context, listen: false);

      Contact newContact = Contact(
        id: 0, // You may need to assign the correct value for the id
        firstName: _firstName.text,
        lastName: _lastName.text,
        mobileNumber: _mobileNumber.text,
      );

      await contactsProvider.addContact(newContact);

      Navigator.pop(context);
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
              // const CircleAvatar(
              //   radius: 60.0,
              //   backgroundImage: AssetImage('assets/profile.jpg'),
              // ),
              const SizedBox(height: 15),
              MyIconButton(
                onClick: () {},
                btnText: "Add image",
                btnIcon: Icon(Icons.add),
              ),
              SizedBox(height: 10),
            ],
          ),
          SizedBox(height: 15),
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
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: MyIconButton(
                  onClick: () {},
                  btnText: "Cancel",
                  btnIcon: Icon(Icons.cancel_rounded),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: MyIconButton(
                  onClick: _saveContact,
                  btnText: "Save",
                  btnIcon: Icon(Icons.save),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
