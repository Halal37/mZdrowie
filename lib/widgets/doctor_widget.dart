import 'package:flutter/material.dart';

String sepText(String text, int n) {
  String result = '';

  int currentIndex = 0;

  while (currentIndex < text.length) {
    if (currentIndex % n == 0 && currentIndex != 0) result += '\n';
    result += text[currentIndex];
    currentIndex++;
  }

  return result;
}

class DoctorWidget extends StatelessWidget {
  final String name;
  final String speciality;
  final AssetImage image;
  final VoidCallback onPressed;
  bool _hasBeenPressed = false;

  DoctorWidget({
    required this.name,
    required this.speciality,
    required this.image,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ButtonTheme(
          child: RaisedButton(
            textColor: _hasBeenPressed ? Colors.white : Colors.black,
            color: _hasBeenPressed ? Colors.red:Colors.transparent,
            elevation: 0,
            padding: EdgeInsets.all(0),
            child: Row(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: image,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          color: Color(0xff263139),
                          fontSize: 15,
                          fontFamily: "Circe",
                          height: 1.2,
                        ),
                      ),
                      Text(
                        speciality,
                        style: TextStyle(
                          color: Color(0xff263139),
                          fontSize: 12,
                          fontFamily: "Circe",
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
