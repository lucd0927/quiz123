import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:applovin_max/applovin_max.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:iabtcf_consent_info/iabtcf_consent_info.dart';
import 'package:quiz123/tools/rizhi.dart';
import 'package:quiz123/wangluo/shijian_baogao.dart';

class JcAdsUmp {
  static const TGA = "JcAdsUmp:";

  static final JcAdsUmp _instance = JcAdsUmp._();

  factory JcAdsUmp() {
    return _instance;
  }

  JcAdsUmp._();

  final guojiaLanguageUmp = [
    "AT",
    "BE",
    "BG",
    "HR",
    "CY",
    "CZ",
    "DK",
    "EE",
    "FI",
    "FR",
    "DE",
    "GR",
    "HU",
    "IE",
    "IT",
    "LV",
    "LT",
    "LU",
    "MT",
    "NL",
    "PL",
    "PT",
    "RO",
    "SK",
    "SI",
    "ES",
    "SE",
    "NO",
    "IS",
    "LI",
    "CH",
    "GB",
  ];

  static String _huoquGuojia() {
    String name = Platform.localeName.toUpperCase(); // e.g. "en_US", "pt_BR"

    jcRizhi("==_huoquGuojia==name:$name");

    return name;
  }

  bool hasUmp() {
    Locale locale = WidgetsBinding.instance.platformDispatcher.locale;
    print(locale.languageCode); // 输出语言代码，如 "en"、"zh"
    print(locale.countryCode); // 输出国家代码，如 "US"、"CN"
    String countryCode = locale.countryCode ?? "789";
    countryCode = "CH";
    bool tmjjjj = guojiaLanguageUmp.contains(countryCode);
    return tmjjjj;
  }

  init() async {
    Completer<bool> result = Completer();
    bool hsEeee = hasUmp();

    jcRizhi("$TGA==_huoquGuojia==hasUmp:${hsEeee}");
    JCShijianBaogao.en_user(hsEeee?"1":"0");
    if (hsEeee) {
      ConsentInformation.instance.reset();

      InitializationStatus status = await MobileAds.instance.initialize();
      ConsentStatus consentStatus = await ConsentInformation.instance
          .getConsentStatus();
      jcRizhi("$TGA====hasUmp:  consentStatus$consentStatus");

      if (consentStatus == ConsentStatus.obtained ||
          consentStatus == ConsentStatus.notRequired) {
        result.complete(true);
      } else {
        jcRizhi("$TGA==InitializationStatus==status:${status.adapterStatuses}");
        // Create a ConsentRequestParameters object.
        ConsentDebugSettings consentDebugSettings = ConsentDebugSettings(
          debugGeography: DebugGeography.debugGeographyEea,
        );
        final params = ConsentRequestParameters(
          consentDebugSettings: consentDebugSettings,
        );
        params.consentDebugSettings?.debugGeography =
            DebugGeography.debugGeographyEea;
        // Request an update to consent information on every app launch.
        ConsentInformation.instance.requestConsentInfoUpdate(
          params,
          () async {
            // Called when consent information is successfully updated.
            jcRizhi("$TGA==requestConsentInfoUpdate success==");
            JCShijianBaogao.ad_privacypop_suc();
            // PrivacyOptionsRequirementStatus privacyOptionsRequirementStatus = await ConsentInformation.instance.getPrivacyOptionsRequirementStatus();

            ConsentForm.loadAndShowConsentFormIfRequired((loadAndShowError) {
              if (loadAndShowError != null) {
                jcRizhi("$TGA==loadAndShowConsentFormIfRequired error==");
                // Consent gathering failed.

                result.complete(false);
              } else {
                ConsentInformation.instance.canRequestAds().then((value) {
                  jcRizhi("$TGA==canRequestAds==:$value");
                });

                jcRizhi("$TGA==loadAndShowConsentFormIfRequired success==");
                result.complete(true);
              }

              // Consent has been gathered.
            });
          },
          (FormError error) {
            String reason = error.message;
            jcRizhi("$TGA==requestConsentInfoUpdate error==${reason}");
            // Called when there's an error updating consent information.
            JCShijianBaogao.ad_privacypop_fail(reason);
            result.complete(false);
          },
        );
      }

      // await ConsentInformation.instance.reset();
    } else {
      AppLovinMAX.setHasUserConsent(true);
      result.complete(true);
    }
    AppLovinMAX.setDoNotSell(false);
    bool tttt = await result.future;

    if (hsEeee) {
      ConsentStatus consentStatus = await ConsentInformation.instance
          .getConsentStatus();
      jcRizhi("$TGA==consentStatus:${consentStatus}===");
      if (consentStatus == ConsentStatus.obtained) {
        BasicConsentInfo? info = await IabtcfConsentInfo.instance
            .currentConsentInfo();
        if (info != null) {
          bool hasSelect = (info as ConsentInfo).purposeConsents.contains(
            DataUsagePurpose.selectPersonalisedContent,
          );
          AppLovinMAX.setHasUserConsent(hasSelect);
          jcRizhi("$TGA==hasSelect:${hasSelect}===");
        }
      }else if (consentStatus == ConsentStatus.unknown){
        AppLovinMAX.setHasUserConsent(false);

      }
      else{
        AppLovinMAX.setHasUserConsent(true);
      }

    }

    return;
  }
}
