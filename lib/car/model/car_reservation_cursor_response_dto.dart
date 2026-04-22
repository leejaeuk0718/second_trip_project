import 'car_rental_reservation_dto.dart';

class CarReservationCursorResponseDTO {
  final List<CarRentalReservationDTO> reservation;
  final bool hasNext;
  final int? nextCursorStatusOrder;
  final String? nextCursorStartDate;
  final int? nextCursorId;

  CarReservationCursorResponseDTO({
    required this.reservation,
    required this.hasNext,
    this.nextCursorStatusOrder,
    this.nextCursorStartDate,
    this.nextCursorId,
  });

  factory CarReservationCursorResponseDTO.fromJson(Map<String, dynamic> json) {
    return CarReservationCursorResponseDTO(
      reservation: (json['reservation'] as List)
          .map((e) => CarRentalReservationDTO.fromJson(e))
          .toList(),
      hasNext: json['hasNext'],
      nextCursorStatusOrder: json['nextCursorStatusOrder'] as int?,
      nextCursorStartDate: json['nextCursorStartDate'] as String?,
      nextCursorId: json['nextCursorId'] as int?,
    );
  }
}