import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextEditWidget extends StatefulWidget {
  final String text;
  const TextEditWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<TextEditWidget> createState() => _TextEditWidgetState();
}

class _TextEditWidgetState extends State<TextEditWidget> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    _textEditingController.text = widget.text;
    super.initState();
  }

  Widget _header() {
    return Container(
      padding:
          EdgeInsets.only(left: 15, right: 15, top: Get.mediaQuery.padding.top),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {},
            child: Row(
              children: const [
                Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 16,
                ),
                Text(
                  "프로필 편집",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.back(result: _textEditingController.text);
            },
            child: const Text(
              "완료",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _editTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        controller: _textEditingController,
        maxLength: 20,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 18, color: Colors.white),
        decoration: const InputDecoration(
          hintText: "평범하게 살자",
          hintStyle: TextStyle(fontSize: 18, color: Colors.white),
          counterStyle: TextStyle(fontSize: 14, color: Colors.white),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(0),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Column(
        children: [
          _header(),
          _editTextField(),
        ],
      ),
    );
  }
}
