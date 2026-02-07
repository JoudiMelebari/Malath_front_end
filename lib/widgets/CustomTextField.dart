import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.inputFormatters,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      child: Builder(
        builder: (context) {
          final hasFocus = Focus.of(context).hasFocus;

          return TextField(
            controller: widget.controller,
            obscureText: _isObscure,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            inputFormatters: widget.inputFormatters ?? [],
            textAlign: TextAlign.right, // ✅ RTL
            textDirection: TextDirection.rtl,
            style: const TextStyle(color: Colors.black),

            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: hasFocus ? Colors.black54 : Colors.black38,
              ),

              filled: true,
              fillColor:
                  hasFocus
                      ? const Color(0xFF1565FF).withOpacity(0.08)
                      : const Color(0xFFF2F2F5),

              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xFF1565FF),
                  width: 2,
                ),
              ),

              // 👁️ العين (فقط لو حقل كلمة مرور)
              suffixIcon:
                  widget.obscureText
                      ? IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      )
                      : null,
            ),

            cursorColor: const Color(0xFF1565FF),
          );
        },
      ),
    );
  }
}
