// ignore_for_file: must_call_super, must_be_immutable

import 'package:flutter/material.dart';
import 'package:splashpay/app/data/colors.dart';
import 'package:splashpay/app/models/graph.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class CustomGraphBar extends StatefulWidget {
  int index;
  CustomGraphBar({Key? key, required this.index}) : super(key: key);

  @override
  State<CustomGraphBar> createState() => _CustomGraphBarState();
}

class _CustomGraphBarState extends State<CustomGraphBar> {
  late TrackballBehavior trackballBehavior;

  @override
  void initState() {
    trackballBehavior = TrackballBehavior(
        lineType: TrackballLineType.horizontal,
        tooltipSettings: InteractiveTooltip(
          format: 'point.x : point.y',
          // color: CustomColors.kContainerColor,
          // textStyle: widget.isMobileView == true
          //     ? CustomTextStyle.kMedium10.copyWith(
          //         color: CustomColors.kBlackColor,
          //         fontSize: 50.sp,
          //         fontWeight: FontWeight.w600,
          //       )
          //     : CustomTextStyle.kMedium10.copyWith(
          //         color: CustomColors.kBlackColor,
          //         fontSize: 16.sp,
          //         fontWeight: FontWeight.w600,
          //       ),
        ),
        lineWidth: 2,
        enable: true,
        activationMode: ActivationMode.singleTap);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.index == 0) {
      return SfCartesianChart(
          borderWidth: 0,
          plotAreaBorderWidth: 0,
          trackballBehavior: trackballBehavior,
          primaryXAxis: CategoryAxis(
            rangePadding: ChartRangePadding.auto,
            majorGridLines: const MajorGridLines(width: 0),
            majorTickLines: const MajorTickLines(width: 0),
            minorGridLines: const MinorGridLines(width: 0),
            minorTickLines: const MinorTickLines(width: 0),
            axisLine: AxisLine(
                width: 1, dashArray: [4, 6], color: CustomColors.kBoderColor),
            // labelStyle: CustomTextStyle.kMedium10.copyWith(fontSize: 35.sp),
          ),
          primaryYAxis: NumericAxis(
            labelFormat: '{value}',
            // labelStyle: CustomTextStyle.kMedium10.copyWith(fontSize: 35.sp),

            maximum: 1000,

            rangePadding: ChartRangePadding.auto,
            majorGridLines: const MajorGridLines(width: 0),
            majorTickLines: const MajorTickLines(width: 0),
            minorGridLines: const MinorGridLines(width: 0),
            minorTickLines: const MinorTickLines(width: 0),
            axisLine: AxisLine(
                width: 1, dashArray: [4, 6], color: CustomColors.kBoderColor),
          ),
          series: <ChartSeries>[
            SplineSeries<GraphData, String>(
              color: CustomColors.kDarkBlue,
              splineType: SplineType.natural,
              cardinalSplineTension: 3.8,
              // Bind data source
              dataSource: myGraphList,
              xValueMapper: (GraphData graph, _) => graph.month,
              yValueMapper: (GraphData graph, _) => graph.sales,
            ),
            SplineSeries<GraphData, String>(
              color: CustomColors.kSamiOrange,
              splineType: SplineType.natural,
              cardinalSplineTension: 3.8,
              // Bind data source
              dataSource: myGraphList2,
              xValueMapper: (GraphData graph, _) => graph.month,
              yValueMapper: (GraphData graph, _) => graph.sales,
            )
          ]);
    } else {
      return SfCartesianChart(
          borderWidth: 0,
          plotAreaBorderWidth: 0,
          trackballBehavior: trackballBehavior,
          primaryXAxis: CategoryAxis(
            rangePadding: ChartRangePadding.auto,
            majorGridLines: const MajorGridLines(width: 0),
            majorTickLines: const MajorTickLines(width: 0),
            minorGridLines: const MinorGridLines(width: 0),
            minorTickLines: const MinorTickLines(width: 0),
            axisLine: AxisLine(
                width: 1, dashArray: [4, 6], color: CustomColors.kBoderColor),
            // labelStyle: CustomTextStyle.kMedium10.copyWith(fontSize: 35.sp),
          ),
          primaryYAxis: NumericAxis(
            labelFormat: '{value}',
            // labelStyle: CustomTextStyle.kMedium10.copyWith(fontSize: 35.sp),

            maximum: 1000,

            rangePadding: ChartRangePadding.auto,
            majorGridLines: const MajorGridLines(width: 0),
            majorTickLines: const MajorTickLines(width: 0),
            minorGridLines: const MinorGridLines(width: 0),
            minorTickLines: const MinorTickLines(width: 0),
            axisLine: AxisLine(
                width: 1, dashArray: [4, 6], color: CustomColors.kBoderColor),
          ),
          series: <ChartSeries>[
            SplineSeries<GraphData, String>(
              color: CustomColors.kDarkBlue,
              splineType: SplineType.natural,
              cardinalSplineTension: 3.8,
              // Bind data source
              dataSource: myGraphList2Data1,
              xValueMapper: (GraphData graph, _) => graph.month,
              yValueMapper: (GraphData graph, _) => graph.sales,
            ),
            SplineSeries<GraphData, String>(
              color: CustomColors.kSamiOrange,
              splineType: SplineType.natural,
              cardinalSplineTension: 3.8,
              // Bind data source
              dataSource: myGraphList2Data2,
              xValueMapper: (GraphData graph, _) => graph.month,
              yValueMapper: (GraphData graph, _) => graph.sales,
            )
          ]);
    }
  }
}
