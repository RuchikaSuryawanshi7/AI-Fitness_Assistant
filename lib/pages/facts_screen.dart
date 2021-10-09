import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FactsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 210,
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F2F2),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(26.0),
                            child: Image(
                              image: AssetImage('assets/images/x.png'),
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.end,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'FACT',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF5C54E2),
                              fontSize: 30,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '#1',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFFAA352),
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 9.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF5C54E2),
                          borderRadius: BorderRadius.circular(40)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 89),
                            Text(
                              'Sleep deprivation could leave to open to colds, flu, and infection',
                              style: GoogleFonts.inter(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFFFFFFF)),
                            ),
                            SizedBox(height: 16),
                            Container(
                              width: 52,
                              height: 2,
                              decoration:
                                  BoxDecoration(color: Color(0xFFFFFFFF)),
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur '
                              'adipiscing elit. Amet arcu tincidunt eget '
                              'sit mattis lobortis quis scelerisque ut. '
                              'Quis ac blandit quam viverra suspendisse '
                              'tortor, fames aenean vel. Nunc, ac habitasse',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                            Expanded(child: Container()),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 53,
                                  width: 53,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Image(
                                    image:
                                        AssetImage('assets/images/arrow2.png'),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 143),
              child: Image(
                height: 129,
                width: 129,
                fit: BoxFit.cover,
                image: AssetImage('assets/images/factsImage2.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
