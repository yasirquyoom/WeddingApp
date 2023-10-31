import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wedding_app/utilities/color_utilities.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String? hintText;
  final String? errorText;
  final Function()? onTap;
  final Function(String text)? onChange;
  final String? Function(String?)? validator;
  final int? maxLength;
  final int maxLine;
  final Color? color;
  final bool readOnly;
  final String? title;
  final bool? autoFocus;
  final List<TextInputFormatter>? formatter;
  final TextInputType keyBoardType;
  final Widget? prefixIcon;

  // final bool darkHintText;
  const CustomTextField(
      {Key? key,
      this.hintText,
      this.color,
      this.maxLine = 1,
      this.title,
      this.prefixIcon,
      this.errorText,
      this.formatter,
      this.onTap,
      this.readOnly = false,
      this.validator,
      this.maxLength,
      this.onChange,
      this.autoFocus = false,
      // this.isBlue = false,
      // this.darkHintText = false,
      this.keyBoardType = TextInputType.name,
      required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      autofocus: autoFocus ?? false,
      controller: textEditingController,
      cursorColor: Colors.white,
      keyboardType: keyBoardType,
      inputFormatters: formatter,
      maxLength: maxLength,
      maxLines: maxLine,
      onChanged: onChange,
      // readOnly: isBlue ?? false,
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return '* $errorText';
            }
            return null;
          },
      style: TextStyle(
        color: Colors.white,
      ),
      readOnly: readOnly,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        filled: true,
        fillColor: color ?? ColorUtilities.offButtonColor,
        contentPadding: EdgeInsets.only(left: 20, top: 30, right: 20),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 16,
          color: ColorUtilities.offWhite,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(30),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.8),
          borderRadius: BorderRadius.circular(30),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.8),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorUtilities.white,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
