import 'package:flutter/material.dart';
import 'package:imob_design_system/colors/colors.dart';
import 'package:imob_design_system/models/imob_options_list_item.dart';
import 'package:imob_design_system/extensions/imob_text_extension.dart';

class ImobOptionsList extends StatelessWidget {
  const ImobOptionsList(
      {Key? key, required this.items, this.title, this.titleColor})
      : super(key: key);

  final List<ImobOptionsListItem> items;
  final String? title;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return _body(context);
  }

  _body(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              if (title != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: Text(title!).toAppBarH1(
                    style: TextStyle(color: titleColor),
                  ),
                ),
            ],
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (_, index) {
              return _listItem(
                context,
                items[index],
                index == items.length - 1,
              );
            },
          )
        ]))
      ],
    );
  }

  _listItem(BuildContext context, ImobOptionsListItem item, bool isLastItem) {
    return Column(
      children: [
        const Divider(thickness: 2),
        ItemWidget(
          context: context,
          item: item,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
                  child: Text(
                    item.title,
                    style: const TextStyle(color: ImobColors.textColor),
                  ),
                ),
              ),
              if (item.pageToOpen != null)
                const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.navigate_next,
                    color: ImobColors.darkGray,
                  ),
                ),
            ],
          ),
        ),
        if (isLastItem) const Divider(thickness: 2),
      ],
    );
  }

  Widget ItemWidget(
      {required ImobOptionsListItem item,
      required Widget child,
      required BuildContext context}) {
    return item.pageToOpen == null
        ? child
        : Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => item.pageToOpen!,
                ),
              ),
              child: child,
            ),
          );
  }
}
