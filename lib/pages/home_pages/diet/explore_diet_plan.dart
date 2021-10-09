import 'package:fitness_app/constant/theme.dart';
import 'package:fitness_app/pages/home_pages/diet/dietItems.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class DietCategory extends StatelessWidget {
  final String? category;
  const DietCategory({Key? key,this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Diet',
          style: CustomTheme.title3.override(
            fontFamily: 'Inter',
            color: Color(0xFF333B5E),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: FaIcon(
            FontAwesomeIcons.chevronLeft,
            color: Color(0xFF333B5E),
            size: 17,
          ),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.0,),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  category!,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Diets',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30.0,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                height: 60.0,
                width: 400.0,
                child: ElevatedButton(
                    child: Text(
                        "Breakfast",
                        style: TextStyle(fontSize: 24, color: Colors.white)
                    ),
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurpleAccent),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),

                            )
                        )
                    ),
                    onPressed: () => Get.to(DietItems(
                      category: category,
                      subcategory: 'Breakfast',
                    )),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                height: 60.0,
                width: 400.0,
                child: ElevatedButton(
                    child: Text(
                        "Lunch",
                        style: TextStyle(fontSize: 24, color: Colors.white)
                    ),
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurpleAccent),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),

                            )
                        )
                    ),
                  onPressed: () => Get.to(DietItems(
                    category: category,
                    subcategory: 'Lunch',
                  )),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                height: 60.0,
                width: 400.0,
                child: ElevatedButton(
                    child: Text(
                        "Snacks",
                        style: TextStyle(fontSize: 24, color: Colors.white)
                    ),
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurpleAccent),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),

                            )
                        )
                    ),
                  onPressed: () => Get.to(DietItems(
                    category: category,
                    subcategory: 'Snacks',
                  )),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                height: 60.0,
                width: 400.0,
                child: ElevatedButton(
                    child: Text(
                        "Dinner",
                        style: TextStyle(fontSize: 24, color: Colors.white)
                    ),
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurpleAccent),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),

                            )
                        )
                    ),
                  onPressed: () => Get.to(DietItems(
                    category: category,
                    subcategory: 'Dinner',
                  )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
