import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/constant/theme.dart';
import 'package:fitness_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
class DietItems extends StatefulWidget {
  final String? category;
  final String? subcategory;
  const DietItems({Key? key,this.category,this.subcategory}) : super(key: key);

  @override
  _DietItemsState createState() => _DietItemsState();
}

class _DietItemsState extends State<DietItems> {
  bool loading=true;
  List<String> plans=[];
  late String url;

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData()async{
    DocumentSnapshot doc=await dietPlan.doc(widget.category).collection(widget.subcategory!).doc('Plan').get();
    if(doc.exists)
    {
      plans=List.from(doc['Plans']);
      url=doc['url'];
    }
    setState(() {
      loading=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 60,
        leading: IconButton(
          icon: FaIcon(
            FontAwesomeIcons.chevronLeft,
            color: Color(0xFF333B5E),
            size: 17,
          ),
          onPressed: () => Get.back(),
        ),
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
        centerTitle: true,
        elevation: 0,
      ),
      body: loading?Center(child: CircularProgressIndicator(),):ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 30.0,),
              Container(
                  width: 240.0,
                  height: 240.0,
                  decoration: new BoxDecoration(
                      boxShadow: [
                        //background color of box
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius:90.0, // soften the shadow
                          spreadRadius: 5.0, //extend the shadow
                          offset: Offset(
                            25.0, // Move to right 10  horizontally
                            25.0, // Move to bottom 10 Vertically
                          ),
                        )
                      ],
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new CachedNetworkImageProvider(url),
                      ),
                  ),
              ),
              SizedBox(height: 30.0,),
              Text(widget.subcategory!,
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.normal,
              ),)
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: plans.length,
              itemBuilder: (context,index){
                return Column(
                  children: [
                    Text("Option ${index+1}:",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),),
                    Text(plans[index],
                      style: TextStyle(
                          fontSize: 22.0
                      ),),
                    SizedBox(height: 10.0,),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
