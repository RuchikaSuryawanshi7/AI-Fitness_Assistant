import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkoutComplete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF5C54E2).withOpacity(0.7),
                Color(0xFF5C54E2),
              ],
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 190,
              ),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image(
                    image: AssetImage('assets/images/check 2.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Congratulations!',
                style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFFFFFF)),
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 54.0),
                child: Text(
                  'You have successfully completed the workout',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFFFFFFF)),
                ),
              ),
              Expanded(child: Container()),
              Container(
                height: 39,
                width: 123,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Text(
                    'Next Step',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xFF151515),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 95,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
