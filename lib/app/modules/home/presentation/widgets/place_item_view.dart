import 'package:flutter/material.dart';
import 'package:imob_design_system/imob_design_system.dart';

import 'score_bar_view.dart';

class PlaceItemView extends StatelessWidget {
  const PlaceItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: ImobColors.blueLight,
            blurRadius: 9.scale,
            offset: const Offset(0.0, 3.0),
          ),
        ],
        borderRadius: BorderRadius.circular(8.scale),
      ),
      child: Material(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8.scale),
        child: InkWell(
          borderRadius: BorderRadius.circular(8.scale),
          onTap: () {},
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0.scale),
                child: Row(
                  children: [
                    SizedBox(
                      width: 100.scale,
                      height: 100.scale,
                      child: Image.asset(
                        'assets/home/pngs/home_empty.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 8.scale),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nome do local',
                            style: theme.textTheme.subtitle2!.merge(
                              TextStyle(
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: ImobColors.red,
                                size: 16.scale,
                              ),
                              Flexible(
                                child: Text(
                                  'Endereço completo Endereço completo Endereço completo ',
                                  maxLines: 3,
                                  style: theme.textTheme.caption!,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Expandir',
                                style: theme.textTheme.caption,
                              ),
                              SizedBox(width: 8.scale),
                              Icon(
                                Icons.zoom_out_map,
                                size: 16.scale,
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const ScoreBarView(
                score: 700,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
