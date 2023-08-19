import 'package:flutter/material.dart';
import '../shared/theme.dart';


class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/blckWalpaper.png'
                ),
              ),
            ),
          ),
           Padding(
             padding: const EdgeInsets.only(left: 35),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.end,
               crossAxisAlignment: CrossAxisAlignment.start,
              children: [ 
                Text(
                  'EKSPLORE',
                  style: whiteTextStyle.copyWith(
                    fontSize: 30,
                    fontWeight: bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'BANJARNEGARA',
                  style: whiteTextStyle.copyWith(
                    fontSize: 30,
                    fontWeight: bold
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(''
                    'Kunjungi dan temukan keindahan  ',
                style: whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: reguler,
                ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                    'Tersembunyi',
                  style: whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: reguler,
                  ),

                ),
                Container (
                  height: 46,
                  width: 189,
                  margin: const EdgeInsets.only(top: 35, bottom: 125),
                  child: TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context,'/sign-in');
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: kBtColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)

                      )
                    ),
                    child: Text(
                      'START',
                      style: whiteTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: reguler,
                      ),
                      ),
                    ),
                  ),

              ],
          ),
           ),
        ],
      ),
    );
  }
}