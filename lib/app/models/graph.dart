class GraphData {
  GraphData(this.month, this.sales);
  final String month;
  final int sales;
}

List<GraphData> myGraphList = [
  GraphData('Mon', 100),
  GraphData('Tue', 120),
  GraphData('Wed', 20),
  GraphData('Thu', 520),
  GraphData('Fri', 24),
  GraphData('Sat', 520),
  GraphData('Sun', 100),
];

List<GraphData> myGraphList2 = [
  GraphData('Mon', 130),
  GraphData('Tue', 490),
  GraphData('Wed', 200),
  GraphData('Thu', 230),
  GraphData('Fri', 80),
  GraphData('Sat', 500),
  GraphData('Sun', 200),
];


List<GraphData> myGraphList2Data1 = [
  GraphData('Mon', 45),
  GraphData('Tue', 200),
  GraphData('Wed', 20),
  GraphData('Thu', 500),
  GraphData('Fri', 24),
  GraphData('Sat', 520),
  GraphData('Sun', 45),
];

List<GraphData> myGraphList2Data2 = [
  GraphData('Mon', 400),
  GraphData('Tue', 566),
  GraphData('Wed', 200),
  GraphData('Thu', 500),
  GraphData('Fri', 80),
  GraphData('Sat', 500),
  GraphData('Sun', 100),
];
