// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'zh';

  static m0(time) => "将在${time}秒后自动打卡，点击以取消";

  static m1(mostCrowded, leastCrowded) =>
      "[排队最多]${mostCrowded}餐厅 [排队最少]${leastCrowded}餐厅";

  static m2(name) => "回复 No.${name}";

  static m3(week) => "第 ${week} 周";

  static m4(name) => "欢迎你，${name}";

  final messages = _notInlinedMessages(_notInlinedMessages);

  static _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("关于本应用"),
        "account": MessageLookupByLibrary.simpleMessage("账户"),
        "and": MessageLookupByLibrary.simpleMessage("和"),
        "app_description": MessageLookupByLibrary.simpleMessage(
            "由几位复旦本科学生用爱发电打造的微型复旦综合服务App，希望能为你的生活提供便利~"),
        "app_description_title": MessageLookupByLibrary.simpleMessage("简介"),
        "app_feedback": MessageLookupByLibrary.simpleMessage("App反馈"),
        "app_name": MessageLookupByLibrary.simpleMessage("旦兮 α"),
        "author_descriptor" : MessageLookupByLibrary.simpleMessage("Passionate developers\nfrom Engineering @ Fudan University"),
    "authors" : MessageLookupByLibrary.simpleMessage("开发者"),
    "cancel" : MessageLookupByLibrary.simpleMessage("取消"),
    "change_account" : MessageLookupByLibrary.simpleMessage("切换账号"),
    "choose_area" : MessageLookupByLibrary.simpleMessage("选择校区"),
    "contact_us" : MessageLookupByLibrary.simpleMessage("联系我们"),
    "current_connection" : MessageLookupByLibrary.simpleMessage("当前连接"),
    "current_connection_failed" : MessageLookupByLibrary.simpleMessage("获取 WiFi 名称失败，请授予精确定位权限"),
    "current_connection_no_wifi" : MessageLookupByLibrary.simpleMessage("没有连接到WLAN"),
    "dashboard" : MessageLookupByLibrary.simpleMessage("首页"),
    "default_campus" : MessageLookupByLibrary.simpleMessage("当前校区"),
    "dining_hall_crowdedness" : MessageLookupByLibrary.simpleMessage("食堂排队消费状况"),
    "ecard_balance" : MessageLookupByLibrary.simpleMessage("校园卡余额"),
    "ecard_balance_log" : MessageLookupByLibrary.simpleMessage("消费记录"),
    "empty_classrooms" : MessageLookupByLibrary.simpleMessage("空教室"),
    "failed" : MessageLookupByLibrary.simpleMessage("加载失败，点击重试"),
    "fatal_error" : MessageLookupByLibrary.simpleMessage("错误"),
    "fenglin_campus" : MessageLookupByLibrary.simpleMessage("枫林校区"),
    "forum" : MessageLookupByLibrary.simpleMessage("树洞"),
    "forum_post_enter_content" : MessageLookupByLibrary.simpleMessage("发布"),
    "fudan_aao_notices" : MessageLookupByLibrary.simpleMessage("教务处通知"),
    "fudan_daily" : MessageLookupByLibrary.simpleMessage("平安复旦自动打卡"),
    "fudan_daily_tick" : MessageLookupByLibrary.simpleMessage("点击打卡"),
    "fudan_daily_tick_countdown" : m0,
    "fudan_daily_ticked" : MessageLookupByLibrary.simpleMessage("今日已打卡"),
    "fudan_qr_code" : MessageLookupByLibrary.simpleMessage("复活码"),
    "good_afternoon" : MessageLookupByLibrary.simpleMessage("下午的悠闲时光~"),
    "good_morning" : MessageLookupByLibrary.simpleMessage("一日之计在于晨"),
    "good_night" : MessageLookupByLibrary.simpleMessage("晚上好~"),
    "good_noon" : MessageLookupByLibrary.simpleMessage("快到中午啦"),
    "handan_campus" : MessageLookupByLibrary.simpleMessage("邯郸校区"),
    "i_see" : MessageLookupByLibrary.simpleMessage("好"),
    "jiangwan_campus" : MessageLookupByLibrary.simpleMessage("江湾校区"),
    "last_15_days" : MessageLookupByLibrary.simpleMessage("过去 15 天"),
    "last_30_days" : MessageLookupByLibrary.simpleMessage("过去 30 天"),
    "last_7_days" : MessageLookupByLibrary.simpleMessage("过去 7 天"),
    "last_transaction" : MessageLookupByLibrary.simpleMessage("上次交易"),
    "late_night" : MessageLookupByLibrary.simpleMessage("披星戴月，不负韶华"),
    "loading" : MessageLookupByLibrary.simpleMessage("加载中..."),
    "loading_qr_code" : MessageLookupByLibrary.simpleMessage("正在加载复活码...\n可能需要5~10秒，取决于复旦服务器。"),
    "login" : MessageLookupByLibrary.simpleMessage("登录"),
    "login_failed" : MessageLookupByLibrary.simpleMessage("登陆失败，请检查账号和密码"),
    "login_issue_1" : MessageLookupByLibrary.simpleMessage("登录失败，旦兮无法完成 UIS 登录。\n出现此错误，很可能是由于您连续多次登录失败所致。\n您需要使用浏览器手动完成一次登录，从下一次登录开始，旦兮 即可妥善处理此情况。"),
    "login_issue_1_action" : MessageLookupByLibrary.simpleMessage("打开UIS登录页面"),
    "login_uis" : MessageLookupByLibrary.simpleMessage("登录复旦UIS"),
    "login_uis_description" : MessageLookupByLibrary.simpleMessage("您的用户名和密码仅会被用于登录复旦UIS"),
    "login_uis_pwd" : MessageLookupByLibrary.simpleMessage("UIS密码"),
    "login_uis_uid" : MessageLookupByLibrary.simpleMessage("UIS账号"),
    "login_with_uis" : MessageLookupByLibrary.simpleMessage("将使用以下信息匿名登录树洞"),
    "logining" : MessageLookupByLibrary.simpleMessage("正在登录..."),
    "logout" : MessageLookupByLibrary.simpleMessage("退出登录"),
    "logout_prompt" : MessageLookupByLibrary.simpleMessage("重新启动app以删除数据"),
    "logout_question_prompt" : MessageLookupByLibrary.simpleMessage("改动将在app退出后生效"),
    "logout_question_prompt_title" : MessageLookupByLibrary.simpleMessage("确定要退出登录吗？"),
    "logout_subtitle" : MessageLookupByLibrary.simpleMessage("并删除此设备上的所有数据"),
    "most_least_crowded_canteen" : m1,
    "new_post" : MessageLookupByLibrary.simpleMessage("发布新帖子"),
    "open_source_software_licenses" : MessageLookupByLibrary.simpleMessage("开源软件许可协议"),
    "out_of_dining_time" : MessageLookupByLibrary.simpleMessage("现在不是用餐时间"),
    "post_failed" : MessageLookupByLibrary.simpleMessage("网络错误，帖子发布失败"),
    "privacy_policy" : MessageLookupByLibrary.simpleMessage("隐私政策"),
    "project_page" : MessageLookupByLibrary.simpleMessage("项目页面"),
    "reply_to" : m2,
    "select_campus" : MessageLookupByLibrary.simpleMessage("选择校区"),
    "settings" : MessageLookupByLibrary.simpleMessage("设置"),
    "share" : MessageLookupByLibrary.simpleMessage("分享"),
    "share_as_ics" : MessageLookupByLibrary.simpleMessage("导出为ICS"),
    "tag_least_crowded" : MessageLookupByLibrary.simpleMessage("最空闲"),
    "tag_most_crowded" : MessageLookupByLibrary.simpleMessage("最拥挤"),
    "tap_to_view" : MessageLookupByLibrary.simpleMessage("点击以查看"),
        "terms_and_conditions": MessageLookupByLibrary.simpleMessage("使用条款"),
        "terms_and_conditions_content":
            MessageLookupByLibrary.simpleMessage("登录即表示您已阅读并同意"),
        "terms_and_conditions_content_end":
            MessageLookupByLibrary.simpleMessage("。"),
        "terms_and_conditions_title":
            MessageLookupByLibrary.simpleMessage("法律"),
        "theme": MessageLookupByLibrary.simpleMessage("主题"),
        "tick_failed": MessageLookupByLibrary.simpleMessage("打卡失败，请检查网络连接"),
        "tick_issue_1": MessageLookupByLibrary.simpleMessage(
            "打卡失败，无法获取上次打卡记录。\n出现此错误，很可能是由于您第一次使用 旦兮，且昨天忘记打卡所致。\n您需要使用小程序手动完成第一次打卡，从下一次打卡开始，旦兮 即可妥善处理此情况。"),
        "ticking": MessageLookupByLibrary.simpleMessage("正在打卡..."),
        "timetable": MessageLookupByLibrary.simpleMessage("日程"),
        "view_ossl": MessageLookupByLibrary.simpleMessage("本应用的诞生离不开许多开源软件。查看"),
        "week": m3,
        "welcome": m4,
        "zhangjiang_campus": MessageLookupByLibrary.simpleMessage("张江校区")
      };
}
