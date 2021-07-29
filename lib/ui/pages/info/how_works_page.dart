import 'package:flutter/material.dart';
import 'package:imob/core/viewmodels/info_view_model.dart';
import 'package:imob/ui/views/how_works_pager_view.dart';
import 'package:imob_design_system/imob_design_system.dart';
import 'package:provider/provider.dart';

class HowWorksPage extends StatefulWidget {
  @override
  _HowWorksPageState createState() => _HowWorksPageState();
}

class _HowWorksPageState extends State<HowWorksPage> {
  InfoViewModel? _viewModel;

  _appBar() {
    return AppBar(
      title: Column(
        children: [
          Text("Base App"),
        ],
      ),
      centerTitle: true,
    );
  }

  _body() {
    return Column(
      children: [
        Expanded(
          child: HowWorksPagerView(),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.85,
          height: 55,
          margin: EdgeInsets.only(bottom: 10),
          child: ElevatedButton(
            child: Text(
              _viewModel!.getButtonText(),
              style: TextStyle(
                fontSize: 19,
              ),
            ),
            onPressed: () {
              bool hasNextPage = _viewModel!.nextPage();
              print(hasNextPage);
              // if hasNextPage isn't true, it's the last pageview
            },
            style: ElevatedButton.styleFrom(
              primary: _viewModel!.getButtonColor(),
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
            ),
          ),
        )
        // FooterComponent(text: _viewModel.footerText),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = Provider.of<InfoViewModel>(context);

    return ImobPage(
      hasBackButton: true,
      body: _body(),
    );
  }
}
