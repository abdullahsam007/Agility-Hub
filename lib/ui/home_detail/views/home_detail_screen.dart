import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:women_lose_weight_flutter/database/table/home_plan_table.dart';
import 'package:women_lose_weight_flutter/google_ads/custom_ad.dart';
import 'package:women_lose_weight_flutter/ui/home_detail/controllers/home_detail_controller.dart';
import 'package:women_lose_weight_flutter/utils/color.dart';
import 'package:women_lose_weight_flutter/utils/constant.dart';
import 'package:women_lose_weight_flutter/utils/sizer_utils.dart';

import '../../../google_ads/custom_ad.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/utils.dart';

class HomeDetailScreen extends StatelessWidget {
  String? planName;
  HomeDetailScreen({this.planName});
  final HomeDetailController _homeDetailController =
      Get.find<HomeDetailController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: SafeArea(
        top: Constant.boolValueFalse,
        bottom:
            (Platform.isIOS) ? Constant.boolValueFalse : Constant.boolValueTrue,
        child: Column(
          children: [
            Expanded(
              child: NestedScrollView(
                controller: _homeDetailController.scrollController,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    _sliverAppBarWidget(),
                  ];
                },
                body: _homeDetailsExerciseList(),
              ),
            ),

          ],
        ),
      ),
    );
  }

  _sliverAppBarWidget() {
    return GetBuilder<HomeDetailController>(
      id: Constant.idHomeDetailSliverAppBar,
      builder: (logic) {
        return SliverAppBar(
          elevation: 0.8,
          expandedHeight: AppSizes.height_24,
          floating: Constant.boolValueFalse,
          pinned: Constant.boolValueTrue,
          backgroundColor: AppColor.white,
          centerTitle: Constant.boolValueFalse,
          automaticallyImplyLeading: Constant.boolValueFalse,
          titleSpacing: AppSizes.width_1_5,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: Constant.boolValueFalse,
            background: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.width_6, vertical: 0.0),
              decoration: BoxDecoration(
                color: AppColor.transparent,
                image: DecorationImage(
                  image: AssetImage(Constant.getAssetImage() +
                      logic.bodyFocusItem!.planImage! +
                      ".webp"),
                  colorFilter: ColorFilter.mode(
                      AppColor.black.withOpacity(.13), BlendMode.darken),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  _homeDetailsExerciseList() {
    return GetBuilder<HomeDetailController>(
      id: Constant.idBodyFocusSubList,
      builder: (logic) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetBuilder<HomeDetailController>(
                  id: Constant.idBodyFocusList,
                  builder: (logic) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text(
                        logic.bodyFocusItem!.planNameEn!,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: AppColor.black,
                          fontSize: AppFontSize.size_14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    );
                  }),
              ListView.builder(
                itemCount: logic.bodyFocusSubPlanList.length,
                shrinkWrap: Constant.boolValueTrue,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.width_5_5,
                    vertical: AppSizes.height_2_5),
                itemBuilder: (BuildContext context, int index) {
                  return _itemHomeDetailsExerciseList(
                      index, logic.bodyFocusSubPlanList[index]);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  _itemHomeDetailsExerciseList(int index, HomePlanTable bodyFocusSubPlanList) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.exerciseList,
            arguments: [bodyFocusSubPlanList, null, null]);
      },
      child: Container(
        decoration: BoxDecoration(
            color: AppColor.white, borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.only(bottom: AppSizes.height_3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: const EdgeInsets.only(right: 30),
                alignment: Alignment.center,
                width: 60,
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                    color: AppColor.black,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5))),
                child: Text(
                  Utils.getExerciseLevelString(bodyFocusSubPlanList.planLvl!),
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: AppFontSize.size_8,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                const SizedBox(width: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    Constant.getAssetImage() +
                        bodyFocusSubPlanList.planThumbnail +
                        ".webp",
                    height: AppSizes.height_11,
                    width: AppSizes.height_11,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.width_4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Utils.getMultiLanguageString(
                              bodyFocusSubPlanList.planName!),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColor.black,
                            fontSize: AppFontSize.size_12_5,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: AppSizes.height_3),
                        Text(
                          bodyFocusSubPlanList.planMinutes! +
                              " ${"txtMins".tr}",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColor.txtColor666,
                            fontSize: AppFontSize.size_10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if (index !=
                _homeDetailController.bodyFocusSubPlanList.length - 1) ...{
              Container(
                color: AppColor.grayDivider,
                height: AppSizes.height_0_05,
                margin: EdgeInsets.only(top: AppSizes.height_1_5),
                child: null,
              ),
            },
          ],
        ),
      ),
    );
  }
}
