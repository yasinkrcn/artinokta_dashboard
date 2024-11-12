import 'package:provider/provider.dart';
import 'package:tv_artinokta/core/init/injection_container.dart';
import 'package:tv_artinokta/core/utils/base_controller.dart';
import 'package:tv_artinokta/feature/dashboard/provider/dashboard_provider.dart';

class AppProviders {
  static final List<ChangeNotifierProvider> providers = [
    ChangeNotifierProvider<BaseController>(create: (context) => sl()),
    ChangeNotifierProvider<DashboardProvider>(create: (context) => sl()),
  ];
}
