import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:women_lose_weight_flutter/database/table/home_plan_table.dart';
import 'package:women_lose_weight_flutter/google_ads/custom_ad.dart';
import 'package:women_lose_weight_flutter/ui/fast_work_out/controllers/fast_work_out_controller.dart';
import 'package:women_lose_weight_flutter/utils/color.dart';
import 'package:women_lose_weight_flutter/utils/constant.dart';
import 'package:women_lose_weight_flutter/utils/sizer_utils.dart';

import '../../../utils/utils.dart';

class FastWorkOutScreen extends StatelessWidget {
  FastWorkOutScreen({Key? key}) : super(key: key);
  final FastWorkOutController _fastWorkOutController =
      Get.find<FastWorkOutController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        top: Constant.boolValueFalse,
        bottom:
            (Platform.isIOS) ? Constant.boolValueFalse : Constant.boolValueTrue,
        child: Column(
          children: [
            Expanded(
              child: NestedScrollView(
                controller: _fastWorkOutController.scrollController,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    _sliverAppBarWidget(),
                  ];
                },
                body: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.width_5_5,
                      vertical: AppSizes.height_2),
                  child: Column(
                    children: [
                      _fatBurningHIIT(),
                      _txtRandomWorkout(),
                      _randomWorkoutGrid(),
                      _txtTrainingGoal(),
                      _trainingGoalGrid(),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  _sliverAppBarWidget() {
    return GetBuilder<FastWorkOutController>(
      id: Constant.idFastWorkOutSliverAppBar,
      builder: (logic) {
        return SliverAppBar(
          elevation: 0.8,
          expandedHeight: AppSizes.height_2,
          floating: Constant.boolValueFalse,
          pinned: Constant.boolValueTrue,
          backgroundColor: AppColor.white,
          centerTitle: Constant.boolValueFalse,
          automaticallyImplyLeading: Constant.boolValueFalse,
          titleSpacing: AppSizes.width_1_5,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: Constant.boolValueFalse,
            background: Stack(
              alignment: Alignment.centerRight,
              children: [
                Container(
                  width: double.infinity,
                  color: AppColor.transparent,
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.width_6, vertical: 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: AppSizes.height_1),
                        child: Text(
                          "txtFastWorkout".tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColor.black,
                            fontWeight: FontWeight.w800,
                            fontSize: AppFontSize.size_16,
                          ),
                        ),
                      ),
                      // AutoSizeText(
                      //   "txtNotEnoughTime".tr +
                      //       "\n\t" +
                      //       "txt2To7MinutesWorkoutToDoAnythingAnywhere".tr,
                      //   textAlign: TextAlign.left,
                      //   maxLines: 2,
                      //   style: TextStyle(
                      //     color: AppColor.txtColor999,
                      //     fontWeight: FontWeight.w400,
                      //     fontSize: AppFontSize.size_11,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _fatBurningHIIT() {
    return InkWell(
      onTap: () {
        _fastWorkOutController.onFatBurningHIITClick();
      },
      child: Container(
        height: AppSizes.height_22,
        width: AppSizes.fullWidth,
        margin: EdgeInsets.only(top: AppSizes.height_1_5),
        padding: EdgeInsets.symmetric(
            vertical: AppSizes.height_3, horizontal: AppSizes.width_5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(Constant.getAssetImage() +
                "icon_cover_fat_burning_hiit_fast.webp"),
            fit: BoxFit.cover,
          ),
          boxShadow: kElevationToShadow[1],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "txtFatBurningHIIT".tr,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppColor.white,
                fontWeight: FontWeight.w800,
                fontSize: AppFontSize.size_17,
              ),
            ),
            Container(
              height: 22,
              width: 100,
              decoration: BoxDecoration(
                  color: const Color(0xffFFFFFF).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(7)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(
                      "assets/images/timer.png",
                      height: 20,
                    ),
                  ),
                  Text(
                    "txt2To7Min".tr,
                    style: TextStyle(
                      color: const Color(0xff192126),
                      fontSize: AppFontSize.size_9,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _txtRandomWorkout() {
    return Container(
      margin: EdgeInsets.only(top: AppSizes.height_3),
      width: AppSizes.fullWidth,
      child: AutoSizeText(
        "txtRandomWorkout".tr,
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

  _randomWorkoutGrid() {
    return GetBuilder<FastWorkOutController>(
      id: Constant.idRandomWorkoutList,
      builder: (logic) {
        return Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: AppSizes.height_1_8),
          child: ListView.builder(
            itemCount: logic.randomWorkoutList.length,
            shrinkWrap: Constant.boolValueTrue,
            padding: EdgeInsets.only(bottom: AppSizes.width_4),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return _itemRandomWorkoutGrid(logic.randomWorkoutList[index]);
            },
          ),
        );
      },
    );
  }

  _itemRandomWorkoutGrid(HomePlanTable randomWorkoutList) {
    return InkWell(
      onTap: () {
        _fastWorkOutController.onRandomWorkoutItemClick(randomWorkoutList);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        elevation: 2.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          height: AppSizes.height_20,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Constant.getAssetImage() +
                  randomWorkoutList.planImage! +
                  ".webp"),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10.0),
            shape: BoxShape.rectangle,
          ),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                vertical: AppSizes.height_2_8, horizontal: AppSizes.width_5),
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Utils.getMultiLanguageString(randomWorkoutList.planName!),
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: AppFontSize.size_16,
                    color: AppColor.black,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(
                        "assets/images/timer.png",
                        height: 16,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: AppSizes.height_0_8),
                      child: Text(
                        randomWorkoutList.planText!,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: AppFontSize.size_11,
                          color: AppColor.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _txtTrainingGoal() {
    return Container(
      margin: EdgeInsets.only(top: AppSizes.height_1),
      width: AppSizes.fullWidth,
      child: AutoSizeText(
        "txtTrainingGoal".tr,
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

  _trainingGoalGrid() {
    return GetBuilder<FastWorkOutController>(
      id: Constant.idTrainingGoalList,
      builder: (logic) {
        return Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: AppSizes.height_1_8),
          child: ListView.builder(
            itemCount: logic.trainingGoalList.length,
            shrinkWrap: Constant.boolValueTrue,
            padding: EdgeInsets.only(bottom: AppSizes.width_4),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return _itemTrainingGoalGrid(logic.trainingGoalList[index]);
            },
          ),
        );
      },
    );
  }

  _itemTrainingGoalGrid(HomePlanTable trainingGoalList) {
    return InkWell(
      onTap: () {
        _fastWorkOutController.onTrainingGoalItemClick(trainingGoalList);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        elevation: 2.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          height: AppSizes.height_20,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Constant.getAssetImage() +
                  trainingGoalList.planImage! +
                  ".webp"),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10.0),
            shape: BoxShape.rectangle,
          ),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                vertical: AppSizes.height_2_8, horizontal: AppSizes.width_5),
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Utils.getMultiLanguageString(trainingGoalList.planName!),
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: AppFontSize.size_16,
                        color: AppColor.black,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.asset(
                            "assets/images/fire.png",
                            height: 16,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: AppSizes.height_0_1),
                          child: Text(
                            trainingGoalList.planText!,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: AppFontSize.size_11,
                              color: AppColor.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                InkWell(
                    onTap: () {
                      _fastWorkOutController
                          .onTrainingGoalItemClick(trainingGoalList);
                    },
                    child: Container(
                      height: 22,
                      width: 80,
                      decoration: BoxDecoration(
                          color: const Color(0xffFFFFFF).withOpacity(0.8),
                          borderRadius: BorderRadius.circular(7)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Start!".tr,
                            style: TextStyle(
                              color: const Color(0xff192126),
                              fontSize: AppFontSize.size_9,
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
