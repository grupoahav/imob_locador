import 'package:flutter/material.dart';
import 'package:imob/core/viewmodels/info_view_model.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HowWorksPagerView extends StatefulWidget {
  @override
  _HowWorksPagerViewState createState() => _HowWorksPagerViewState();
}

class _HowWorksPagerViewState extends State<HowWorksPagerView> {

  InfoViewModel? _viewModel;

  _viewPagerItem(int index) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: Image.asset(
              'assets/images' + _viewModel!.viewPagerItems[index].imgPath!,
              height: 235,
              width: MediaQuery.of(context).size.width * 0.9,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(bottom: 10, left: 30),
              child: Text(
                _viewModel!.viewPagerItems[index].title!,
                style: TextStyle(
                  fontFamily: 'Josefin Sans',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3E4A65),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  _viewModel!.viewPagerItems[index].text!,
                  style: TextStyle(fontSize: 15),
                )),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = Provider.of<InfoViewModel>(context);

    return Column(children: [
      Expanded(
        child: PageView.builder(
            controller: _viewModel!.controller,
            itemCount: _viewModel!.viewPagerItems.length,
            onPageChanged: (int index) {
              _viewModel!.setViewPagerIndex(index);
            },
            itemBuilder: (_, index) {
              return _viewPagerItem(index);
            }),
      ),
      _viewModel!.viewPagerItems.length == 0
          ? Container()
          : Padding(
        padding: const EdgeInsets.all(10.0),
        child: SmoothPageIndicator(
            controller: _viewModel!.controller,
            count: _viewModel!.viewPagerItems.length,
            effect: ScaleEffect(
              dotWidth: 7,
              dotHeight: 7,
              activePaintStyle: PaintingStyle.stroke,
              activeStrokeWidth: 2,
              scale: 2,
              activeDotColor: Colors.blue,
              dotColor: Colors.lightBlue.shade200,
            )),
      ),
    ]);
  }
}
