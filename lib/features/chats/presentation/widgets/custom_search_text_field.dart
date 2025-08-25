import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key, this.focusNode});

  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      onTapOutside: (event) {
        focusNode?.unfocus();
      },
      decoration: InputDecoration(
        hintText: 'Ask Meta Al or Search',
        prefixIcon: FittedBox(
          fit: BoxFit.scaleDown,
          child: focusNode!.hasFocus
              ? InkWell(onTap: () {
                  focusNode?.unfocus();
                }, child: Icon(Icons.arrow_back))
              : FaIcon(FontAwesomeIcons.magnifyingGlass),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Theme.of(context).inputDecorationTheme.fillColor,
      ),
    );
  }
}
