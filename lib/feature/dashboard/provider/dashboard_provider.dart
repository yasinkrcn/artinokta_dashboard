import 'package:tv_artinokta/core/error/failure.dart';
import 'package:tv_artinokta/core/utils/base_controller.dart';
import 'package:tv_artinokta/core/utils/ui_state.dart';
import 'package:tv_artinokta/feature/dashboard/utils/dto/dashboard_dto.dart';
import 'dart:async'; // Timer için ekleyin

class DashboardProvider extends BaseController {
  UIState<DashboardData> dashboardData = UIState.idle();
  UIState<List<ChartData>> lastSalesList = UIState.idle();

  void initialize() {
    // İlk veriyi al
    getDashboardData();
    // 10 saniyelik timer'ı başlat
    _startAutoRefresh();
  }

  void _startAutoRefresh() {
    // Her 10 saniyede bir çalışacak timer
    Timer.periodic(
      const Duration(seconds: 5),
      (_) => getDashboardData(),
    );
  }

  Future<void> getDashboardData() async {
    dashboardData = UIState.loading();
    refresh();

    final either = await DashboardData.getDashboardData();

    either.fold(
      (failure) {
        dashboardData = UIState.error(
          CustomFailure(errorText: "Bir hata oluştu."),
        );
        refresh();
      },
      (data) {
        dashboardData = UIState.success(data.data!);
        lastSalesList = UIState.success(data.data!.chartData);
        refresh();
      },
    );
  }
}
