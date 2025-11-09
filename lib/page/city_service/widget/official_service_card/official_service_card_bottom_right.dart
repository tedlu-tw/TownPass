import 'package:flutter/material.dart';
import 'package:town_pass/page/city_service/model/my_service_model.dart';
import 'package:town_pass/util/tp_route.dart';
import 'package:town_pass/page/city_service/widget/official_service_card/official_service_card.dart';
import 'package:town_pass/util/tp_colors.dart';
import 'package:town_pass/util/tp_text.dart';

class OfficialServiceCardBottomRight extends OfficialServiceCard {
  const OfficialServiceCardBottomRight({super.key});

  @override
  Widget layoutBuild(BuildContext context, BoxConstraints constraint) {
    final MyServiceItem item = MyServiceItemId.ubikeFootprint.item;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        if (item.destinationUrl.isNotEmpty) {
          await TPRoute.openUri(uri: item.destinationUrl, forceTitle: item.forceWebViewTitle);
        }
      },
      child: Container(
        height: constraint.maxWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          gradient: const LinearGradient(
            begin: Alignment(0.71, 0.71),
            end: Alignment(-0.71, -0.71),
            colors: [
              Color(0xB344B6C7),
              Color(0xFF44B6C7),
            ],
          ),
        ),
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            // show service icon at bottom-left, sized to half of previous
            Positioned(
              left: 8.0,
              bottom: 4.0,
              child: SizedBox(
                width: constraint.maxWidth * 0.45,
                height: constraint.maxWidth * 0.45,
                child: item.icon,
              ),
            ),
            Positioned.fill(
              right: 9.0,
              top: 17.0,
              child: Column(
                spacing: 2.0,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TPText(
                    item.title,
                    style: TPTextStyles.h3SemiBold,
                    color: TPColors.white,
                  ),
                  TPText(
                    item.description,
                    style: TPTextStyles.bodyRegular,
                    color: TPColors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
