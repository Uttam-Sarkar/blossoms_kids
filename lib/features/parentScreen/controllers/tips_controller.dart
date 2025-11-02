import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../models/tips_model.dart';

class TipsController extends GetxController {
  RxList<TipsModel> tips = <TipsModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadTips();
  }

  Future<void> loadTips() async {
    final String response = await rootBundle.loadString('assets/json data/tips.json');
    final data = await json.decode(response);
    final List tipsData = data['tips'];
    tips.value = tipsData.map((e) => TipsModel.fromJson(e)).toList();
  }
}
