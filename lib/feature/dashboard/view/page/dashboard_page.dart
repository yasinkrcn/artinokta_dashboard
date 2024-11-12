import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tv_artinokta/core/init/injection_container.dart';
import 'package:tv_artinokta/core/shared/app_widget_state_builder.dart';
import 'package:tv_artinokta/feature/dashboard/provider/dashboard_provider.dart';
import 'package:tv_artinokta/feature/dashboard/utils/dto/dashboard_dto.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500), // Süreyi artırdım
    )..forward();

    sl<DashboardProvider>().initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: Colors.grey[100],
          body: AppWidgetBuilderByState(
            response: provider.dashboardData,
            builder: (dashboard) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // SlideTransition(
                      //   position: Tween<Offset>(
                      //     begin: const Offset(0, -0.5),
                      //     end: Offset.zero,
                      //   ).animate(CurvedAnimation(
                      //     parent: _controller,
                      //     curve: Curves.easeOutBack,
                      //   )),
                      //   child: Container(
                      //     padding: const EdgeInsets.symmetric(
                      //       horizontal: 20,
                      //       vertical: 10,
                      //     ),
                      //     decoration: BoxDecoration(
                      //       color: Colors.blue[600],
                      //       borderRadius: BorderRadius.circular(16),
                      //       boxShadow: [
                      //         BoxShadow(
                      //           color: Colors.blue.withOpacity(0.3),
                      //           blurRadius: 10,
                      //           offset: const Offset(0, 4),
                      //         ),
                      //       ],
                      //     ),
                      //     child: Text(
                      //       'ArtıNokta',
                      //       style: GoogleFonts.poppins(
                      //         fontSize: 32,
                      //         fontWeight: FontWeight.bold,
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  _buildAnimatedCard(
                                    flex: 3,
                                    delay: 0.2,
                                    child: _buildInfoCard(
                                      title: 'Müşteri Sayısı',
                                      value: dashboard.customers.total.toString(),
                                      icon: Icons.people,
                                      gradient: [Colors.blue[400]!, Colors.blue[600]!],
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  _buildAnimatedCard(
                                    flex: 5,
                                    delay: 0.6,
                                    child: _buildChartCard(provider.lastSalesList.data),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                children: [
                                  _buildAnimatedCard(
                                    flex: 10,
                                    delay: 0.4,
                                    child: _buildSalesCard(provider.dashboardData.data.dailySales),
                                  ),
                                  const SizedBox(height: 16),
                                  _buildAnimatedCard(
                                    flex: 7,
                                    delay: 0.8,
                                    child: _buildInfoCard(
                                      title: 'Günlük İkmal Sayısı',
                                      value: provider.dashboardData.data.supplyCount.toString(),
                                      icon: Icons.local_shipping,
                                      gradient: [Colors.green[400]!, Colors.green[600]!],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildAnimatedCard({
    required double delay,
    required Widget child,
    int? flex,
  }) {
    return Expanded(
      flex: flex ?? 1,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.5),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: _controller,
          // Burayı düzelttim - delay + 0.4 toplamı 1'i geçmemeli
          curve: Interval(
            delay,
            min(delay + 0.4, 1.0), // 1'i geçmemesini sağlıyoruz
            curve: Curves.easeOutBack,
          ),
        )),
        child: FadeTransition(
          opacity: Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
            parent: _controller,
            // Burayı da düzelttim
            curve: Interval(delay, min(delay + 0.4, 1.0)),
          )),
          child: child,
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required String value,
    required IconData icon,
    required List<Color> gradient,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: gradient[0].withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 32),
              const SizedBox(width: 12),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const Spacer(),
          TweenAnimationBuilder<int>(
            tween: IntTween(begin: 0, end: int.parse(value)),
            duration: const Duration(seconds: 2),
            builder: (context, value, child) {
              return Text(
                value.toString(),
                style: GoogleFonts.poppins(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              );
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildSalesCard(SalesData saleDate) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orange[400]!, Colors.deepOrange[600]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.local_gas_station,
                color: Colors.white,
                size: 32,
              ),
              const SizedBox(width: 12),
              Text(
                'Günlük Satış',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildAnimatedValue(
                label: 'Litre',
                value: saleDate.liters,
                suffix: ' LT',
              ),
              Container(
                width: 2,
                height: 60,
                color: Colors.white24,
              ),
              _buildAnimatedValue(
                label: 'TL',
                value: saleDate.amount,
                suffix: ' ₺',
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildAnimatedValue({
    required String label,
    required int value,
    required String suffix,
  }) {
    return Column(
      children: [
        TweenAnimationBuilder<int>(
          tween: IntTween(begin: 0, end: value),
          duration: const Duration(seconds: 2),
          builder: (context, value, child) {
            return Text(
              NumberFormat('#,###').format(value) + suffix,
              style: GoogleFonts.poppins(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            );
          },
        ),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }

  Widget _buildChartCard(List<ChartData> lastSalesList) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Son 5 Günlük Satış (LT)',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SfCartesianChart(
              margin: const EdgeInsets.all(0),
              plotAreaBorderWidth: 0,
              primaryXAxis: CategoryAxis(
                majorGridLines: const MajorGridLines(width: 0),
                labelStyle: TextStyle(color: Colors.grey[600]),
                axisLine: AxisLine(width: 1, color: Colors.grey[300]),
              ),
              primaryYAxis: NumericAxis(
                minimum: 0,
                maximum: 12000,
                interval: 2000,
                majorGridLines: MajorGridLines(
                  width: 1,
                  color: Colors.grey[300],
                  dashArray: [5, 5],
                ),
                labelStyle: TextStyle(color: Colors.grey[600]),
                axisLine: const AxisLine(width: 0),
                numberFormat: NumberFormat('#,###'),
              ),
              series: <CartesianSeries>[
                SplineAreaSeries<ChartData, String>(
                  dataSource: lastSalesList,
                  xValueMapper: (ChartData sales, _) => DateFormat('d MMM', 'tr_TR').format(sales.date),
                  yValueMapper: (ChartData sales, _) => sales.liters,
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue[400]!.withOpacity(0.4),
                      Colors.blue[400]!.withOpacity(0.1),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderColor: Colors.blue[400]!,
                  borderWidth: 3,
                  markerSettings: const MarkerSettings(
                    isVisible: true,
                    height: 8,
                    width: 8,
                    shape: DataMarkerType.circle,
                  ),
                  dataLabelSettings: DataLabelSettings(
                    isVisible: true,
                    textStyle: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
