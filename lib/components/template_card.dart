import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_cv/screens/details/details_screen.dart';

import '../constants.dart';
import '../models/template.dart';
import '../size_config.dart';

class TemplateCard extends StatelessWidget {
  const TemplateCard({
    Key key,
    this.width = 140,
    this.aspectRatio = 1.02,
    @required this.template,
  }) : super(key: key);

  final double width, aspectRatio;
  final Template template;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            DetailsScreen.routeName,
            arguments: TemplateDetailsArguments(template: template),
          ),
          child: Container(
            height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
            child: Row(
              children: <Widget>[
                Container(
                  width: 150,
                  child: ClipRRect(
                    borderRadius: new BorderRadius.circular(30),
                    child: Image.asset(
                      template.images[0],
                      fit: BoxFit.contain,
                      alignment: Alignment.centerLeft,
                    ),
                  )
                ),
                Container(
                  width: 200,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        template.title,
                        style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 16),
                        maxLines: 2,
                      ),
                      SizedBox(height: 10),
                      Wrap(
                        children: [
                          Text(
                              template.description,
                              style: TextStyle(color: secondaryColor, fontSize: 13),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis
                          ),
                        ]
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            template.rating.toString(),
                            style: TextStyle(color: secondaryColor),
                            maxLines: 2,
                          ),
                          Icon(Icons.star_rounded, color: secondaryColor),
                          Spacer(),
                          InkWell(
                            borderRadius: BorderRadius.circular(50),
                            onTap: () {
                              template.isFavourite = !template.isFavourite;
                              if (favTemplates.contains(template)) {
                                favTemplates.remove(template);
                              } else {
                                favTemplates.add(template);
                              }
                              (context as Element).markNeedsBuild();
                            },
                            child: Container(
                              padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                              height: getProportionateScreenWidth(28),
                              width: getProportionateScreenWidth(28),
                              decoration: BoxDecoration(
                                color: template.isFavourite
                                    ? primaryColor.withOpacity(0.15)
                                    : secondaryColor.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(
                                "assets/icons/heart.svg",
                                color: template.isFavourite
                                    ? Color(0xFFFF4848)
                                    : Color(0xFFDBDEE4),
                              ),
                            ),
                          ),
                        ]
                      ),
                    ],
                  )
                )
              ]
            )
          )
        ),
      ),
    );
  }
}