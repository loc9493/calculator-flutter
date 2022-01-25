import 'package:calculator/utils.dart';
import 'package:calculator/view_model/result_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  MobileAds.instance.initialize();
  Utils.homeBanner.load();
  Utils.detailBanner.load();
  runApp(const MyApp());
}

enum ButtonType {
  Clear,
  Btn0,
  Btn1,
  Btn2,
  Btn3,
  Btn4,
  Btn5,
  Btn6,
  Btn7,
  Btn8,
  Btn9,
  BtnClear,
  BtnPercent,
  BtnDivide,
  BtnCompound,
  BtnMinus,
  BtnAdd,
  BtnResult,
  BtnBackspace,
  BtnDot,
  BtnNegative
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Minimalist Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Minimalist Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ResultViewModel(),
        )
      ],
      child: Scaffold(
        backgroundColor: Utils.backgrounColorEnd,
        body: SafeArea(
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: Utils.adsBannerHeight(),
                  child: AdWidget(
                    ad: Utils.detailBanner,
                  ),
                ),
                const Expanded(child: DisplayContainer()),
                ButtonRow(rows: Utils.fifthRow),
                ButtonRow(rows: Utils.fourthRow),
                ButtonRow(rows: Utils.thirdRow),
                ButtonRow(rows: Utils.secondRow),
                ButtonRow(rows: Utils.firstRow),
                Container(
                  height: Utils.adsBannerHeight(),
                  child: AdWidget(
                    ad: Utils.homeBanner,
                  ),
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}

class ButtonRow extends StatelessWidget {
  const ButtonRow({Key? key, required this.rows}) : super(key: key);
  final List<ButtonType> rows;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: rows.map((e) => NeuContainer(button: e)).toList(),
      ),
    );
  }
}

class NeuContainer extends StatelessWidget {
  const NeuContainer({Key? key, required this.button}) : super(key: key);

  final ButtonType button;
  @override
  Widget build(BuildContext context) {
    ResultViewModel vm = Provider.of<ResultViewModel>(context);
    return InkWell(
      onTap: () => vm.didTapButton(button),
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Utils.backgrounColorStart,
                offset: Offset(Utils.offsetValue, Utils.offsetValue),
                blurRadius: Utils.blurRadius,
                spreadRadius: Utils.spreadRadius,
              ),
              BoxShadow(
                color: Utils.backgrounColorEnd,
                offset: Offset(-Utils.offsetValue, -Utils.offsetValue),
                blurRadius: Utils.blurRadius,
                spreadRadius: Utils.spreadRadius,
              )
            ],
            color: Utils.buttonColor(button)),
        child: Center(
          child: Text(
            Utils.buttonTitle(button),
            style: TextStyle(fontSize: 40, color: Utils.textColor(button)),
          ),
        ),
      ),
    );
  }
}

class DisplayContainer extends StatelessWidget {
  const DisplayContainer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ResultViewModel resultVM = Provider.of<ResultViewModel>(context);
    return SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(),
            padding: const EdgeInsets.only(bottom: 10),
            child: ListView.builder(
              reverse: true,
              itemCount: resultVM.history.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        resultVM.history[index].displayEquation(),
                        overflow: TextOverflow.ellipsis,
                        textWidthBasis: TextWidthBasis.parent,
                      ),
                      Text(
                        resultVM.history[index].result,
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                );
              },
            ),
          )),
          Row(
            children: [
              Text(resultVM.getCurrentEquation()),
              Expanded(
                  child: Text(
                resultVM.result,
                textAlign: TextAlign.end,
                style: TextStyle(
                  backgroundColor: Colors.white,
                  fontSize: 40,
                ),
              )),
            ],
          ),
        ],
      ),
    );
  }
}
