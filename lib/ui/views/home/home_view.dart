import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imob/ui/views/home/place_item_view.dart';
import 'package:imob_design_system/colors/colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.maxFinite,
      height: double.maxFinite,
      padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
      child: _content(),
    );
  }

  _content() {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                  height: 200,
                  child: Image.asset("assets/images/top_place.png")),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  "Aqui você cadastra e encontra todos seus locais cadastrados.",
                  style: TextStyle(
                    color: ImobColors.textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Text(
                  "Lembre-se, quanto mais cadastros completos mais chances do seu local ser escolhido.",
                  style: TextStyle(color: ImobColors.textColor, fontSize: 13),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (_, index) {
              return PlaceItemView();
            },
          )
        ]))
      ],
    );
  }
}
