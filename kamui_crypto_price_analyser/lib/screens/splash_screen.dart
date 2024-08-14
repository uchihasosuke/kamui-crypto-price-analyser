import 'package:kamui_crypto_price_analyser/data/constants.dart/constant.dart';
import 'package:kamui_crypto_price_analyser/data/model/crypto_model.dart';
import 'package:kamui_crypto_price_analyser/screens/crypto_list_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getDataFromAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
        child: Center(
          child:
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Kamui Crypto Price Analyser", style: TextStyle(fontSize: 25,color: redColor)),

              /*Positioned(
                bottom: 35,
                left: 105,
                child: SpinKitSpinningLines(

                color: redColor,
                size: 65.0,
              ),),*/

              SpinKitSpinningLines(
                color: Colors.red,
                size: 70.0,
              ),
              Image(
                image: AssetImage('assets/images/logo.png'),
              ),

            ],
          ),
        ),
      ),
    );
  }

  List<Crypto>? cryptoList;
  getDataFromAPI() async {
    Response response = await Dio().get('https://api.coincap.io/v2/assets');
    List<dynamic> jsonMapsList = response.data['data'];
    cryptoList =
        jsonMapsList.map<Crypto>((e) => Crypto.fromMapObject(e)).toList();

    await goToHomeScreen();
  }

  goToHomeScreen() {
    var duration = const Duration(seconds: 3);
    Future.delayed(
      duration,
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => CryptoListScreen(
              cryptoList: cryptoList,
            ),
          ),
        );
      },
    );
  }
}
