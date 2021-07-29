import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imob/core/entities/view_pager_item_entity.dart';

class InfoViewModel extends ChangeNotifier {
  List<ViewPagerItemEntity> viewPagerItems = [
    ViewPagerItemEntity(
      title: 'Cadastre seu espaço',
      text:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean quis lorem in tellus auctor auctor. Aenean vitae diam maximus, volutpat eros quis, feugiat ex. Quisque ipsum turpis, tincidunt eu rutrum sed, iaculis ac enim. Maecenas pretium auctor pretium. Quisque ac nibh a erat sodales pretium a mollis magna. Nulla et lacinia leo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Vestibulum et aliquam tellus. Nam lacinia lorem ut tortor tristique lobortis. Suspendisse at egestas diam, eu venenatis ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer imperdiet congue eros, a ornare metus blandit eget. Nulla facilisi. Interdum et malesuada fames ac ante ipsum primis in faucibus.',
      imgPath: '/img_cadastre_espaco.png',
    ),
    ViewPagerItemEntity(
      title: 'Receba respostas',
      text:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean quis lorem in tellus auctor auctor. Aenean vitae diam maximus, volutpat eros quis, feugiat ex. Quisque ipsum turpis, tincidunt eu rutrum sed, iaculis ac enim. Maecenas pretium auctor pretium. Quisque ac nibh a erat sodales pretium a mollis magna. Nulla et lacinia leo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Vestibulum et aliquam tellus. Nam lacinia lorem ut tortor tristique lobortis. Suspendisse at egestas diam, eu venenatis ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer imperdiet congue eros, a ornare metus blandit eget. Nulla facilisi. Interdum et malesuada fames ac ante ipsum primis in faucibus.',
      imgPath: '/img_receba_respostas.png',
    ),
    ViewPagerItemEntity(
      title: 'Feche contrato de locação',
      text:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean quis lorem in tellus auctor auctor. Aenean vitae diam maximus, volutpat eros quis, feugiat ex. Quisque ipsum turpis, tincidunt eu rutrum sed, iaculis ac enim. Maecenas pretium auctor pretium. Quisque ac nibh a erat sodales pretium a mollis magna. Nulla et lacinia leo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Vestibulum et aliquam tellus. Nam lacinia lorem ut tortor tristique lobortis. Suspendisse at egestas diam, eu venenatis ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer imperdiet congue eros, a ornare metus blandit eget. Nulla facilisi. Interdum et malesuada fames ac ante ipsum primis in faucibus.',
      imgPath: '/img_feche_contrato.png',
    ),
    ViewPagerItemEntity(
      title: 'Receba o aluguel',
      text:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean quis lorem in tellus auctor auctor. Aenean vitae diam maximus, volutpat eros quis, feugiat ex. Quisque ipsum turpis, tincidunt eu rutrum sed, iaculis ac enim. Maecenas pretium auctor pretium. Quisque ac nibh a erat sodales pretium a mollis magna. Nulla et lacinia leo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Vestibulum et aliquam tellus. Nam lacinia lorem ut tortor tristique lobortis. Suspendisse at egestas diam, eu venenatis ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer imperdiet congue eros, a ornare metus blandit eget. Nulla facilisi. Interdum et malesuada fames ac ante ipsum primis in faucibus.',
      imgPath: '/img_receba_aluguel.png',
    ),
  ];

  // String footerText = 'footer text';
  final controller = PageController(viewportFraction: 1);
  int? viewPagerIndex;

  bool loading = false;

  setLoading(isLoading) {
    loading = isLoading;

    // notifyListeners();
  }

  setViewPagerIndex(index) {
    viewPagerIndex = index;

    notifyListeners();
  }

  bool nextPage() {
    if (viewPagerIndex != 3) {
      controller.nextPage(
          duration: Duration(milliseconds: 1000), curve: Curves.ease);
      return true;
    } else
      return false;
  }

  String getButtonText() {
    if (viewPagerIndex != 3)
      return "Próximo...";
    else
      return "Começar";
  }

  Color getButtonColor() {
    if (viewPagerIndex != 3)
      return Color(0xFF7CDFB8);
    else
      return Color(0xFFFCD553);
  }

  String getExemploTitle({int? index}) {
    switch (index) {
      case 0:
        return 'Cadastre seu espaço';
      case 0:
        return 'Receba respostas';
      case 0:
        return 'Feche contrato de locação';
      case 0:
        return 'Receba o aluguel';
      default:
        return '';
    }
  }

  String getExemploText({int? index}) {
    switch (index) {
      case 0:
        return 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean quis lorem in tellus auctor auctor. Aenean vitae diam maximus, volutpat eros quis, feugiat ex. Quisque ipsum turpis, tincidunt eu rutrum sed, iaculis ac enim. Maecenas pretium auctor pretium. Quisque ac nibh a erat sodales pretium a mollis magna. Nulla et lacinia leo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Vestibulum et aliquam tellus. Nam lacinia lorem ut tortor tristique lobortis. Suspendisse at egestas diam, eu venenatis ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer imperdiet congue eros, a ornare metus blandit eget. Nulla facilisi. Interdum et malesuada fames ac ante ipsum primis in faucibus.';
      case 0:
        return 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean quis lorem in tellus auctor auctor. Aenean vitae diam maximus, volutpat eros quis, feugiat ex. Quisque ipsum turpis, tincidunt eu rutrum sed, iaculis ac enim. Maecenas pretium auctor pretium. Quisque ac nibh a erat sodales pretium a mollis magna. Nulla et lacinia leo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Vestibulum et aliquam tellus. Nam lacinia lorem ut tortor tristique lobortis. Suspendisse at egestas diam, eu venenatis ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer imperdiet congue eros, a ornare metus blandit eget. Nulla facilisi. Interdum et malesuada fames ac ante ipsum primis in faucibus.';
      case 0:
        return 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean quis lorem in tellus auctor auctor. Aenean vitae diam maximus, volutpat eros quis, feugiat ex. Quisque ipsum turpis, tincidunt eu rutrum sed, iaculis ac enim. Maecenas pretium auctor pretium. Quisque ac nibh a erat sodales pretium a mollis magna. Nulla et lacinia leo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Vestibulum et aliquam tellus. Nam lacinia lorem ut tortor tristique lobortis. Suspendisse at egestas diam, eu venenatis ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer imperdiet congue eros, a ornare metus blandit eget. Nulla facilisi. Interdum et malesuada fames ac ante ipsum primis in faucibus.';
      case 0:
        return 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean quis lorem in tellus auctor auctor. Aenean vitae diam maximus, volutpat eros quis, feugiat ex. Quisque ipsum turpis, tincidunt eu rutrum sed, iaculis ac enim. Maecenas pretium auctor pretium. Quisque ac nibh a erat sodales pretium a mollis magna. Nulla et lacinia leo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Vestibulum et aliquam tellus. Nam lacinia lorem ut tortor tristique lobortis. Suspendisse at egestas diam, eu venenatis ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer imperdiet congue eros, a ornare metus blandit eget. Nulla facilisi. Interdum et malesuada fames ac ante ipsum primis in faucibus.';
      default:
        return '';
    }
  }
}
