import 'dart:async';

import 'package:demo_skill_mine/models/ProductsModel.dart';
import 'package:demo_skill_mine/providers/ApiFactory.dart';
import 'package:demo_skill_mine/scoped-models/MainModel.dart';
import 'package:demo_skill_mine/widgets/MyWidgets.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  final MainModel model;

  const DashboardScreen({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<dynamic> categoryList = [];
  List<ProductsModel> productList = [];

  final controllerCategory = new StreamController<List<dynamic>>();
  StreamController controllerProduct =
      new StreamController<List<ProductsModel>>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _callCategoryApi();
    _callProductApi(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          "All Category",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          children: [
            (categoryList != null && categoryList.length > 0)
                ? SizedBox(
                    height: 40,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, i) {
                        return InkWell(
                          onTap: () {
                            _callProductApi(
                                categoryList[i].toString().toLowerCase());
                          },
                          child: MyWidgets.CircleContainer(categoryList[i]),
                        );
                      },
                      itemCount: categoryList.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  )
                : Container(child: Text("Wait Loading")),
            Divider(),
            (productList != null && productList.length > 0)
                ? Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, i) {
                        ProductsModel model = productList[i];
                        return Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              margin: EdgeInsets.only(
                                  bottom: 10, left: 10, right: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(
                                        5.0) //                 <--- border radius here
                                    ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                      alignment: Alignment.center,
                                      child: Image.network(
                                        model.image,
                                        scale: 10,
                                        fit: BoxFit.fitWidth,
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    model.title,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(model.description),
//                                  Text("Price " + model.price),
                                  MaterialButton(
                                    onPressed: () {
                                      widget.model.productCode = model.id;
                                      Navigator.pushNamed(context, "/details");
                                    },
                                    minWidth: double.maxFinite,
                                    child: Text(
                                      "View Details",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    color: Colors.indigo,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, left: 10),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  /*margin: EdgeInsets.only(left: 10),*/
                                  padding: EdgeInsets.only(
                                      left: 10, right: 20, top: 5, bottom: 5),
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
                        );
                      },
                      itemCount: productList.length,
                      scrollDirection: Axis.vertical,
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ],
        ),
      ),
    );
  }

  _callCategoryApi() {
    widget.model.GETMETHODCALL(
        api: ApiFactory.ALL_CATEGORY,
        fun: (List<dynamic> list) {
          categoryList = list;
        });
  }

  _callProductApi(String value) {
    widget.model.GETMETHODCALL(
        api: value == null
            ? ApiFactory.ALL_PRODUCT
            : ApiFactory.FILETR_BY_CATEGORY(crID: value),
        fun: (dynamic products) {
          productList.clear();
          products.forEach((element) {
            productList.add(ProductsModel.fromJson(element));
          });
          setState(() => productList);
        });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controllerCategory.close();
    controllerProduct.close();
    super.dispose();
  }
}
