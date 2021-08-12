import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imob_design_system/imob_design_system.dart';

class TermosServicosPage extends StatefulWidget {
  @override
  _TermosServicosPageState createState() => _TermosServicosPageState();
}

class _TermosServicosPageState extends State<TermosServicosPage> {
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
                      'Termos de serviços',
                      style: theme.textTheme.headline5!.merge(
                        TextStyle(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.scale),
                    SizedBox(
                      width: 80.scale,
                      child: Divider(
                        height: 4.scale,
                        thickness: 4.scale,
                      ),
                    ),
                    SizedBox(height: 16.scale),
                    const Text(
                      '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean quis lorem in tellus auctor auctor. Aenean vitae diam maximus, volutpat eros quis, feugiat ex. Quisque ipsum turpis, tincidunt eu rutrum sed, iaculis ac enim. Maecenas pretium auctor pretium. Quisque ac nibh a erat sodales pretium a mollis magna. Nulla et lacinia leo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Vestibulum et aliquam tellus. Nam lacinia lorem ut tortor tristique lobortis. Suspendisse at egestas diam, eu venenatis ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer imperdiet congue eros, a ornare metus blandit eget. Nulla facilisi.
                      
Interdum et malesuada fames ac ante ipsum primis in faucibus. Integer erat purus, rhoncus id dictum aliquet, semper id elit. Nunc tincidunt aliquam felis, at tincidunt diam faucibus interdum. Mauris sit amet odio vel justo fermentum dapibus. Maecenas lacinia vulputate urna, eu malesuada tellus. Cras fringilla ipsum vel sem tristique, ac blandit arcu mollis. Praesent varius rutrum accumsan. Nunc sed gravida nisi. Vivamus sodales dapibus arcu eget posuere.
                      
Curabitur venenatis eget libero vitae auctor. Phasellus sed euismod tellus. Morbi tristique lorem quis ipsum aliquet auctor. Donec congue turpis libero. Integer turpis est, vestibulum id maximus nec, finibus quis tellus. Etiam ac sapien feugiat, sodales''',
                    )
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
