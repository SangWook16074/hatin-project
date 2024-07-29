import 'package:flutter/material.dart';

class SelectButton extends StatefulWidget {
  final String titleLabel;
  final String leftLabel;
  final String rightLabel;
  final double buttonWidth;
  final double buttonHeight;

  const SelectButton({
    super.key,
    required this.titleLabel,
    required this.leftLabel,
    required this.rightLabel,
    required this.buttonWidth,
    required this.buttonHeight,
  });

  @override
  State<SelectButton> createState() => _SelectButtonState();
}

class _SelectButtonState extends State<SelectButton> {
  bool _isFemaleSelected = false;
  bool _isMaleSelected = false;

  void _onFemalePressed() {
    setState(() {
      _isFemaleSelected = true;
      _isMaleSelected = false;
    });
  }

  void _onMalePressed() {
    setState(() {
      _isFemaleSelected = false;
      _isMaleSelected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: 50,
            child: Text(
              widget.titleLabel,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Container(
                width: widget.buttonWidth,
                height: widget.buttonHeight,
                decoration: BoxDecoration(
                  color: _isFemaleSelected
                      ? Colors.black
                      : const Color(0xffF1F3F5),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: TextButton(
                  onPressed: _onFemalePressed,
                  child: Text(
                    widget.leftLabel,
                    style: TextStyle(
                        color: _isFemaleSelected ? Colors.white : Colors.grey,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
            Container(
              width: widget.buttonWidth,
              height: widget.buttonHeight,
              decoration: BoxDecoration(
                color: _isMaleSelected ? Colors.black : const Color(0xffF1F3F5),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: TextButton(
                onPressed: _onMalePressed,
                child: Text(
                  widget.rightLabel,
                  style: TextStyle(
                      color: _isMaleSelected ? Colors.white : Colors.grey,
                      fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
