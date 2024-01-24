class Details {
  String Name;
  String Detail;
  String Images;

  Details({required this.Name, required this.Detail, required this.Images});

  factory Details.fromjson({required Map data}) {
    return Details(
        Name: data['Name'], Detail: data['Detail'], Images: data['Images']);
  }
}
