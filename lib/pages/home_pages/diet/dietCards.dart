import 'package:flutter/material.dart';

class DietCard extends StatelessWidget {
  final healthName;
  final healthDescription;
  final imagePath;
  final buttonName;

  DietCard({
    @required this.healthName,
    @required this.healthDescription,
    @required this.imagePath,
    this.buttonName = 'Start now',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
      child: Container(
        height: 170,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xffad51a5), Color(0xff5c54e2)],
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
                        fontSize: 17,
                        color: Colors.white
                      ),
                    ),
                  ),
                  Text(
                    '$healthDescription',
                    softWrap: true,
                    textScaleFactor: 1.1,
                    style: TextStyle(
                        fontFamily: 'Inter', fontWeight: FontWeight.w300),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ButtonStyle(
                          minimumSize:
                              MaterialStateProperty.all(Size(200, 50)),
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
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            Container(
              height: 170,
              width: 160,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                child: Image.asset(
                  '$imagePath',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
