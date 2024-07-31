import 'package:flutter/material.dart';

class SelectButton extends StatefulWidget {
  final String titleLabel;
  final String leftLabel;
  final String rightLabel;
  final double buttonWidth;
  final double buttonHeight;
  final Alignment alignment;
  final int selectedTab;
  final VoidCallback? onLeftButtonPressed; // 왼쪽 버튼 클릭 시 호출될 콜백
  final VoidCallback? onRightButtonPressed; // 오른쪽 버튼 클릭 시 호출될 콜백

  const SelectButton({
    super.key,
    required this.titleLabel,
    required this.leftLabel,
    required this.rightLabel,
    required this.buttonWidth,
    required this.buttonHeight,
    this.alignment = Alignment.centerLeft,
    this.selectedTab = 0,
    this.onLeftButtonPressed,
    this.onRightButtonPressed,
  });

  @override
  State<SelectButton> createState() => _SelectButtonState();
}

class _SelectButtonState extends State<SelectButton> {
  late bool _btn1Selected;
  late bool _btn2Selected;

  @override
  void initState() {
    super.initState();
    _btn1Selected = widget.selectedTab == 0;
    _btn2Selected = widget.selectedTab == 1;
  }

  void _onLeftPressed() {
    setState(() {
      _btn1Selected = true;
      _btn2Selected = false;
    });
    if (widget.onLeftButtonPressed != null) {
      widget.onLeftButtonPressed!(); // 왼쪽 버튼 클릭 시 콜백 호출
    }
  }

  void _onRightPressed() {
    setState(() {
      _btn1Selected = false;
      _btn2Selected = true;
    });
    if (widget.onRightButtonPressed != null) {
      widget.onRightButtonPressed!(); // 오른쪽 버튼 클릭 시 콜백 호출
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: widget.alignment == Alignment.centerLeft
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: 70,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.titleLabel,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: widget.alignment,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Container(
                  width: widget.buttonWidth,
                  height: widget.buttonHeight,
                  decoration: BoxDecoration(
                    color:
                        _btn1Selected ? Colors.black : const Color(0xffF1F3F5),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: TextButton(
                    onPressed: _onLeftPressed,
                    child: Text(
                      widget.leftLabel,
                      style: TextStyle(
                          color: _btn1Selected ? Colors.white : Colors.grey,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
              Container(
                width: widget.buttonWidth,
                height: widget.buttonHeight,
                decoration: BoxDecoration(
                  color: _btn2Selected ? Colors.black : const Color(0xffF1F3F5),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: TextButton(
                  onPressed: _onRightPressed,
                  child: Text(
                    widget.rightLabel,
                    style: TextStyle(
                        color: _btn2Selected ? Colors.white : Colors.grey,
                        fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
