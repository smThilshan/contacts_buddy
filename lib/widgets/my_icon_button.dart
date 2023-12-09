import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final VoidCallback onClick;
  final String btnText;
  final Icon btnIcon;

  const MyIconButton({
    required this.onClick,
    required this.btnText,
    required this.btnIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onClick,
      icon: btnIcon,
      label: Text(
        btnText,
        style: const TextStyle(
          fontFamily: 'OpenSans',
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
