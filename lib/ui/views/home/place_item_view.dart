import 'package:flutter/material.dart';
import 'package:imob/ui/views/score_bar_view.dart';
import 'package:imob_design_system/colors/colors.dart';

class PlaceItemView extends StatelessWidget {
  const PlaceItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset("assets/images/capa.png", fit: BoxFit.cover,)),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nome do local",
                        style: TextStyle(
                          color: ImobColors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 4, top: 3),
                            child: Icon(Icons.location_on, color: ImobColors.red, size: 16,),
                          ),
                          Flexible(child: Text("Endereço completo Endereço completo Endereço completo ", maxLines: 3,)),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Expandir", style: TextStyle(color: ImobColors.darkGray, fontWeight: FontWeight.bold),),
                          SizedBox(width: 6),
                          Icon(Icons.zoom_out_map, size: 20, color: ImobColors.darkGray,),
                      ],)
                    ],
                  ),
                )
              ],
            ),
          ),
          ScoreBarView(),
        ],
      ),
    );
  }
}
