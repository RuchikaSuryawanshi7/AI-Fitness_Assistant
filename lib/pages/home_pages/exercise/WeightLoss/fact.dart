import 'package:flutter/material.dart';

class FactPage extends StatelessWidget {
  const FactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF2F2F2ff),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.close,
              color: Colors.black,
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Fact ",
                  style: TextStyle(
                    color: Color(0xFF5C54E2),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "#1",
                  style: TextStyle(
                    color: Color(0xFFFAA352),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 10,
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  margin: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 65,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xFF5C54E2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '''Sleep deprivation could leave to open to colds, flu, and infection ''',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        height: 2,
                        width: 50,
                        color: Colors.white,
                      ),
                      Text(
                        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet arcu tincidunt eget sit mattis lobortis quis scelerisque ut. \nQuis ac blandit quam viverra suspendisse tortor, fames aenean vel. Nunc, ac habitasse''',
                        style: TextStyle(
                          color: Colors.white,
                          // fontWeight: FontWeight.w50/0,

                          fontSize: 16,
                          height: 1.3,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_right_alt_rounded,
                            color: Colors.blue,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 30,
                    ),
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(
                          image: AssetImage("assets/images/chand.png"),
                          // height: 20,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Image(
                          image: AssetImage("assets/images/bed3.png"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
