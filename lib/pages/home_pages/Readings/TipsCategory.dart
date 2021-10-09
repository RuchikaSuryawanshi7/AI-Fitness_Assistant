import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/main.dart';
import 'package:fitness_app/pages/home_pages/Readings/freakyTips.dart';
import 'package:fitness_app/pages/home_pages/Readings/tipsCategoryCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TipsCategory extends StatefulWidget {
  TipsCategory({Key? key}) : super(key: key);

  @override
  _TipsCategoryState createState() => _TipsCategoryState();
}

class _TipsCategoryState extends State<TipsCategory> {
  bool loading=true;
  List<String> tipsData=[];

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData()async{
    DocumentSnapshot snapshot=await tipsReference.doc('resourceList').get();
    tipsData=List.from(snapshot['data']);
    setState(() {
      loading=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
          title: Text(
            "Freaky Facts",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: loading?Center(child: CircularProgressIndicator(),):SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 5),
                child: Text(
                  'Freaky',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 10, bottom: 4),
                child: Text(
                  'Tips',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: tipsData.length,
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: ()=>Get.to(FreakyTips(
                      heading: tipsData[index],
                    )),
                    child: TipsCategoryCard(
                      healthName: tipsData[index],
                      healthDescription: '',
                      imagePath: tipsData[index],
                      buttonName: 'Read more',
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
