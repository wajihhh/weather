// import 'package:flutter/material.dart';
//
// class CustomFormField extends StatelessWidget {
//   final String hintText;
//   final double height;
//   final RegExp validationRegEx;
//   final bool obscureText;
//   final void Function(String?) onSaved;
//
//   const CustomFormField(
//       {super.key,
//
//       required this.hintText,
//       required this.height,
//       required this.validationRegEx,
//       this.obscureText = false,
//         required this.onSaved,
//       });
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: height,
//       child: TextFormField(
//
//         onSaved: onSaved,
//         obscureText: obscureText,
//         validator: (value) {
//           if (value != null && validationRegEx.hasMatch(value)) {
//             return null;
//           }
//           return "Enter a valid ${hintText.toLowerCase()}";
//         },
//         decoration: InputDecoration(
//           border: OutlineInputBorder(),
//           hintText: hintText,
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  final String hintText;
  final double height;
  final RegExp validationRegEx;
  final bool obscureText;
  final void Function(String?) onSaved;
  final bool suffixIcon;

  const CustomFormField({
    super.key,
    required this.hintText,
    required this.height,
    required this.validationRegEx,
    this.obscureText = false,
    required this.onSaved,
    this.suffixIcon = false,
  });

  @override
  _CustomFormFieldState createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: TextFormField(
        onSaved: widget.onSaved,
        obscureText: _obscureText,
        validator: (value) {
          if (value != null && widget.validationRegEx.hasMatch(value)) {
            return null;
          }
          return "Enter a valid ${widget.hintText.toLowerCase()}";
        },
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: widget.hintText,
          suffixIcon: widget.obscureText
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: _toggleObscureText,
                )
              : null,
        ),
      ),
    );
  }
}
