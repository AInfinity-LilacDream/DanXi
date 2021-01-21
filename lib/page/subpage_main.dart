import 'package:dan_xi/model/person.dart';
import 'package:dan_xi/repository/card_repository.dart';
import 'package:dan_xi/repository/fudan_daily_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_dialog/flutter_progress_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class HomeSubpage extends StatefulWidget {
  @override
  _HomeSubpageState createState() => _HomeSubpageState();

  HomeSubpage({Key key});
}

class _HomeSubpageState extends State<HomeSubpage> {
  String _helloQuote = "";
  CardInfo _cardInfo;
  bool _fudanDailyTicked = true;

  @override
  void initState() {
    super.initState();
  }

  Future<String> _loadCard(PersonInfo info) async {
    await CardRepository.getInstance().login(info);
    _cardInfo = await CardRepository.getInstance().loadCardInfo(7);
    return _cardInfo.cash;
  }

  @override
  Widget build(BuildContext context) {
    int time = DateTime.now().hour;
    if (time >= 23 || time <= 4) {
      _helloQuote = "披星戴月，不负韶华";
    } else if (time >= 5 && time <= 8) {
      _helloQuote = "一日之计在于晨";
    } else if (time >= 9 && time <= 11) {
      _helloQuote = "快到中午啦";
    } else if (time >= 12 && time <= 16) {
      _helloQuote = "下午的悠闲时光~";
    } else if (time >= 17 && time <= 22) {
      _helloQuote = "晚上好~";
    }
    PersonInfo info = Provider.of<ValueNotifier<PersonInfo>>(context)?.value;
    String connectStatus = Provider.of<ValueNotifier<String>>(context)?.value;
    return Column(
      children: <Widget>[
        Card(
            child: Column(
          children: [
            ListTile(
              title: Text("欢迎你,${info?.name}"),
              subtitle: Text(_helloQuote),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.wifi),
              title: Text("当前连接"),
              subtitle: Text(connectStatus),
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text("饭卡余额"),
              subtitle: FutureBuilder(
                  future: _loadCard(info),
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasData) {
                      String response = snapshot.data;
                      return Text(response);
                    } else {
                      return Text("获取中...");
                    }
                  }),
              onTap: () {
                if (_cardInfo != null) {
                  Navigator.of(context).pushNamed("/card/detail",
                      arguments: {"cardInfo": _cardInfo, "personInfo": info});
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.stacked_line_chart),
              title: Text("食堂排队消费状况"),
              onTap: () {
                Navigator.of(context).pushNamed("/card/crowdData",
                    arguments: {"cardInfo": _cardInfo, "personInfo": info});
              },
            )
          ],
        )),
        Card(
          child: ListTile(
            title: Text("平安复旦"),
            leading: Icon(Icons.cloud_upload),
            subtitle: FutureBuilder(
                future: FudanDailyRepository.getInstance().hasTick(info),
                builder: (_, AsyncSnapshot<bool> snapshot) {
                  if (snapshot.hasData) {
                    _fudanDailyTicked = snapshot.data;
                    return Text(_fudanDailyTicked ? "你今天已经上报过了哦！" : "点击上报");
                  } else {
                    return Text("获取中...");
                  }
                }),
            onTap: () async {
              if (_fudanDailyTicked) return;
              var progressDialog =
                  showProgressDialog(loadingText: "打卡中...", context: context);
              await FudanDailyRepository.getInstance().tick(info).then(
                  (value) => {progressDialog.dismiss(), setState(() {})},
                  onError: (_) => {
                        progressDialog.dismiss(),
                        Fluttertoast.showToast(msg: "打卡失败，请检查网络连接~")
                      });
            },
          ),
        )
      ],
    );
  }
}