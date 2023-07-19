import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:women_lose_weight_flutter/database/table/home_plan_table.dart';
import 'package:women_lose_weight_flutter/newupdate/DeitPlan.dart';
import 'package:women_lose_weight_flutter/routes/app_routes.dart';
import 'package:women_lose_weight_flutter/ui/days_plan_detail/views/days_plan_detail_screen.dart';
import 'package:women_lose_weight_flutter/ui/plan/controllers/plan_controller.dart';
import 'package:women_lose_weight_flutter/utils/sizer_utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../utils/color.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../../home/controllers/home_controller.dart';

class PlanScreen extends StatelessWidget {
  PlanScreen({Key? key}) : super(key: key);

  final PlanController _planController = Get.find<PlanController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.height_3,
        horizontal: AppSizes.width_5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "txtAppName".tr,
            maxLines: 1,
            style: TextStyle(
              color: AppColor.black,
              fontSize: AppFontSize.size_16,
              fontWeight: FontWeight.w700,
            ),
          ),
          InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DeitPlanScreen()));
              },
              child: carouselSlider()),
          _widgetRecentExercise(),
          dayExerciseWidget(),
          _textDaily(),
          _widgetWaterTracker(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Fast Workout".tr,
              style: TextStyle(
                color: AppColor.black,
                fontSize: AppFontSize.size_14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          fastWorkoutWidget(),
          _textBodyFocus(),
          _bodyFocusGrid(),
        ],
      ),
    );
  }

  InkWell fastWorkoutWidget() {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.fastWorkOut)!
            .then((value) => _planController.refreshData());
      },
      child: Container(
        height: AppSizes.height_24,
        width: AppSizes.fullWidth,
        margin: const EdgeInsets.only(top: 4),
        padding: EdgeInsets.symmetric(
            vertical: AppSizes.height_3, horizontal: AppSizes.width_5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: const DecorationImage(
            image: AssetImage("assets/images/fastworkout.png"),
            fit: BoxFit.fill,
          ),
          boxShadow: kElevationToShadow[2],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(
              "txt2To7MinFastWorkout".tr,
              textAlign: TextAlign.left,
              maxLines: 2,
              style: TextStyle(
                color: AppColor.black,
                fontSize: AppFontSize.size_14,
                fontWeight: FontWeight.w700,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: MaterialButton(
                height: 38,
                shape: const StadiumBorder(),
                color: AppColor.black,
                child: Text(
                  "GO!".tr,
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: AppFontSize.size_13,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  GetBuilder<PlanController> dayExerciseWidget() {
    return GetBuilder<PlanController>(
      id: Constant.idYourPlanProgressDetails,
      builder: (logic) {
        return Container(
            width: AppSizes.fullWidth,
            height: AppSizes.height_10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23.0),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  const Color(0xffBBF246),
                  const Color(0xffBBF246).withOpacity(0.2),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        logic.btnDays == "Finished"
                            ? "txtFinished".tr
                            : "txtDay".tr.toUpperCase() + logic.btnDays,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xff192126),
                          fontSize: AppFontSize.size_15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "7 Excercises".tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xff192126),
                          fontSize: AppFontSize.size_10,
                        ),
                      ),
                    ],
                  ),
                  MaterialButton(
                    shape: const StadiumBorder(),
                    color: AppColor.black,
                    child: Text(
                      "Start".tr,
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: AppFontSize.size_13,
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed(AppRoutes.daysPlanDetail)!
                          .then((value) => _planController.refreshData());
                    },
                  )
                ],
              ),
            ));
      },
    );
  }

  CarouselSlider carouselSlider() {
    return CarouselSlider(
      items: [
        Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: const DecorationImage(
              image: AssetImage("assets/images/banner1.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: const DecorationImage(
                image: AssetImage("assets/images/banner2.png"),
                fit: BoxFit.cover,
              )),
        ),
        Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: const DecorationImage(
                image: AssetImage("assets/images/banner3.png"),
                fit: BoxFit.cover,
              )),
        ),
      ],
      options: CarouselOptions(
        height: 180.0,
        enlargeCenterPage: false,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.9,
      ),
    );
  }

  _widgetRecentExercise() {
    return GetBuilder<PlanController>(
        id: Constant.idPlanRecentHistory,
        builder: (logic) {
          if (logic.recentHistoryList.isNotEmpty) {
            return Container(
              margin: EdgeInsets.only(bottom: AppSizes.height_3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "txtRecent".tr,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColor.black,
                            fontSize: AppFontSize.size_14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.recent,
                                  arguments: [logic.recentHistoryList])!
                              .then((value) => logic.refreshData());
                        },
                        child: Text(
                          "txtViewAll".tr,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: AppColor.primary,
                            fontSize: AppFontSize.size_10_5,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSizes.height_1_5),
                  InkWell(
                    onTap: () {
                      logic.onRecentItemClick();
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          logic.recentHistoryList.isNotEmpty
                              ? Constant.getAssetImage() +
                                  logic.recentHistoryList[0].planDetail!
                                      .planThumbnail +
                                  ".webp"
                              : Constant.getAssetImage() +
                                  "history_butt_lift.webp",
                          height: AppSizes.height_6_5,
                          width: AppSizes.height_6_5,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppSizes.width_6),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  logic.recentHistoryList.isNotEmpty
                                      ? Utils.getMultiLanguageString(
                                          logic.recentHistoryList[0].hPlanName!)
                                      : "",
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: AppColor.black,
                                    fontSize: AppFontSize.size_13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: AppSizes.height_0_8),
                                FutureBuilder(
                                    future: logic.getRecentItemTime(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Text(
                                          snapshot.data.toString(),
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: AppColor.txtColor666,
                                            fontSize: AppFontSize.size_8_5,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        );
                                      }
                                      return const SizedBox();
                                    }),
                              ],
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: AppColor.primary,
                          size: AppSizes.height_1_8,
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: AppColor.grayDivider,
                    height: AppSizes.height_0_05,
                    margin: EdgeInsets.only(
                        left: AppSizes.width_15, top: AppSizes.height_1_5),
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        });
  }

  _widgetSelectedPlan() {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.daysPlanDetail)!
            .then((value) => _planController.refreshData());
      },
      child: SizedBox(
        height: AppSizes.height_42,
        width: AppSizes.fullWidth,
        child: Stack(
          fit: StackFit.expand,
          children: [
            GetBuilder<PlanController>(
              id: Constant.idYourPlanProgressDetails,
              builder: (logic) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: AppColor.shadow,
                        offset: Offset(0.0, 2.5),
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      Utils.getSelectedPlanImage(
                          _planController.currentPlanIndex),
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            ),
            Container(
              width: AppSizes.fullWidth,
              padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.width_6, vertical: AppSizes.height_2_5),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.whatsYourGoal)!
                          .then((value) => _planController.refreshData());
                    },
                    child: Image.asset(
                      Constant.getAssetIcons() + "ic_homepage_change.webp",
                      height: AppSizes.height_4,
                      width: AppSizes.height_4,
                    ),
                  ),
                  Expanded(child: Container()),
                  GetBuilder<PlanController>(
                    id: Constant.idYourPlanProgressDetails,
                    builder: (logic) {
                      return AutoSizeText(
                        Utils.getSelectedPlanName(
                            _planController.currentPlanIndex),
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: AppFontSize.size_15,
                          fontWeight: FontWeight.w700,
                        ),
                      );
                    },
                  ),
                  GetBuilder<PlanController>(
                    id: Constant.idYourPlanProgressDetails,
                    builder: (logic) {
                      return Container(
                        margin: EdgeInsets.only(
                            right: AppSizes.height_12,
                            top: AppSizes.height_1_2,
                            bottom: AppSizes.height_1_2),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: LinearProgressIndicator(
                            value: logic.pbDay,
                            minHeight: AppSizes.height_1,
                            backgroundColor: AppColor.white,
                            color: AppColor.primary,
                          ),
                        ),
                      );
                    },
                  ),
                  GetBuilder<PlanController>(
                    id: Constant.idYourPlanProgressDetails,
                    builder: (logic) {
                      return Text(
                        logic.txtDayLeft + "\t" + "txtDaysLeft".tr,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: AppFontSize.size_12,
                          fontWeight: FontWeight.w400,
                        ),
                      );
                    },
                  ),
                  const Expanded(child: SizedBox()),
                  GetBuilder<PlanController>(
                    id: Constant.idYourPlanProgressDetails,
                    builder: (logic) {
                      return Container(
                        width: AppSizes.fullWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              AppColor.greenGradualStartColor,
                              AppColor.greenGradualEndColor,
                            ],
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Get.toNamed(AppRoutes.daysPlanDetail)!
                                .then((value) => _planController.refreshData());
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0),
                                side: const BorderSide(
                                  color: AppColor.transparent,
                                  width: 0.7,
                                ),
                              ),
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: AppSizes.height_1),
                            child: Text(
                              logic.btnDays == "Finished"
                                  ? "txtFinished".tr
                                  : "txtDay".tr.toUpperCase() + logic.btnDays,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColor.white,
                                fontSize: AppFontSize.size_15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _widget2To7MinFastWorkout() {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.fastWorkOut)!
            .then((value) => _planController.refreshData());
      },
      child: Container(
        // height: AppSizes.height_16,
        width: AppSizes.fullWidth,
        margin: EdgeInsets.only(top: AppSizes.height_3),
        padding: EdgeInsets.symmetric(
            vertical: AppSizes.height_3, horizontal: AppSizes.width_5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image:
                AssetImage(Constant.getAssetImage() + "fast_workout_bg.webp"),
            fit: BoxFit.fill,
          ),
          boxShadow: kElevationToShadow[2],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AutoSizeText(
                  "txt2To7MinFastWorkout".tr,
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  style: TextStyle(
                    color: AppColor.black,
                    fontSize: AppFontSize.size_14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: AppSizes.width_1_5),
                Image.asset(
                  Constant.getAssetIcons() + "icon_fast.webp",
                  height: AppSizes.height_2,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: AppSizes.height_1),
              child: Text(
                "txtNotEnoughTime".tr,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: AppColor.txtColor666,
                  fontSize: AppFontSize.size_12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: AppSizes.height_0_5),
              child: AutoSizeText(
                "txt2To7MinutesWorkoutToDoAnythingAnywhere".tr,
                textAlign: TextAlign.left,
                maxLines: 1,
                style: TextStyle(
                  color: AppColor.txtColor666,
                  fontSize: AppFontSize.size_12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _textBodyFocus() {
    return Container(
      margin: EdgeInsets.only(top: AppSizes.height_3),
      width: AppSizes.fullWidth,
      child: AutoSizeText(
        "txtBodyFocus".tr,
        textAlign: TextAlign.left,
        maxLines: 1,
        style: TextStyle(
          color: AppColor.black,
          fontSize: AppFontSize.size_14,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  _bodyFocusGrid() {
    return GetBuilder<PlanController>(
        id: Constant.idBodyFocusList,
        builder: (logic) {
          return Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: AppSizes.height_1_5),
            child: ListView.builder(
              itemCount: logic.bodyFocusList.length,
              shrinkWrap: Constant.boolValueTrue,
              padding: EdgeInsets.only(bottom: AppSizes.width_4),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                List excerises = ["12", "16", "11", "4"];
                return _itemBodyFocusGrid(
                    logic.bodyFocusList[index], excerises[index]);
              },
            ),
          );
        });
  }

  _itemBodyFocusGrid(HomePlanTable bodyFocusList, String execiseCount) {
    return InkWell(
      onTap: () {
        _planController.onBodyFocusItemClick(bodyFocusList);
      },
      child: Container(
        margin: EdgeInsets.only(top: AppSizes.height_1_5),
        height: 144,
        child: Card(
          margin: const EdgeInsets.all(0.0),
          elevation: 2.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Constant.getAssetImage() +
                    bodyFocusList.planImage +
                    ".webp"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10.0),
              shape: BoxShape.rectangle,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 15, bottom: 0, left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Utils.getMultiLanguageString(bodyFocusList.planName!),
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: AppFontSize.size_17,
                      color: AppColor.white,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 22,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Color(0xffFFFFFF).withOpacity(0.8),
                            borderRadius: BorderRadius.circular(7)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image.asset(
                                "assets/images/excersie.png",
                                height: 20,
                              ),
                            ),
                            Text(
                              execiseCount,
                              style: TextStyle(
                                color: const Color(0xff192126),
                                fontSize: AppFontSize.size_9,
                              ),
                            ),
                            Text(
                              " Exercises",
                              style: TextStyle(
                                color: const Color(0xff192126),
                                fontSize: AppFontSize.size_9,
                              ),
                            )
                          ],
                        ),
                      ),
                      MaterialButton(
                        height: 24,
                        minWidth: 89,
                        shape: const StadiumBorder(),
                        color: const Color(0xffBBF246),
                        child: Text(
                          "GO!".tr,
                          style: TextStyle(
                              color: AppColor.black,
                              fontSize: AppFontSize.size_11,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          _planController.onBodyFocusItemClick(bodyFocusList);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _textDaily() {
    return Container(
      margin:
          EdgeInsets.only(top: AppSizes.height_3, bottom: AppSizes.height_1_5),
      width: AppSizes.fullWidth,
      child: AutoSizeText(
        "txtDaily".tr,
        textAlign: TextAlign.left,
        maxLines: 1,
        style: TextStyle(
          color: AppColor.black,
          fontSize: AppFontSize.size_14,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  _widgetWaterTracker() {
    return GetBuilder<HomeController>(
        id: Constant.idCurrentWaterGlass,
        builder: (logic) {
          return Card(
            margin: const EdgeInsets.all(0.0),
            elevation: 2.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              width: AppSizes.fullWidth,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    const Color(0xff95CCE3),
                    const Color(0xffD8E6EC).withOpacity(0.2),
                  ],
                ),
                borderRadius: BorderRadius.circular(12.0),
                shape: BoxShape.rectangle,
              ),
              padding: EdgeInsets.symmetric(
                  vertical: AppSizes.height_3, horizontal: AppSizes.width_5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 136,
                    decoration: BoxDecoration(
                        color: const Color(
                          0xffD8E6EC,
                        ),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/ic_water.png",
                                    height: 30,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "txtWaterTracker".tr,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: AppFontSize.size_14,
                                      color: AppColor.black,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  height: AppSizes.height_12,
                                  width: AppSizes.height_15,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: AssetImage(
                                              "assets/images/waterlayer.png"))),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (Utils.isWaterTrackerOn()) ...{
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              logic.currentGlass.toString(),
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: AppFontSize.size_16,
                                                  color: AppColor.black),
                                            ),
                                            Text(
                                              "\t" + "txt8Cups".tr,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: AppFontSize.size_12,
                                                color: AppColor.black,
                                              ),
                                            ),
                                          ],
                                        )
                                      },
                                      if (!Utils.isWaterTrackerOn()) ...{
                                        Text(
                                          "txtWaterOffMessage".tr,
                                          textAlign: TextAlign.left,
                                          maxLines: 2,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: AppFontSize.size_12_5,
                                            color: AppColor.txtColor666,
                                          ),
                                        )
                                      },
                                    ],
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  MaterialButton(
                    shape: const StadiumBorder(),
                    color: AppColor.black,
                    child: Text(
                      "txtDrink".tr.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: AppFontSize.size_14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    onPressed: () {
                      if (Utils.isWaterTrackerOn()) {
                        Get.toNamed(AppRoutes.waterTracker,
                            arguments: [logic.currentGlass]);
                        logic.currentWaterGlass();
                      } else {
                        Get.toNamed(AppRoutes.turnOnWater,
                            arguments: [logic.currentGlass]);
                      }
                    },
                  )
                ],
              ),
            ),
          );
        });
  }
}
