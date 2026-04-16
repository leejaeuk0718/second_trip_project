class RentalModel {
  final int id;
  final int carId;
  final String carName;
  final String startDate;
  final String endDate;
  final int totalPrice;
  final String status;

  RentalModel({
    required this.id,
    required this.carId,
    required this.carName,
    required this.startDate,
    required this.endDate,
    required this.totalPrice,
    required this.status,
  });

  factory RentalModel.fromJson(Map<String, dynamic> json) {
    return RentalModel(
      id: json['id'],
      carId: json['carId'],
      carName: json['carName'] ?? '',
      startDate: json['startDate'],
      endDate: json['endDate'],
      totalPrice: json['totalPrice'] ?? 0,
      status: json['status'],
    );
  }
}