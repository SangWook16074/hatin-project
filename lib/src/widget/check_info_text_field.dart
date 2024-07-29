import 'package:flutter/material.dart';

class CheckInfoTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final bool isPassword;
  final bool hasError;
  final String errorMessage;
  final ValueChanged<String>? onChanged;
  final bool showPasswordToggle;

  const CheckInfoTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.isPassword,
    this.hasError = false,
    this.errorMessage = '',
    this.onChanged,
    this.showPasswordToggle = false,
  });

  @override
  State<CheckInfoTextField> createState() => _CheckInfoTextFieldState();
}

class _CheckInfoTextFieldState extends State<CheckInfoTextField> {
  final TextEditingController _controller = TextEditingController();
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (widget.onChanged != null) {
        widget.onChanged!(_controller.text);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: Text(
              widget.label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xffF1F3F5),
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(
                    color: widget.hasError ? Colors.red : Colors.transparent,
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _controller,
                    obscureText: widget.isPassword && !_passwordVisible,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.hintText,
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        color: Color(0xff9B9B9B),
                      ),
                      suffixIcon: widget.isPassword && widget.showPasswordToggle
                          ? IconButton(
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: _passwordVisible
                                    ? const Color(0xffFE4F28)
                                    : const Color(0xff9B9B9B),
                              ),
                              onPressed: _togglePasswordVisibility,
                            )
                          : null,
                    ),
                  ),
                ),
              ),
              if (widget.hasError && widget.errorMessage.isNotEmpty)
                Positioned(
                  right: 0,
                  top: -20,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      widget.errorMessage,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
