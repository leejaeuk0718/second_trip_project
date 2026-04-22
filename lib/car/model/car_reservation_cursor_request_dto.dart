class CarReservationCursorRequestDTO {
  final int? cursorStatusOrder;
  final String? cursorStartDate;
  final int? cursorId;
  final int size;

  const CarReservationCursorRequestDTO({
    this.cursorStatusOrder,
    this.cursorStartDate,
    this.cursorId,
    this.size = 10,
  });

  Map<String, dynamic> toQueryParameters() {
    return {
      if (cursorStatusOrder != null) 'cursorStatusOrder': cursorStatusOrder,
      if (cursorStartDate != null) 'cursorStartDate': cursorStartDate,
      if (cursorId != null) 'cursorId': cursorId,
      'size': size,
    };
  }
}