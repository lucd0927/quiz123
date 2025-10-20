import 'package:quiz123/tools/app_track_status.dart';
import 'package:quiz123/wangluo/wangluo.dart';

class JCShijianBaogao {
  static organic_to_buy() async {
    JCNet().maidian(eventName: "organic_to_buy");
  }

  static session() async {
    JCNet().maidian(eventName: "session");
  }

  static install() async {
    if (JCAppTrackStatus.launchNum() < 2) {
      JCNet().maidian(eventName: "install");
    }
  }

  // source_from: icon、push
  static launch_page({required String kv}) async {
    JCNet().maidian(
      eventName: "launch_page",
      kkkkkey: "source_from",
      kkkkkeyVaaaaaa: kv,
    );
  }

  static cloak_req() async {
    JCNet().maidian(eventName: "cloak_req");
  }

  // cloak_user：【0】【1】，对应【黑名单用户】【自然量用户】
  static cloak_suc(String type) async {
    JCNet().maidian(
      eventName: "cloak_suc",
      kkkkkey: "cloak_user",
      kkkkkeyVaaaaaa: "$type",
    );
  }

  static af_req() async {
    JCNet().maidian(eventName: "af_req");
  }

  // adj_user:[0] [1]   【0】为A包用户、【1】为B包用户
  static af_suc(String type) async {
    JCNet().maidian(
      eventName: "af_suc",
      kkkkkey: "adj_user",
      kkkkkeyVaaaaaa: "$type",
    );
  }

  static app_background() async {
    JCNet().maidian(eventName: "app_background");
  }

  static old_user_pop() async {
    JCNet().maidian(eventName: "old_user_pop");
  }

  static old_user_pop_c() async {
    JCNet().maidian(eventName: "old_user_pop_c");
  }

  // source_from:wheel（转盘奖励+签到奖励）、check（仅签到奖励）
  static daily_pop(String type) async {
    JCNet().maidian(
      eventName: "daily_pop",
      kkkkkey: "source_from",
      kkkkkeyVaaaaaa: "$type",
    );
  }

  static daily_pop_c(String type) async {
    JCNet().maidian(
      eventName: "daily_pop_c",
      kkkkkey: "source_from",
      kkkkkeyVaaaaaa: "$type",
    );
  }

  static quiz_guide() async {
    JCNet().maidian(eventName: "quiz_guide");
  }

  // source_from:new、other
  static quiz_guide_c(String type) async {
    JCNet().maidian(
      eventName: "quiz_guide_c",
      kkkkkey: "source_from",
      kkkkkeyVaaaaaa: "$type",
    );
  }

  static quiz_guide_cash_pop() async {
    JCNet().maidian(eventName: "quiz_guide_cash_pop");
  }

  static quiz_guide_cash_pop_c() async {
    JCNet().maidian(eventName: "quiz_guide_cash_pop_c");
  }

  static box_guide() async {
    JCNet().maidian(eventName: "box_guide");
  }

  static box_guide_c() async {
    JCNet().maidian(eventName: "box_guide_c");
  }

  static wheel_guide() async {
    JCNet().maidian(eventName: "wheel_guide");
  }

  static wheel_guide_c() async {
    JCNet().maidian(eventName: "wheel_guide_c");
  }

  static answer_true() async {
    JCNet().maidian(eventName: "answer_true");
  }

  static answer_wrong() async {
    JCNet().maidian(eventName: "answer_wrong");
  }

  // 参数source_from区分来源：quiz、wheel
  static coin_pop(String type) async {
    JCNet().maidian(
      eventName: "coin_pop",
      kkkkkey: "source_from",
      kkkkkeyVaaaaaa: "$type",
    );
  }

  static coin_pop_c(String type) async {
    JCNet().maidian(
      eventName: "coin_pop_c",
      kkkkkey: "source_from",
      kkkkkeyVaaaaaa: "$type",
    );
  }

  static coin_pop_close(String type) async {
    JCNet().maidian(
      eventName: "coin_pop_close",
      kkkkkey: "source_from",
      kkkkkeyVaaaaaa: "$type",
    );
  }

  static box_double_pop() async {
    JCNet().maidian(eventName: "box_double_pop");
  }

  static box_double_pop_c() async {
    JCNet().maidian(eventName: "box_double_pop_c");
  }

  static box_double_pop_close() async {
    JCNet().maidian(eventName: "box_double_pop_close");
  }

  // source_from:old、quiz、guide
  static wheel_pop(String type) async {
    JCNet().maidian(
      eventName: "wheel_pop",
      kkkkkey: "source_from",
      kkkkkeyVaaaaaa: "$type",
    );
  }

  static cash_page() async {
    JCNet().maidian(eventName: "cash_page");
  }

  // user_type:a、b（区分AB面）
  static quiz_page(String type) async {
    JCNet().maidian(
      eventName: "quiz_page",
      kkkkkey: "user_type",
      kkkkkeyVaaaaaa: "$type",
    );
  }

  static float_c() async {
    JCNet().maidian(eventName: "float_c");
  }

  static cash_page_c() async {
    JCNet().maidian(eventName: "cash_page_c");
  }

  static cash_confirm_pop() async {
    JCNet().maidian(eventName: "cash_confirm_pop");
  }

  static cash_confirm_pop_c() async {
    JCNet().maidian(eventName: "cash_confirm_pop_c");
  }

  static cash_task_pop() async {
    JCNet().maidian(eventName: "cash_task_pop");
  }

  static cash_task_pop_c() async {
    JCNet().maidian(eventName: "cash_task_pop_c");
  }

  static cash_queue_pop() async {
    JCNet().maidian(eventName: "cash_queue_pop");
  }


