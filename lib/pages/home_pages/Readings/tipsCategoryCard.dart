import 'package:flutter/material.dart';

class TipsCategoryCard extends StatelessWidget {
  final healthName;
  final healthDescription;
  final imagePath;
  final buttonName;
  TipsCategoryCard({
    @required this.healthName,
    @required this.healthDescription,
    @required this.imagePath,
    this.buttonName = 'Start now',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Container(
          height: 170,
          width: 380,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xffad51a5), Color(0xff5c54e2)],
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:8.0),
                        child: Text(
                          '$healthName',
                          maxLines: 2,
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: true,
                              applyHeightToLastDescent: true),
                          softWrap: true,
                          textScaleFactor: 1.1,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 21,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '$healthDescription',
                        softWrap: true,
                        textScaleFactor: 1.1,
                        style: TextStyle(
                            fontFamily: 'Inter', fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(Size(200, 50)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                            foregroundColor:
                            MaterialStateProperty.all(Colors.black),
                          ),
                          onPressed: () {},
                          child: Text('$buttonName')),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Container(
                    height: 170,
                    width: 160,
                    child: Image.asset('assets/images/$imagePath.jpg',fit: BoxFit.fill,)
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}