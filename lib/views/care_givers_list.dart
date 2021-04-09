import 'package:quality_app/controllers/bottom_navigation_controller.dart';
import 'package:quality_app/packages/input_package.dart';
import 'package:flutter/material.dart';
import 'package:quality_app/packages/config_package.dart';
import 'package:quality_app/controllers/store_controller.dart';
import 'package:intl/intl.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CareGiversList extends StatefulWidget {
  @override
  _CareGiversListState createState() => _CareGiversListState();
}

class _CareGiversListState extends State<CareGiversList> with TickerProviderStateMixin {
  var bottomCtrl = Get.put(BottomNavigationController());
  var storeCtrl = Get.put(StoreController());

  AnimationController _animationController;
  bool isPlaying = false;

  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget personDetailCard(item, index, status) {
    dynamic email = item['email'];
    dynamic imageName = item['profile_photo_url'];
    String name = item['name'].toString();
    String phone = item['phone'].toString();
    int empId = item['id'];
    return InkWell(
      onTap: () {
        navigateReviewScreen(empId, name, email, phone, imageName);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: screenWidth(8), horizontal: screenWidth(20)),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: screenWidth(5.0)),
          decoration: BoxDecoration(border: Border.all(width: 1, color: deactivateColor), borderRadius: BorderRadius.circular(screenWidth(10))),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenWidth(8), horizontal: screenWidth(10)),
                child: Container(
                    width: screenWidth(60.0),
                    height: screenWidth(60.0),
                    decoration: new BoxDecoration(shape: BoxShape.circle, image: new DecorationImage(fit: BoxFit.cover, image: NetworkImage(imageName)))),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      name,
                      style: bodyStyle5.copyWith(color: black22Color),
                    ),
                    // Text(
                    //   phone,
                    //   style: bodyStyle6.copyWith(color: grayColor),
                    // ),
                  ],
                ),
              ),
              // Container(
              //   padding: EdgeInsets.only(right: screenWidth(10.0)),
              //   child: CustomButton(
              //     title: 'Profile',
              //     width: screenWidth(80),
              //     padding: screenWidth(5),
              //     radius: screenWidth(5),
              //     style: bodyStyle6.copyWith(color: Colors.white),
              //   ),
              // ),
              // Container(
              //     padding: EdgeInsets.only(right: screenWidth(10.0)),
              //     child: Icon(
              //       MdiIcons.chevronRight,
              //       size: screenHeight(30),
              //       color: grayColor,
              //     )),
            ],
          ),
        ),
      ),
    );
  }

  void navigateReviewScreen(empId, name, email, phone, userImage) {
    Get.toNamed(AppRouter.careGiverProfile, arguments: {'id': empId, 'name': name, 'email': email, 'phone': phone, 'userImage': userImage});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   title: Align(
      //     alignment: Alignment.topLeft,
      //     child: Column(
      //       children: [
      //         Text(
      //           "Quality Control",
      //           style: h1.copyWith(color: black22Color),
      //           textAlign: TextAlign.left,
      //         ),
      //         Text(
      //           "Your review is making a difference!",
      //           style: bodyStyle4.copyWith(color: black22Color),
      //           textAlign: TextAlign.left,
      //         ),
      //       ],
      //     ),
      //   ),
      //   actions: [
      //     IconButton(
      //         icon: Icon(
      //           MdiIcons.logoutVariant,
      //           color: Colors.white,
      //         ),
      //         onPressed: () {
      //           storeCtrl.logout();
      //         })
      //   ],
      // ),
      body: SafeArea(
        child: LoadingComponent(
          child: Container(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Care Givers',
                                style: h1,
                              ),
                              Spacer(),
                              Image.asset(
                                notificationIcon,
                                width: screenWidth(20),
                              ),
                              SizedBox(
                                width: screenWidth(15),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 10),
                    Expanded(
                      child: SizedBox(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GetBuilder<StoreController>(
                                builder: (_dx) => ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: _dx.itemList.length,
                                  itemBuilder: (context, index) {
                                    if (index == 0 || index == 1 || index == 2) return personDetailCard(_dx.itemList[index], index, 'working');
                                    return Container();
                                  },
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                    /* Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
                      child: Text(
                        'Working Vist',
                        style: h6,
                      ),
                    ),*/
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
                    //   // child: CustomTextFormField(
                    //   //   hintText: 'Search Contact',
                    //   //   prefixIcon: Icon(MdiIcons.magnify),
                    //   //   fillColor: Colors.grey.withOpacity(0.1),
                    //   // ),
                    // ),
                    /*Expanded(
                      child: Container(
                          child: GetBuilder<StoreController>(
                        builder: (_dx) => ListView.builder(
                          itemCount: _dx.itemList.length,
                          itemBuilder: (context, index) {
                            if (index == 0 || index == 1 || index == 2) return personDetailCard(_dx.itemList[index], index);
                            return Container();
                          },
                        ),
                      )),
                    ),*/

                    /*Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
                      child: Text(
                        'Unrated Vist',
                        style: h6,
                      ),
                    ),*/
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
