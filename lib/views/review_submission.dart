import 'package:quality_app/controllers/bottom_navigation_controller.dart';
import 'package:quality_app/controllers/review_submission_controller.dart';
import 'package:quality_app/packages/input_package.dart';
import 'package:flutter/material.dart';
import 'package:quality_app/packages/config_package.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class ReviewSubmission extends StatefulWidget {
  @override
  _ReviewSubmissionState createState() => _ReviewSubmissionState();
}

class _ReviewSubmissionState extends State<ReviewSubmission> with TickerProviderStateMixin {
  var reviewSubmissionCtrl = Get.put(ReviewSubmissionController());

  AnimationController _animationController;
  bool isPlaying = false;

  final emojiWidth = 40;

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

  List itemList = [
    {'title': 'Dr. Albert Cooper', 'image': user1, 'designation': 'Royal Londion Hospital', 'rating_image': badEmoji, 'rating_count': 10, 'star_rating': 1.5},
    {'title': 'Fabrizio', 'image': user1, 'designation': 'Care taker', 'rating_image': goodEmoji, 'rating_count': 14, 'star_rating': 1.5},
    {'title': 'Imam Tahir', 'image': user1, 'designation': 'Care taker', 'rating_image': veryGoodEmoji, 'rating_count': 50, 'star_rating': 1.5},
    {'title': 'Dina', 'price': '120', 'image': user1, 'designation': 'Care taker', 'rating_image': okEmoji, 'rating_count': 3, 'star_rating': 1.5},
    {'title': 'Kaja', 'image': user8, 'designation': 'Care taker', 'rating_image': goodEmoji, 'rating_count': 23, 'star_rating': 1.5},
    {'title': 'Pascal Kramp', 'image': user1, 'designation': 'Care taker', 'rating_image': sadEmoji, 'rating_count': 2, 'star_rating': 1.5},
    {'title': 'Patrick', 'image': user1, 'designation': 'Care taker', 'rating_image': badEmoji, 'rating_count': 30, 'star_rating': 1.5},
    {'title': 'Nitin Gadhiya', 'image': user8, 'designation': 'Care taker', 'rating_image': badEmoji, 'rating_count': 1, 'star_rating': 1.5},
    {'title': 'Banana', 'image': user8, 'designation': 'Care taker', 'rating_image': badEmoji, 'rating_count': 1, 'star_rating': 1.5},
    {'title': 'Mango', 'image': user8, 'designation': 'Care taker', 'rating_image': badEmoji, 'rating_count': 1, 'star_rating': 1.5},
    {'title': 'Apple', 'image': user8, 'designation': 'Care taker', 'rating_image': badEmoji, 'rating_count': 1, 'star_rating': 1.5},
    {'title': 'Banana', 'image': user8, 'designation': 'Care taker', 'rating_image': badEmoji, 'rating_count': 1, 'star_rating': 1.5},
    {'title': 'Mango', 'image': user8, 'designation': 'Care taker', 'rating_image': badEmoji, 'rating_count': 1, 'star_rating': 1.5},
    {'title': 'Apple', 'image': user8, 'designation': 'Care taker', 'rating_image': badEmoji, 'rating_count': 1, 'star_rating': 1.5},
    {'title': 'Banana', 'image': user8, 'designation': 'Care taker', 'rating_image': badEmoji, 'rating_count': 1.2, 'star_rating': 1.5},
    {'title': 'Mango', 'image': user8, 'designation': 'Care taker', 'rating_image': goodEmoji, 'rating_count': 4.5, 'star_rating': 1.5},
    {'title': 'Apple', 'image': user1, 'designation': 'Care taker', 'rating_image': veryGoodEmoji, 'rating_count': 5, 'star_rating': 1.5},
    {'title': 'Orange', 'image': user8, 'designation': 'Care taker', 'rating_image': sadEmoji, 'rating_count': 2.1, 'star_rating': 1.5},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        //backgroundColor: Colors.transparent,
        //elevation: 0,
        title: Text("Review"),
        // automaticallyImplyLeading: false,
      ),
      body: LoadingComponent(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: screenWidth(20)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: screenWidth(20)),
                  child: Container(
                    decoration: BoxDecoration(
                      // border: Border.all(color: Colors.grey[300]),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 8.0,
                          spreadRadius: 1,
                          offset: Offset(
                            0, // Move to right 10  horizontally
                            7, // Move to bottom 10 Vertically
                          ),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(screenWidth(15)),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(screenWidth(12)),
                          child: Image.asset(
                            user1,
                            height: screenWidth(80),
                            width: screenWidth(80),
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: screenWidth(15)),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              reviewSubmissionCtrl.name.toString(),
                              style: h2.copyWith(color: textPrimaryColor),
                            ),
                            SizedBox(height: screenWidth(5)),
                            Text(reviewSubmissionCtrl.phone.toString(), style: h4.copyWith(color: darkGreyColor)),
                            SizedBox(height: screenWidth(5)),
                            Text(reviewSubmissionCtrl.email.toString(), style: h4.copyWith(color: darkGreyColor)),
                            SizedBox(height: screenWidth(5)),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.start,
                            //   children: [
                            //     Image.asset(
                            //       veryGoodEmoji,
                            //       height: screenWidth(20),
                            //     ),
                            //     SizedBox(width: screenWidth(5)),
                            //     Text(
                            //       '(5)',
                            //       style: bodyStyle5.copyWith(color: darkGreyColor),
                            //     ),
                            //     SizedBox(width: screenWidth(5)),
                            //     Text(
                            //       '89 ratings',
                            //       style: bodyStyle5.copyWith(color: darkGreyColor),
                            //     ),
                            //   ],
                            // )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    DateTime date = await showDatePicker(
                      context: context,
                      firstDate: DateTime(DateTime.now().year - 5),
                      lastDate: DateTime(DateTime.now().year + 5),
                      initialDate: DateTime.now(),
                    );
                    reviewSubmissionCtrl.updateDate(date);
                  },
                  child: CustomTextFormField(
                    enabled: false,
                    container: reviewSubmissionCtrl.txtDateTime,
                    hintText: "Select Date Time",
                    prefixIcon: Icon(MdiIcons.calendar),
                    obscureText: false,
                    style: h3.merge(ls1),
                    keyboardType: TextInputType.text,
                    padding: 20,
                    validator: (val) {
                      if (val.isEmpty)
                        return 'Please enter some value';
                      else
                        return null;
                    },
                  ),
                ),
                SizedBox(height: screenHeight(30)),
                Obx(() => Align(
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text: TextSpan(
                        text: 'Give a rating :- ',
                        style: h3.copyWith(color: Colors.black54),
                        children: <TextSpan>[
                          TextSpan(text: reviewSubmissionCtrl.isRatingText, style: TextStyle(color: primaryColor)),
                        ],
                      ),
                    ))),
                SizedBox(height: screenHeight(10)),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          reviewSubmissionCtrl.selectedReview(5, 'Very Good');
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              veryGoodEmoji,
                              width: screenWidth(emojiWidth),
                            ),
                            SizedBox(height: screenWidth(5)),
                            // Container(
                            //   color: primaryColor,
                            //   height: 3,
                            //   width: screenWidth(30),
                            // ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          reviewSubmissionCtrl.selectedReview(4, 'Good');
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              goodEmoji,
                              width: screenWidth(emojiWidth),
                            ),
                            SizedBox(height: screenWidth(5)),
                            // Container(
                            //   color: primaryColor,
                            //   height: 3,
                            //   width: screenWidth(30),
                            // ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          reviewSubmissionCtrl.selectedReview(3, 'Ok');
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              okEmoji,
                              width: screenWidth(emojiWidth),
                            ),
                            SizedBox(height: screenWidth(5)),
                            // Container(
                            //   color: primaryColor,
                            //   height: 3,
                            //   width: screenWidth(30),
                            // ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          reviewSubmissionCtrl.selectedReview(2, 'Sad');
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              sadEmoji,
                              width: screenWidth(emojiWidth),
                            ),
                            SizedBox(height: screenWidth(5)),
                            // Container(
                            //   color: primaryColor,
                            //   height: 3,
                            //   width: screenWidth(30),
                            // ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          reviewSubmissionCtrl.selectedReview(1, 'Bad');
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              badEmoji,
                              width: screenWidth(emojiWidth),
                            ),
                            SizedBox(height: screenWidth(5)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight(30)),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Comment',
                    style: h3.copyWith(color: Colors.black54),
                  ),
                ),
                SizedBox(height: screenHeight(10)),
                CustomTextFormField(
                  maxLines: 3,
                  container: reviewSubmissionCtrl.txtComment,
                  hintText: "Write comment here...",
                  // prefixIcon: Icon(MdiIcons.commentOutline),
                  obscureText: false,
                  style: h3.merge(ls1),
                  keyboardType: TextInputType.multiline,
                  padding: screenWidth(20),
                  validator: (val) {
                    if (val.isEmpty)
                      return 'Please enter some value';
                    else
                      return null;
                  },
                ),
                SizedBox(height: screenHeight(30)),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Wish',
                    style: h3.copyWith(color: Colors.black54),
                  ),
                ),
                SizedBox(height: screenHeight(10)),
                CustomTextFormField(
                  maxLines: 3,
                  container: reviewSubmissionCtrl.txtWish,
                  hintText: "Write wish here...",
                  // prefixIcon: Icon(MdiIcons.commentOutline),
                  obscureText: false,
                  style: h3.merge(ls1),
                  keyboardType: TextInputType.multiline,
                  padding: screenWidth(20),
                  validator: (val) {
                    if (val.isEmpty)
                      return 'Please enter some value';
                    else
                      return null;
                  },
                ),
                SizedBox(height: screenWidth(30)),
                CustomButton(
                  title: 'Save',
                  onTap: () {
                    reviewSubmissionCtrl.saveReview();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: SafeArea(
      //   maintainBottomViewPadding: true,
      //   child: Padding(
      //     padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
      //     child: CustomButton(
      //       title: 'Save',
      //       onTap: () {
      //         reviewSubmissionCtrl.saveReview();
      //       },
      //     ),
      //   ),
      // ),
    );
  }
}
