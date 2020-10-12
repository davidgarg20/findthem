class Mark {
  int id;
  double latitude;
  double longitude;

  Mark(this.id, this.latitude, this.longitude);

  Map<String, dynamic> toMap() {
    return {'id': id, 'latitude': latitude, 'longitude': longitude};
  }
}
