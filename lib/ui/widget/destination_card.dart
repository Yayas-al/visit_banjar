import 'package:flutter/material.dart';
import 'package:visit_banjar/ui/detail_page.dart';

import '../../model/destination_model.dart';
import '../../shared/theme.dart';

class DestinationCardWidget extends StatelessWidget {


  final DestinationModel destination;

  const DestinationCardWidget(this.destination,{super.key, });

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
        width: 200,
        height: 323,
        margin: EdgeInsets.only(left: defaultMargin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: kWhiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Container(
                width: 180,
                height: 220,
                margin: const EdgeInsets.only(bottom:20 ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                        image: NetworkImage(
                            destination.imageUrl,
                        )
                    )
                ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination.name,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    destination.city,
                    style: blackTextStyle.copyWith(
                        fontWeight: light
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );

  }
}
