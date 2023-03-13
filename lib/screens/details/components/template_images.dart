import 'package:flutter/material.dart';
import 'package:my_cv/models/template.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class TemplateImages extends StatefulWidget {
  const TemplateImages({
    Key key,
    @required this.template,
  }) : super(key: key);

  final Template template;

  @override
  _TemplateImagesState createState() => _TemplateImagesState();
}

class _TemplateImagesState extends State<TemplateImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: widget.template.id.toString(),
              child: Image.asset(widget.template.images[selectedImage]),
            ),
          ),
        ),
        // SizedBox(height: getProportionateScreenWidth(20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(widget.template.images.length,
                    (index) => buildSmallTemplatePreview(index)),
          ],
        )
      ],
    );
  }

  GestureDetector buildSmallTemplatePreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: primaryColor.withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child: Image.asset(widget.template.images[index]),
      ),
    );
  }
}