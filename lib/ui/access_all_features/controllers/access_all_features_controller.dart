import 'package:get/get.dart';
import 'package:women_lose_weight_flutter/inapppurchase/iap_callback.dart';
import 'package:women_lose_weight_flutter/inapppurchase/in_app_purchase_helper.dart';
import 'package:women_lose_weight_flutter/utils/constant.dart';

import 'package:women_lose_weight_flutter/utils/preference.dart';

class AccessAllFeaturesController extends GetxController implements IAPCallback{
  bool isSelected = Constant.boolValueTrue; /// isSelected true for monthly and false for yearly

  bool isShowProgress = false;

  @override
  void onInit() {

    super.onInit();
  }

  onChangePlanSelection(value) {
    isSelected = value;
    update([Constant.idAccessAllFeaturesButtons]);
  }



  @override
  void onBillingError(error) {
    isShowProgress = false;
    update([Constant.idAccessFeatureProgress]);
  }

  @override
  void onLoaded(bool initialized) {
  }




}
