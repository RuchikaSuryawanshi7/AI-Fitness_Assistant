import 'package:flutter/material.dart';

class FreakyPlansCard extends StatelessWidget {
  final healthName;
  final healthDescription;
  final imagePath;
  final buttonName;

  FreakyPlansCard({
    required this.healthName,
    required this.healthDescription,
    required this.imagePath,
    this.buttonName = 'Start now',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
      child: Container(
        height: 170,
        width: MediaQuery.of(context).size.width*0.9,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xffad51a5), Color(0xff5c54e2)],
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 4),
                    child: Text(
                      '$healthName',
                      maxLines: 2,
                      textHeightBehavior: TextHeightBehavior(
                          applyHeightToFirstAscent: true,
                          applyHeightToLastDescent: true),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      textScaleFactor: healthDescription != '' ? 1.1 : 1.3,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  healthDescription != ''
                      ? SizedBox(height: 4)
                      : SizedBox(height: 0),
                  healthDescription != ''
                      ? Text(
                          '$healthDescription',
                          softWrap: true,
                          textScaleFactor: 1.1,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        )
                      : Text(''),
                  healthDescription != ''
                      ? SizedBox(
                          height: 10,
                        )
                      : SizedBox(height: 0),
                  ElevatedButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(200, 50)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
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
            ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              child: Container(
                height: 170,
                width: 160,
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
