import './utils.dart';

// extension AdaptiveUIExt on double {
//   //Whenever you use height then use this method like this => [20.0.h]
//   double get h => AdaptiveUI.h(this);
//
//   //Whenever you use width then use this method like this => [10.0.h]
//   double get w => AdaptiveUI.w(this);
//
//   //Whenever you use text size then use this method like this => [5.0.sp]
//   double get sp => AdaptiveUI.sp(this);
// }

extension AdaptiveUIExt on dynamic {
  //Whenever you use height then use this method like this => [20.0.h]
  double get h => AdaptiveUI.h(this);

  //Whenever you use width then use this method like this => [10.0.h]
  double get w => AdaptiveUI.w(this);

  //Whenever you use text size then use this method like this => [5.0.sp]
  double get sp => AdaptiveUI.sp(this);
}
