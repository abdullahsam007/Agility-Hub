import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:women_lose_weight_flutter/common/dialog/sound_option/dialog_sound_option.dart';
import 'package:women_lose_weight_flutter/database/helper/db_helper.dart';
import 'package:women_lose_weight_flutter/localization/localizations_delegate.dart';
import 'package:women_lose_weight_flutter/routes/app_routes.dart';

import 'package:women_lose_weight_flutter/ui/home/controllers/home_controller.dart';
import 'package:women_lose_weight_flutter/ui/me/controllers/me_controller.dart';
import 'package:women_lose_weight_flutter/utils/constant.dart';
import 'package:women_lose_weight_flutter/utils/sizer_utils.dart';
import 'package:women_lose_weight_flutter/utils/utils.dart';

import '../../../newupdate/login/login.dart';
import '../../../utils/color.dart';
import '../../report/controllers/report_controller.dart';

class MeScreen extends StatelessWidget {
  MeScreen({Key? key}) : super(key: key);
  final MeController _meController = Get.find<MeController>();
  final ReportController _reportController = Get.find<ReportController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1F2231),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: AppSizes.height_3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18, bottom: 10,right: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap:(){

                    },
                    child: Text(
                      'txtMe'.tr,
                      maxLines: 1,
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: AppFontSize.size_16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                    },child:Text(
                    'Login',
                    maxLines: 1,
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: AppFontSize.size_16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),),
                ],
              ),
            ),
            // _backupAndRestoreWidget(),
            // _dividerWidget(),
            _spaceWidget(h: AppSizes.height_2_5),
            // _commonTitleText("txtWorkout".tr),
            _spaceWidget(h: AppSizes.height_3_3),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.reminder);
                        },
                        child: Container(
                          height: 144,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xff192126),
                              border: Border.all(
                                  color: const Color(0xffFFFFFF)
                                      .withOpacity(0.6))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                "assets/icons/ic_reminder.png",
                                height: AppSizes.height_7,
                              ),
                              Text(
                                "txtReminder".tr,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: const Color(0xffFFFFFF)
                                        .withOpacity(0.6)),
                              )
                            ],
                          ),
                        )),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _soundOptionsDialog();
                      },
                      child: Container(
                        height: 144,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xff192126),
                            border: Border.all(
                                color:
                                    const Color(0xffFFFFFF).withOpacity(0.6))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              "assets/icons/ic_sound.png",
                              height: AppSizes.height_7,
                            ),
                            Text(
                              "txtSoundOptions".tr,
                              style: TextStyle(
                                  fontSize: 14,
                                  color:
                                      const Color(0xffFFFFFF).withOpacity(0.6)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // _commonFieldText(
            //   "txtSoundOptions".tr,
            //   "icon_setting_tts_voice.webp",
            //   null,
            //   Constant.boolValueTrue,
            //   onTap: () {
            //     _soundOptionsDialog();
            //   },
            // ),

            _spaceWidget(),
            // _dividerWidget(),
            _spaceWidget(),
            _commonTitleText("txtGeneralSettings".tr),
            _spaceWidget(h: AppSizes.height_3_3),

            Container(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xff2D3450)),
                child: Column(
                  children: [

                    Row(
                      children: [
                        Expanded(
                          child: _commonFieldText(
                            "txtTurnOnWaterTracker".tr,
                            "ic_set_water.png",
                            null,
                            Constant.boolValueTrue,
                            onTap: () {},
                          ),
                        ),
                        GetBuilder<MeController>(
                          id: Constant.idMeTurnOnWaterTrackerSwitch,
                          builder: (logic) {
                            return Container(
                              height: AppSizes.height_1,
                              width: AppSizes.height_3,
                              margin: EdgeInsets.only(
                                  right: AppSizes.width_5,
                                  left: AppSizes.width_5),
                              child: Switch(
                                onChanged: (value) {
                                  logic.onTurnOnWaterTrackerToggleSwitchChange(
                                      value);
                                },
                                value: logic.isTurnOnWaterTracker,
                                activeColor: AppColor.switchActivate,
                                activeTrackColor: AppColor.switchActivateTrack,
                                inactiveThumbColor: AppColor.switchInactive,
                                inactiveTrackColor:
                                    AppColor.switchInactiveTrack,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    _spaceWidget(h: AppSizes.height_3),
                    _commonFieldText(
                      "txtMyProfile".tr,
                      "ic_set_profile.png",
                      null,
                      Constant.boolValueFalse,
                      onTap: () {
                        Get.toNamed(AppRoutes.myProfile)!.then(
                            (value) => _reportController.refreshWeightData());
                      },
                    ),
                    _spaceWidget(h: AppSizes.height_3),
                    _commonFieldText(
                      "txtRestartProgress".tr,
                      "ic_set_refresh.png",
                      null,
                      Constant.boolValueFalse,
                      onTap: () {
                        _dialogResetProgress();
                      },
                    ),
                    _spaceWidget(h: AppSizes.height_3),
                    _commonFieldText(
                      "txtVoiceOptionsTTS".tr,
                      "ic_set_voice.png",
                      null,
                      Constant.boolValueFalse,
                      onTap: () {
                        Get.toNamed(AppRoutes.voiceOptions);
                      },
                    ),
                    _spaceWidget(),
                    Row(
                      children: [
                        Expanded(
                          child: _commonFieldText(
                            "txtLanguageOptions".tr,
                            "ic_set_translate.png",
                            null,
                            Constant.boolValueFalse,
                          ),
                        ),
                        GetBuilder<MeController>(
                            id: Constant.idMeChangeLanguage,
                            builder: (logic) {
                              return Container(
                                margin:
                                    EdgeInsets.only(right: AppSizes.width_2),
                                child: DropdownButton<LanguageModel>(
                                  value: logic.languagesChosenValue,
                                  elevation: 2,
                                  style: TextStyle(
                                    color: AppColor.white,
                                    fontSize: AppFontSize.size_12_5,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  iconEnabledColor: AppColor.white,
                                  iconDisabledColor: AppColor.white,
                                  dropdownColor: AppColor.white,
                                  underline: Container(
                                    color: AppColor.transparent,
                                  ),
                                  isDense: true,
                                  items: languages
                                      .map<DropdownMenuItem<LanguageModel>>(
                                        (e) => DropdownMenuItem<LanguageModel>(
                                          value: e,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                e.symbol,
                                                style: TextStyle(
                                                  fontSize:
                                                      AppFontSize.size_12_5,
                                                ),
                                              ),
                                              Text(
                                                " " + e.language,
                                                style: TextStyle(
                                                  fontSize:
                                                      AppFontSize.size_12_5,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (LanguageModel? value) {
                                    logic.onLanguageChange(value);
                                  },
                                ),
                              );
                            }),
                      ],
                    ),
                    _spaceWidget(),
                  ],
                )),
            // _dividerWidget(),
            _spaceWidget(),
            // _commonTitleText("txtSupportUs".tr),
            _spaceWidget(h: AppSizes.height_3_3),
            // Container(
            //     padding: const EdgeInsets.only(top: 20, bottom: 20),
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(30),
            //         color: const Color(0xff2D3450)),
            //     child: Column(children: [
            //       _commonFieldText(
            //         "txtShareWithFriends".tr,
            //         "ic_set_share.png",
            //         null,
            //         Constant.boolValueFalse,
            //         onTap: () {
            //           _meController.share();
            //         },
            //       ),
            //       _spaceWidget(h: AppSizes.height_3),
            //       _commonFieldText(
            //         "txtRateUs".tr,
            //         "ic_set_rateus.png",
            //         null,
            //         Constant.boolValueFalse,
            //         onTap: () {
            //           _meController.rateMyApp!.showRateDialog(Get.context!);
            //         },
            //       ),
            //       _spaceWidget(h: AppSizes.height_3),
            //       _commonFieldText(
            //         "txtCommonQuestions".tr,
            //         "ic_set_question.png",
            //         null,
            //         Constant.boolValueTrue,
            //         onTap: () {
            //           Get.toNamed(AppRoutes.commonQuestions);
            //         },
            //       ),
            //       _spaceWidget(h: AppSizes.height_3),
            //       _commonFieldText(
            //         "txtFeedback".tr,
            //         "ic_set_feedback.png",
            //         null,
            //         Constant.boolValueFalse,
            //         onTap: () {
            //           Utils().sendFeedback();
            //         },
            //       ),
            //       _spaceWidget(h: AppSizes.height_3),
            //       _commonFieldText(
            //         "txtPrivacyPolicy".tr,
            //         "ic_set_policy.png",
            //         null,
            //         Constant.boolValueFalse,
            //         onTap: () {
            //           _meController.loadPrivacyPolicy();
            //         },
            //       ),
            //       _spaceWidget(h: AppSizes.height_3),
            //     ])),
          ],
        ),
      ),
    );
  }

  _commonTitleText(String title) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppSizes.width_3),
      child: Text(
        title.toUpperCase(),
        textAlign: TextAlign.left,
        style: TextStyle(
          color: AppColor.white,
          fontSize: AppFontSize.size_13,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  _backupAndRestoreWidget() {
    return Container(
      margin: EdgeInsets.only(bottom: AppSizes.height_2),
      padding: EdgeInsets.symmetric(horizontal: AppSizes.width_5),
      child: Row(
        children: [
          GetBuilder<MeController>(
            id: Constant.idLoginInfo,
            builder: (logic) {
              return Expanded(
                child: InkWell(
                  onTap: () {
                    _meController.onSignInButtonClick();
                  },
                  child: Row(
                    children: [
                      if (_meController.firebaseAuth.currentUser != null &&
                          _meController.firebaseAuth.currentUser!.photoURL !=
                              null) ...{
                        Padding(
                          padding: EdgeInsets.only(right: AppSizes.width_4),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                              color: AppColor.white,
                              height: AppSizes.height_8,
                              width: AppSizes.height_8,
                              child: Image.network(
                                _meController.firebaseAuth.currentUser!.photoURL
                                    .toString(),
                                errorBuilder:
                                    (buildContext, object, stackTrace) {
                                  return Center(
                                    child: Text(
                                      (_meController.firebaseAuth.currentUser !=
                                                  null &&
                                              _meController
                                                      .firebaseAuth
                                                      .currentUser!
                                                      .displayName !=
                                                  null)
                                          ? _meController.firebaseAuth
                                              .currentUser!.displayName![0]
                                              .toUpperCase()
                                          : "",
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: AppColor.white,
                                        fontSize: AppFontSize.size_25,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  );
                                },
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      },
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              textAlign: TextAlign.left,
                              maxLines: 1,
                              text: TextSpan(
                                  text:
                                      (_meController.firebaseAuth.currentUser !=
                                                  null &&
                                              _meController
                                                      .firebaseAuth
                                                      .currentUser!
                                                      .displayName !=
                                                  null)
                                          ? _meController.firebaseAuth
                                              .currentUser!.displayName
                                          : "txtBackupAndRestore".tr,
                                  style: TextStyle(
                                    color: AppColor.white,
                                    fontSize: AppFontSize.size_13,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  children: [
                                    WidgetSpan(
                                      child: SizedBox(
                                        width: AppSizes.width_1,
                                      ),
                                    ),
                                    WidgetSpan(
                                      child: Image.asset(
                                        Constant.getAssetIcons() +
                                            "ic_google_sync.webp",
                                        height: AppSizes.height_2_5,
                                        width: AppSizes.height_2_5,
                                      ),
                                    )
                                  ]),
                            ),
                            SizedBox(height: AppSizes.height_0_5),
                            Text(
                              (logic.lastSyncDate == "")
                                  ? "txtSignInAndSynchronizeYourData".tr
                                  : "txtLastSync".tr +
                                      ": " +
                                      logic.lastSyncDate!,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColor.white,
                                fontSize: AppFontSize.size_10,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          InkWell(
            onTap: () {
              _meController.onSyncButtonClick();
            },
            child: Icon(
              Icons.sync,
              size: AppSizes.height_3,
              color: AppColor.primary,
            ),
          ),
        ],
      ),
    );
  }

  _commonFieldText(String title, String asset, IconData? icon, bool isAsset,
      {Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: AppSizes.width_5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: AppSizes.height_3,
                width: AppSizes.height_3,
                child: Image.asset(
                  Constant.getAssetIcons() + asset,
                  color: AppColor.white,
                )),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.width_4),
                child: AutoSizeText(
                  title,
                  // textAlign: TextAlign.left,
                  maxLines: 1,
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: AppFontSize.size_12_5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // _dividerWidget() {
  //   return Container(
  //     height: AppSizes.height_1_2,
  //     color: AppColor.grayLight,
  //     child: null,
  //   );
  // }

  _spaceWidget({double? h}) {
    return SizedBox(
      height: h ?? AppSizes.height_2_5,
    );
  }

  _soundOptionsDialog() {
    return showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "txtSoundOptions".tr,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColor.black,
              fontSize: AppFontSize.size_15,
              fontWeight: FontWeight.w500,
            ),
          ),
          content: const DialogSoundOption(),
          buttonPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          actions: [
            Container(
              margin: EdgeInsets.only(
                  right: AppSizes.width_5, bottom: AppSizes.height_1_5),
              child: TextButton(
                child: Text(
                  "txtOk".tr.toUpperCase(),
                  style: TextStyle(
                    color: AppColor.primary,
                    fontSize: AppFontSize.size_12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ],
        );
      },
    );
  }

  _dialogResetProgress() {
    return showDialog<void>(
      context: Get.context!,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          content: Text(
            "txtAreYouSure".tr,
            style: TextStyle(
              color: AppColor.black,
              fontSize: AppFontSize.size_12,
              fontWeight: FontWeight.w400,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                "txtCancel".tr.toUpperCase(),
                style: TextStyle(
                  color: AppColor.primary,
                  fontSize: AppFontSize.size_11,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () {
                Get.back();
              },
            ),
            TextButton(
              child: Text(
                "txtRestart".tr.toUpperCase(),
                style: TextStyle(
                  color: AppColor.primary,
                  fontSize: AppFontSize.size_11,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () async {
                await DBHelper.dbHelper
                    .restartProgress()
                    .then((value) => _reportController.refreshData());
                Get.back();
                Get.offAllNamed(AppRoutes.home);
              },
            ),
          ],
        );
      },
    );
  }

  _goPremiumButton() {
    return GetBuilder<HomeController>(
        id: Constant.idMeGoPremiumBtn,
        builder: (logic) {
          if (logic.isShowPremiumBtn) {
            return Container(
              width: AppSizes.fullWidth,
              margin: EdgeInsets.only(
                  top: AppSizes.height_4,
                  right: AppSizes.width_5,
                  left: AppSizes.width_5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xff6E3CBF),
                    Color(0xff9460F0),
                  ],
                ),
              ),
              child: TextButton(
                onPressed: () {
                  _meController.onPremiumBtnClick();
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
                  padding: EdgeInsets.symmetric(vertical: AppSizes.height_0_8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/premium.png",
                        height: AppSizes.height_8_5,
                        width: AppSizes.height_8_5,
                      ),
                      SizedBox(width: AppSizes.width_2),
                      Text(
                        "txtGoPremium".tr.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: AppFontSize.size_10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 5),
                      MaterialButton(
                        onPressed: () {
                          _meController.onPremiumBtnClick();
                        },
                        child: Text(
                          "Premium",
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: AppFontSize.size_12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        color: const Color(0xff03B98C),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
          return const SizedBox();
        });
  }

  showLogoutDialog() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) => Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: AppSizes.width_6),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: AppSizes.height_3, horizontal: AppSizes.width_6),
              child: Text(
                "txtAreYouSureWantToLogout".tr,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: AppColor.black,
                  fontSize: AppFontSize.size_13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Row(
              children: [
                const Spacer(),
                TextButton(
                  child: Text(
                    "txtCancel".tr.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColor.primary,
                      fontSize: AppFontSize.size_11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
                TextButton(
                  child: Text(
                    "txtLogout".tr.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColor.primary,
                      fontSize: AppFontSize.size_11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: () {
                    Get.back();
                    _meController.signOutFromGoogle();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
