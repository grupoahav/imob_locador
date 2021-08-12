import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imob_design_system/imob_design_system.dart';

import '../../../../../../../core/presentation/widgets/item_informacoes_expandible_widget.dart';

class DuvidasFrequentesPage extends StatefulWidget {
  @override
  _DuvidasFrequentesPageState createState() => _DuvidasFrequentesPageState();
}

class _DuvidasFrequentesPageState extends State<DuvidasFrequentesPage> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: theme.scaffoldBackgroundColor,
        statusBarIconBrightness: theme.brightness.opposite,
        statusBarBrightness: theme.brightness,
      ),
      child: SafeArea(
        child: Scaffold(
          body: ListView(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: ImobBackButton(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 16.scale,
                  horizontal: 24.scale,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dúvidas frequentes',
                      style: theme.textTheme.headline5!.merge(
                        TextStyle(
                          color: theme.colorScheme.error,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.scale),
                    Divider(height: 2.scale, thickness: 2.scale),
                    const ItemInformacoesExpandible(
                      title: 'Como cadastro meu imóvel?',
                      content:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean quis lorem in tellus auctor auctor. Aenean vitae diam maximus, volutpat eros quis, feugiat ex. Quisque ipsum turpis, tincidunt eu rutrum sed, iaculis ac enim. Maecenas pretium auctor pretium. Quisque ac nibh a erat sodales pretium a mollis magna. Nulla et lacinia leo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Vestibulum et aliquam tellus. Nam lacinia lorem ut tortor tristique lobortis. Suspendisse at egestas diam, eu venenatis ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer imperdiet congue eros, a ornare metus blandit eget. Nulla facilisi. Interdum et malesuada fames ac ante ipsum primis in faucibus.',
                    ),
                    Divider(height: 2.scale, thickness: 2.scale),
                    const ItemInformacoesExpandible(
                      title: 'Como melhorar meu cadastro?',
                      content:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean quis lorem in tellus auctor auctor. Aenean vitae diam maximus, volutpat eros quis, feugiat ex. Quisque ipsum turpis, tincidunt eu rutrum sed, iaculis ac enim. Maecenas pretium auctor pretium. Quisque ac nibh a erat sodales pretium a mollis magna. Nulla et lacinia leo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Vestibulum et aliquam tellus. Nam lacinia lorem ut tortor tristique lobortis. Suspendisse at egestas diam, eu venenatis ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer imperdiet congue eros, a ornare metus blandit eget. Nulla facilisi. Interdum et malesuada fames ac ante ipsum primis in faucibus.',
                    ),
                    Divider(height: 2.scale, thickness: 2.scale),
                    const ItemInformacoesExpandible(
                      title: 'Como posso ser escolhido?',
                      content:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean quis lorem in tellus auctor auctor. Aenean vitae diam maximus, volutpat eros quis, feugiat ex. Quisque ipsum turpis, tincidunt eu rutrum sed, iaculis ac enim. Maecenas pretium auctor pretium. Quisque ac nibh a erat sodales pretium a mollis magna. Nulla et lacinia leo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Vestibulum et aliquam tellus. Nam lacinia lorem ut tortor tristique lobortis. Suspendisse at egestas diam, eu venenatis ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer imperdiet congue eros, a ornare metus blandit eget. Nulla facilisi. Interdum et malesuada fames ac ante ipsum primis in faucibus.',
                    ),
                    Divider(height: 2.scale, thickness: 2.scale),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
