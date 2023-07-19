import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:women_lose_weight_flutter/google_ads/custom_ad.dart';
import 'package:women_lose_weight_flutter/ui/recent/controllers/recent_controller.dart';
import 'package:women_lose_weight_flutter/utils/color.dart';
import 'package:women_lose_weight_flutter/utils/constant.dart';
import 'package:women_lose_weight_flutter/utils/sizer_utils.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../../google_ads/ad_helper.dart';
import '../../../utils/utils.dart';
class RecentScreen extends StatefulWidget {
  const RecentScreen({Key? key}) : super(key: key);

  @override
  _RecentScreenState createState() => _RecentScreenState();
}

class _RecentScreenState extends State<RecentScreen> {
  late BannerAd _BannerAd;
  late InterstitialAd _interstialAd;
  bool _isInterstitialAdReady = false;
  bool _isBannerAdReady = false;

  @override
  void initState() {
    _BannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: AdHelper.bannerAdUnitId,
        listener: BannerAdListener(
            onAdLoaded: (_){
              setState(() {
                _isBannerAdReady= true;
              });
            },
            onAdFailedToLoad: (ad, error){
              print('Failed to Load Ad${error.message}');
              _isBannerAdReady=false;
              ad.dispose();
            }
        ),
        request: AdRequest())..load();
    InterstitialAd.load(
        adUnitId: AdHelper.interstitialAdUnitId,
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded:(ad){
              this._interstialAd = ad;
              _isInterstitialAdReady = true;
            },
            onAdFailedToLoad: (error){
              print ('Failed to Load Interstitial Ad ${error.message}');
            }));
    super.initState();

    // TODO: implement initState



  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _BannerAd.dispose();
    _interstialAd.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        bottom: Constant.boolValueFalse,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _widgetBack(),
            _recentExerciseList(),

            if(_isBannerAdReady)
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: _BannerAd!.size.height.toDouble(),
                  width: _BannerAd!.size.width.toDouble(),
                  child: AdWidget(ad: _BannerAd!,),
                ),
              ),
          ],
        ),
      ),
    );
  }


  _widgetBack() {
    return Container(
      width: AppSizes.fullWidth,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(
          left: AppSizes.width_5,
          right: AppSizes.width_5,
          top: AppSizes.height_2),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Utils.backWidget(iconColor: AppColor.black),
          ),
          Expanded(
            child: Text(
              "\t\t\t\t" + "txtRecent".tr,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppColor.black,
                fontSize: AppFontSize.size_15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _recentExerciseList() {
    return Expanded(
      child: GetBuilder<RecentController>(
          id: Constant.idRecentScreenHistory,
          builder: (logic) {
            return ListView.builder(
              itemCount: logic.recentHistoryList.length,
              shrinkWrap: Constant.boolValueTrue,
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.symmetric(
                  vertical: AppSizes.height_3_5, horizontal: AppSizes.width_4),
              itemBuilder: (BuildContext context, int index) {
                return _itemRecentExerciseList(index, logic);
              },
            );
          }),
    );
  }

  _itemRecentExerciseList(int index, RecentController logic) {
    return InkWell(
      onTap: () {
        logic.onRecentItemClick(index, logic.recentHistoryList[index]);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: AppSizes.height_3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Image.asset(
                  Constant.getAssetImage() +
                      logic.recentHistoryList[index].planDetail!.planThumbnail +
                      ".webp",
                  height: AppSizes.height_6_5,
                  width: AppSizes.height_6_5,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.width_6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Utils.getMultiLanguageString(
                              logic.recentHistoryList[index].hPlanName!),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColor.black,
                            fontSize: AppFontSize.size_13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: AppSizes.height_0_8),
                        FutureBuilder(
                            future: logic.getRecentItemTime(index),
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
              ],
            ),
            Container(
              color: AppColor.grayDivider,
              height: AppSizes.height_0_05,
              margin: EdgeInsets.only(
                  left: AppSizes.width_15, top: AppSizes.height_1_5),
            ),
          ],
        ),
      ),
    );
  }
}
