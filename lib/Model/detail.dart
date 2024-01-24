class Details {
  String Name;
  var Detail;
  var Images;
  var Yers;
  var Type;

  Details(
      {required this.Name,
      required this.Detail,
      required this.Images,
      required this.Type,
      required this.Yers});

  factory Details.fromjson({required Map data}) {
    return Details(
        Name: data['Name'],
        Detail: data['Detail'],
        Images: data['Images'],
        Type: data['type'],
        Yers: data['Yers']);
  }
}
