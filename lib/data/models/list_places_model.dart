class PlacesListModel {
  String? xid;
  String? name;
  int? rate;
  String? osm;
  String? wikidata;
  String? kinds;
  Point? point;

  PlacesListModel(
      {this.xid,
        this.name,
        this.rate,
        this.osm,
        this.wikidata,
        this.kinds,
        this.point});

  PlacesListModel.fromJson(Map<String, dynamic> json) {
    xid = json['xid'];
    name = json['name'];
    rate = json['rate'];
    osm = json['osm'];
    wikidata = json['wikidata'];
    kinds = json['kinds'];
    point = json['point'] != null ? new Point.fromJson(json['point']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['xid'] = this.xid;
    data['name'] = this.name;
    data['rate'] = this.rate;
    data['osm'] = this.osm;
    data['wikidata'] = this.wikidata;
    data['kinds'] = this.kinds;
    if (this.point != null) {
      data['point'] = this.point!.toJson();
    }
    return data;
  }
}

class Point {
  double? lon;
  double? lat;

  Point({this.lon, this.lat});

  Point.fromJson(Map<String, dynamic> json) {
    lon = json['lon'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lon'] = this.lon;
    data['lat'] = this.lat;
    return data;
  }
}