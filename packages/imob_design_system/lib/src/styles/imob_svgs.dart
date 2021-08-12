// ignore_for_file: non_constant_identifier_names
// ignore: avoid_classes_with_only_static_members
/// ### IMPORTANTE! ❗
/// Importe os assets no pubspec.yaml
///
/// Exemplo:
///```yaml
///flutter:
///  uses-material-design: true
///  assets:
///    - packages/imob_design_system/assets/svgs/logo/logo_imob_telecom.svg
///```
///
/// ### Utilizando
/// No exemplo utilizaremos o package flutter_svg
/// Exemplo:
///```dart
///SvgPicture.asset(
///  ImobSvgs.logo_imob_telecom,
///  package: ImobSvgs.package,
///  fit: BoxFit.fitWidth,
///)
///```
class ImobSvgs {
  static const _pathToFile = 'assets/svgs';
  static const String package = 'imob_design_system';

  static String logo_imob_telecom = '$_pathToFile/logo/logo_imob_telecom.svg';
}