  // ad_number:1,2,...(记录用户看广告的次数，上不封顶）
  static cash_queue_po_c(String type) async {
    JCNet().maidian(
      eventName: "cash_queue_po_c",
      kkkkkey: "ad_number",
      kkkkkeyVaaaaaa: "$type",
    );
  }

  //task_from:quiz、pop、wheel、box
  static one_last_step_pop(String type) async {
    JCNet().maidian(
      eventName: "one_last_step_pop",
      kkkkkey: "task_from",
      kkkkkeyVaaaaaa: "$type",
    );
  }

  //task_from:quiz、pop、wheel、box
  static one_last_step_pop_c(String type) async {
    JCNet().maidian(
      eventName: "one_last_step_pop_c",
      kkkkkey: "task_from",
      kkkkkeyVaaaaaa: "$type",
    );
  }

  static cash_suc_pop() async {
    JCNet().maidian(eventName: "cash_suc_pop");
  }

  static cash_suc_pop_c() async {
    JCNet().maidian(eventName: "cash_suc_pop_c");
  }

  static cash_not_pop() async {
    JCNet().maidian(eventName: "cash_not_pop");
  }

  static cash_not_pop_c() async {
    JCNet().maidian(eventName: "cash_not_pop_c");
  }

  // inform_from:fix、sign、quiz、paypel

  static inform_c(String type) async {
    await Future.delayed(Duration(milliseconds: 1000));
    JCNet().maidian(
      eventName: "inform_c",
      kkkkkey: "inform_from",
      kkkkkeyVaaaaaa: "$type",
    );
  }

  //money_from:100,200,300,400,500,600,700,800...（每隔100一个档位，上不封顶）
  static cash_money_detail(String type) async {
    JCNet().maidian(
      eventName: "cash_money_detail",
      kkkkkey: "money_from",
      kkkkkeyVaaaaaa: "$type",
    );
  }

  // ad_from:5,10,15,20,25,30,35,40...（每隔5一个档位，上不封顶）
  static cash_ad_detail(String type) async {
    JCNet().maidian(
      eventName: "cash_ad_detail",
      kkkkkey: "ad_from",
      kkkkkeyVaaaaaa: "$type",
    );
  }

  static home_page_h5() async {
    JCNet().maidian(eventName: "home_page_h5");
  }

  // "ad_code_id:广告位ID；
  // ad_format：广告位类型，rv/int；
  // ad_platform：广告平台，admob、max、topon、tradplus、other"
  static ad_request({
    required String ad_code_id,
    required String ad_format,
    required String ad_platform,
  }) async {
    JCNet().maidian(
      eventName: "ad_request",
      kkkkkey: "ad_code_id",
      kkkkkeyVaaaaaa: ad_code_id,
      kkkkkey2: "ad_format",
      kkkkkeyVaaaaaa2: ad_format,
      kkkkkey3: "ad_platform",
      kkkkkeyVaaaaaa3: ad_platform,
    );
  }

  // "ad_code_id:广告位ID；
  // ad_format：广告位类型，rv/int；
  // ad_platform：广告平台，admob、max、topon、tradplus、other"
  static kwsbc_ad_return({
    required String ad_code_id,
    required String ad_format,
    required String ad_platform,
  }) async {
    JCNet().maidian(
      eventName: "kwsbc_ad_return",
      kkkkkey: "ad_code_id",
      kkkkkeyVaaaaaa: ad_code_id,
      kkkkkey2: "ad_format",
      kkkkkeyVaaaaaa2: ad_format,
      kkkkkey3: "ad_platform",
      kkkkkeyVaaaaaa3: ad_platform,
    );
  }

  static kwsbc_ad_chance(String ad_pos_id) async {
    JCNet().maidian(
      eventName: "kwsbc_ad_chance",
      kkkkkey: "ad_pos_id",
      kkkkkeyVaaaaaa: "$ad_pos_id",
    );
  }

  //"ad_pos_id：广告位名称
  // reason：
  // -ad_nocache：表示无广告缓存
  // -nonetwork：无网络
  // -impfail：展示失败（可能突然死机、卡顿、崩溃或其他问题导致展示失败）
  // -uninitialized：未初始化广告SDK
  // -notPrepared：广告未准备好"
  static kwsbc_ad_impression_fail({
    required String ad_pos_id,
    required String reason,
    required String ad_platform,
  }) async {
    JCNet().maidian(
      eventName: "kwsbc_ad_impression_fail",
      kkkkkey: "ad_pos_id",
      kkkkkeyVaaaaaa: ad_pos_id,
      kkkkkey2: "reason",
      kkkkkeyVaaaaaa2: reason,
      kkkkkey3: "ad_platform",
      kkkkkeyVaaaaaa3: ad_platform,
    );
  }


  static adjust_req() async {
    JCNet().maidian(eventName: "adjust_req");
  }


  static adjust_suc(String type) async {
    JCNet().maidian(
      eventName: "adjust_suc",
      kkkkkey: "adj_user",
      kkkkkeyVaaaaaa: "$type",
    );
  }
  // 0 失败 1 成功
  static en_user(String type) async {
    JCNet().maidian(
      eventName: "en_user",
      kkkkkey: "adj_user",
      kkkkkeyVaaaaaa: "$type",
    );
  }  static ad_privacypop_fail(String type) async {
    JCNet().maidian(
      eventName: "ad_privacypop_fail",
      kkkkkey: "reason",
      kkkkkeyVaaaaaa: "$type",
    );
  }

  static ad_privacypop_suc() async {
    JCNet().maidian(eventName: "ad_privacypop_suc");
  }
}
