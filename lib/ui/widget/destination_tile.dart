import 'package:flutter/material.dart';
import 'package:visit_banjar/shared/theme.dart';

import '../../model/destination_model.dart';
import '../detail_page.dart';

class DestinationTile extends StatelessWidget {

  final DestinationModel destination;

  const DestinationTile( this.destination,{super.key, });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
          MaterialPageRoute(
              builder: (context) =>  DetailPage(destination)
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(28)
        ),
        child: Row(
          children: [
            Container(
              height: 70,
              width: 70,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                  destination.imageUrl
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      destination.name,
                  style: blackTextStyle
                      .copyWith(
                    fontSize: 18,
                    fontWeight: medium
                  ),
                  ),
                  const SizedBox(height: 5,),
                  Text(destination.city,
                    style: blackTextStyle.copyWith(
                      fontWeight: light
                    ),
                  ),

                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  margin: const EdgeInsets.only(right: 2),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/icon.png'
                          )
                      )
                  ),
                )
              ],

            )
          ],
        ),
      ),
    );
  }
}
