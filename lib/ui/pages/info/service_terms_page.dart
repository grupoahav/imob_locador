import 'package:flutter/material.dart';
import 'package:imob_design_system/imob_design_system.dart';

class ServiceTermsPage extends StatelessWidget {
  const ServiceTermsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImobPage(
      hasBackButton: true,
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Termos de serviços").toAppBarH1(),
                    SizedBox(height: 8),
                    Container(
                      width: 100,
                      child: Divider(
                        thickness: 5,
                        color: ImobColors.dividerColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
            "Aenean quis lorem in tellus auctor auctor. Aenean vitae "
            "diam maximus, volutpat eros quis, feugiat ex. Quisque ipsum "
            "turpis, tincidunt eu rutrum sed, iaculis ac enim. Maecenas "
            "pretium auctor pretium. Quisque ac nibh a erat sodales "
            "pretium a mollis magna. Nulla et lacinia leo. Vestibulum "
            "ante ipsum primis in faucibus orci luctus et ultrices "
            "posuere cubilia curae; Vestibulum et aliquam tellus. Nam "
            "lacinia lorem ut tortor tristique lobortis. Suspendisse at "
            "egestas diam, eu venenatis ante. Pellentesque habitant "
            "morbi tristique senectus et netus et malesuada fames ac "
            "turpis egestas. \n\nInteger imperdiet congue eros, a ornare "
            "metus blandit eget. Nulla facilisi. Interdum et malesuada "
            "fames ac ante ipsum primis in faucibus. Integer erat purus, "
            "rhoncus id dictum aliquet, semper id elit. Nunc tincidunt "
            "aliquam felis, at tincidunt diam faucibus interdum. Mauris "
            "sit amet odio vel justo fermentum dapibus. Maecenas lacinia "
            "vulputate urna, eu malesuada tellus. Cras fringilla ipsum "
            "vel sem tristique, ac blandit arcu mollis. Praesent varius "
            "rutrum accumsan. Nunc sed gravida nisi. Vivamus sodales "
            "dapibus arcu eget posuere. \n\nCurabitur venenatis eget libero "
            "vitae auctor. Phasellus sed euismod tellus. Morbi tristique "
            "lorem quis ipsum aliquet auctor. Donec congue turpis libero."
            " Integer turpis est, vestibulum id maximus nec, finibus quis"
            " tellus. Etiam ac sapien feugiat, sodales \n\n"
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
            "Aenean quis lorem in tellus auctor auctor. Aenean vitae "
            "diam maximus, volutpat eros quis, feugiat ex. Quisque ipsum "
            "turpis, tincidunt eu rutrum sed, iaculis ac enim. Maecenas "
            "pretium auctor pretium. Quisque ac nibh a erat sodales "
            "pretium a mollis magna. Nulla et lacinia leo. Vestibulum "
            "ante ipsum primis in faucibus orci luctus et ultrices "
            "posuere cubilia curae; Vestibulum et aliquam tellus. Nam "
            "lacinia lorem ut tortor tristique lobortis. Suspendisse at "
            "egestas diam, eu venenatis ante. Pellentesque habitant "
            "morbi tristique senectus et netus et malesuada fames ac "
            "turpis egestas. \n\nInteger imperdiet congue eros, a ornare "
            "metus blandit eget. Nulla facilisi. Interdum et malesuada "
            "fames ac ante ipsum primis in faucibus. Integer erat purus, "
            "rhoncus id dictum aliquet, semper id elit. Nunc tincidunt "
            "aliquam felis, at tincidunt diam faucibus interdum. Mauris "
            "sit amet odio vel justo fermentum dapibus. Maecenas lacinia "
            "vulputate urna, eu malesuada tellus. Cras fringilla ipsum "
            "vel sem tristique, ac blandit arcu mollis. Praesent varius "
            "rutrum accumsan. Nunc sed gravida nisi. Vivamus sodales "
            "dapibus arcu eget posuere. \n\nCurabitur venenatis eget libero "
            "vitae auctor. Phasellus sed euismod tellus. Morbi tristique "
            "lorem quis ipsum aliquet auctor. Donec congue turpis libero."
            " Integer turpis est, vestibulum id maximus nec, finibus quis"
            " tellus. Etiam ac sapien feugiat, sodales \n\n",
            style: TextStyle(color: ImobColors.textColor),
          ),
        ]))
      ],
    );
  }
}
