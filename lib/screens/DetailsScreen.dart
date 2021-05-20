import 'package:demo_skill_mine/models/DetailsModel.dart';
import 'package:demo_skill_mine/providers/ApiFactory.dart';
import 'package:demo_skill_mine/scoped-models/MainModel.dart';
import 'package:demo_skill_mine/widgets/MyWidgets.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final MainModel model;

  const DetailsScreen({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  DetailsModel model;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callApi();
  }

  void callApi() {
    widget.model.GETMETHODCALL(
        api: ApiFactory.BRIEF_BY_CATEGORY(prId: widget.model.productCode),
        fun: (Map<String, dynamic> map) {
          setState(() {
            model = DetailsModel.fromJson(map);
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        //automaticallyImplyLeading: false,
        titleSpacing: 5,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Details",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: (model!=null)?SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                            alignment: Alignment.center,
                            child: Image.network(
                              model.image,
                              //scale: 10,
                              fit: BoxFit.fitWidth,
                            )),
                        SizedBox(
                          height: 10,
                        ),

                        Text(
                          model.title,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(model.description),
                        MyWidgets.CircleContainer(model.category)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        /*margin: EdgeInsets.only(left: 10),*/
                        padding:
                            EdgeInsets.only(left: 10, right: 20, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/banner.png"),
                              fit: BoxFit.fitWidth),
                        ),
                        child: Text(
                          "Price: " + model.price,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ):Center(child: CircularProgressIndicator(),),
      ),
    );
  }


}
