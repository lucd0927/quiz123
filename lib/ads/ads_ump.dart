import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:applovin_max/applovin_max.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:iabtcf_consent_info/iabtcf_consent_info.dart';
import 'package:quiz123/tools/rizhi.dart';
import 'package:quiz123/wangluo/shijian_baogao.dart';

class JcAdsUMP {
  static const TGA = "JcAdsUmp:";

  static final JcAdsUMP _instance = JcAdsUMP._();

  factory JcAdsUMP() {
    return _instance;
  }

  JcAdsUMP._();

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

  bool sfUMP() {
    Locale adsasdf = WidgetsBinding.instance.platformDispatcher.locale;
    String cccccc = adsasdf.countryCode ?? "789";
    // todo: 去掉
    // cccccc = "CH";
    bool tmjjjj = guojiaLanguageUmp.contains(cccccc);
    return tmjjjj;
  }


  init() async {
    Completer<bool> tmpCccccc = Completer();
    bool sfGDPR = sfUMP();
    jcRizhi("$TGA==_huoquGuojia==hasUmp:${sfGDPR}");
    JCShijianBaogao.eu_user(sfGDPR ? "1" : "0");
    if (sfGDPR) {
      // ConsentInformation.instance.reset();
      InitializationStatus status = await MobileAds.instance.initialize();
      ConsentStatus consentStatus = await ConsentInformation.instance
          .getConsentStatus();
      jcRizhi("$TGA====hasUmp:  consentStatus$consentStatus");
      if (
          consentStatus == ConsentStatus.notRequired) {
        tmpCccccc.complete(true);
      } else {
        jcRizhi("$TGA==InitializationStatus==status:${status.adapterStatuses}");
        // Create a ConsentRequestParameters object.
        // ConsentDebugSettings consentDebugSettings = ConsentDebugSettings(
          // debugGeography: DebugGeography.debugGeographyEea,
        // );
        final params = ConsentRequestParameters(
          // todo: 去掉
          // consentDebugSettings: consentDebugSettings,
        );

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

                tmpCccccc.complete(false);
              } else {
                jcRizhi("$TGA==loadAndShowConsentFormIfRequired success==");
                tmpCccccc.complete(true);
              }

              // Consent has been gathered.
            });
          },
          (FormError error) {
            String reason = error.message;
            jcRizhi("$TGA==requestConsentInfoUpdate error==${reason}");
            // Called when there's an error updating consent information.
            JCShijianBaogao.ad_privacypop_fail(reason);
            tmpCccccc.complete(false);
          },
        );
      }

      // await ConsentInformation.instance.reset();
    } else {
      AppLovinMAX.setHasUserConsent(true);
      tmpCccccc.complete(true);
    }

    await tmpCccccc.future;

    if (sfGDPR) {
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
      } else if (consentStatus == ConsentStatus.unknown) {
        AppLovinMAX.setHasUserConsent(false);
      } else {
        AppLovinMAX.setHasUserConsent(true);
      }
    }
    AppLovinMAX.setDoNotSell(false);
    return;
  }
}
