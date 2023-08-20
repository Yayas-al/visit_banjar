
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:visit_banjar/shared/theme.dart';
import 'package:visit_banjar/ui/widget/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/destination_model.dart';

class DetailPage extends StatelessWidget {

  final DestinationModel destination;

  const DetailPage(this.destination, {super.key});

  Future<void> _launchURL(String url) async{
    final Uri uri =Uri(scheme: "https", host: 'www.google.com', path: url);
    if(!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )
    ){
      throw "Tidak bisa membuka map";
    }
  }
  @override
  Widget build(BuildContext context) {

    Widget bgImage(){
      return Container(
        width: double.infinity,
        height: 450,
        decoration:  BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              destination.imageUrl,
            )
          )
        ),
      );
    }
    Widget customShadow(){
      return Container(
        height: 214,
        margin: const EdgeInsets.only(top: 236),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kWhiteColor.withOpacity(0),
              Colors.black.withOpacity(0.95),
            ]
          )
        ),
      );
    }
    Widget content(){
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin
        ),
        child: Column(
          children: [
            //Emblem
            Container(
              width: 108,
              height: 24,
              margin: const EdgeInsets.only(top: 30),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/emblem.png'
                  )
                )
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 256),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(destination.name,
                      style: whiteTextStyle.copyWith(
                        fontWeight: semiBold,
                          fontSize:24
                      ),
                      ),
                      Text(
                        destination.city,
                        style: whiteTextStyle.copyWith(
                          fontWeight: light,
                          fontSize: 16
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(18)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //About
                children: [
                  Text('Deskripsi',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                  ),
                  const SizedBox(height: 6,),
                  Text(destination.about,
                  style: blackTextStyle.copyWith(
                    height: 2,
                    fontWeight: reguler,
                    fontSize: 12
                  ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 20,),
              const SizedBox(height: 20,),
                  Text('Alamat',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(height: 6,),
                  Row(
                    children: [
                      Text(destination.city,
                        style: blackTextStyle.copyWith(
                          fontWeight: reguler,
                          fontSize: 12,
                          height: 2,
                        ),
                      ),
                      const SizedBox(
                        width: 150,
                      ),
                      CustomButton(
                        width: 45,
                        title: 'Go',
                        onPressed: () {
                          _launchURL(destination.location);
                        }, heigt: 35,

                      ),
                    ],
                  ),


              const SizedBox(height: 20,),
              Text('Tiket',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),),

                  const SizedBox(height: 12,),
                  Text(NumberFormat.currency(locale: 'id',symbol: 'IDR ', decimalDigits: 0)
                      .format(destination.price)
                  ,style:
                    blackTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: semiBold,
                    ),)

                ],
              ),
            ),
          ],
        ),
      );
    }
    return Scaffold(
      backgroundColor: kBackGroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            bgImage(),
            customShadow(),
            content(),
          ],
        ),
      ),
    );
  }

}
