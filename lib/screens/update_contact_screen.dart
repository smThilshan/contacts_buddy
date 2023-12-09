import 'package:contacts_buddy/widgets/my_icon_button.dart';
import 'package:contacts_buddy/widgets/my_textbox.dart';
import 'package:flutter/material.dart';

class UpdateContactScreen extends StatelessWidget {
  static const routeName = 'update_contact_screen';
  const UpdateContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _firstName = TextEditingController();
    final TextEditingController _lastName = TextEditingController();
    final TextEditingController _mobileNumber = TextEditingController();
    final TextEditingController _address = TextEditingController();
    final TextEditingController _email = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Contacts",
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
                  btnText: "Change image",
                  btnIcon: Icon(Icons.edit)),
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
          MyTextBox(
            controller: _address,
            text: "Address",
          ),
          MyTextBox(
            controller: _email,
            text: "Email",
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: MyIconButton(
                    onClick: () {},
                    btnText: "Back",
                    btnIcon: Icon(Icons.arrow_back_ios)),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: MyIconButton(
                    onClick: () {}, btnText: "Save", btnIcon: Icon(Icons.save)),
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
