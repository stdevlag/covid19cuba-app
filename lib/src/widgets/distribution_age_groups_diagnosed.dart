import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/utils/utils.dart';

class DistributionAgeGroupsDiagnosedWidget extends StatelessWidget {
  final DataModel data;

  const DistributionAgeGroupsDiagnosedWidget({this.data})
      : assert(data != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Center(
            child: Text(
              'Distribución por rangos etarios de los casos diagnosticados',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Constants.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          height: 250,
          child: charts.BarChart(
            [
              charts.Series<int, String>(
                id: 'Diagnosticados',
                colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
                domainFn: (_, i) => data.ageGroupsNames[i],
                measureFn: (item, _) => item,
                data: data.ageGroups,
              ),
            ],
            defaultInteractions: true,
            behaviors: [
              charts.ChartTitle(
                'Rango',
                behaviorPosition: charts.BehaviorPosition.bottom,
                titleStyleSpec: charts.TextStyleSpec(fontSize: 11),
                titleOutsideJustification:
                charts.OutsideJustification.middleDrawArea,
              ),
              charts.ChartTitle(
                'Casos',
                behaviorPosition: charts.BehaviorPosition.start,
                titleStyleSpec: charts.TextStyleSpec(fontSize: 11),
                titleOutsideJustification:
                charts.OutsideJustification.middleDrawArea,
              ),
              charts.LinePointHighlighter(
                showHorizontalFollowLine:
                charts.LinePointHighlighterFollowLineType.all,
                showVerticalFollowLine:
                charts.LinePointHighlighterFollowLineType.nearest,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
