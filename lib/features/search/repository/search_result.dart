class Bus {
  int companyId;
  int provCompId;
  int provId;
  String displayBusType;
  DateTime arrTime;
  DateTime deptTime;
  BusStatus busStatus;
  String duration;
  String companyName;

  Bus({
    required this.companyId,
    required this.provCompId,
    required this.provId,
    required this.displayBusType,
    required this.arrTime,
    required this.deptTime,
    required this.busStatus,
    required this.duration,
    required this.companyName,
  });

  factory Bus.fromJson(Map<String, dynamic> json) {
    final DateTime arrTime = DateTime.parse(json['ArrTime']);
    final DateTime deptTime = DateTime.parse(json['DeptTime']);
    return Bus(
      companyId: json['CompanyId'],
      provCompId: json['ProvCompId'],
      provId: json['ProvId'],
      displayBusType: json['DisplayBusType'],
      arrTime: arrTime,
      deptTime:deptTime,
      busStatus: BusStatus.fromJson(json['BusStatus']),
      duration: json['Duration'],
      companyName: json['CompanyName'],
    );
  }
}

class BusStatus {
  int availability;
  int routeBusId;
  List<int> baseFares;
  List<int> discFares;
  List<int> cancFares;
  double totalTax;

  BusStatus({
    required this.availability,
    required this.routeBusId,
    required this.baseFares,
    required this.discFares,
    required this.cancFares,
    required this.totalTax,
  });

  factory BusStatus.fromJson(Map<String, dynamic> json) {
    return BusStatus(
      availability: json['Availability'],
      routeBusId: json['RouteBusId'],
      baseFares: List<int>.from(json['BaseFares']),
      discFares: List<int>.from(json['DiscFares']),
      cancFares: List<int>.from(json['CancFares']),
      totalTax: json['TotalTax'],
    );
  }
}
