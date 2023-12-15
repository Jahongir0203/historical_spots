class PlacesDetailModel {
  String? xid;
  String? name;
  Address? address;
  String? rate;
  String? wikidata;
  String? kinds;
  Sources? sources;
  String? otm;
  String? wikipedia;
  String? image;
  Preview? preview;
  WikipediaExtracts? wikipediaExtracts;
  Point? point;

  PlacesDetailModel(
      {this.xid,
        this.name,
        this.address,
        this.rate,
        this.wikidata,
        this.kinds,
        this.sources,
        this.otm,
        this.wikipedia,
        this.image,
        this.preview,
        this.wikipediaExtracts,
        this.point});

  PlacesDetailModel.fromJson(Map<String, dynamic> json) {
    xid = json['xid'];
    name = json['name'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    rate = json['rate'];
    wikidata = json['wikidata'];
    kinds = json['kinds'];
    sources =
    json['sources'] != null ? new Sources.fromJson(json['sources']) : null;
    otm = json['otm'];
    wikipedia = json['wikipedia'];
    image = json['image'];
    preview =
    json['preview'] != null ? new Preview.fromJson(json['preview']) : null;
    wikipediaExtracts = json['wikipedia_extracts'] != null
        ? new WikipediaExtracts.fromJson(json['wikipedia_extracts'])
        : null;
    point = json['point'] != null ? new Point.fromJson(json['point']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['xid'] = this.xid;
    data['name'] = this.name;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['rate'] = this.rate;
    data['wikidata'] = this.wikidata;
    data['kinds'] = this.kinds;
    if (this.sources != null) {
      data['sources'] = this.sources!.toJson();
    }
    data['otm'] = this.otm;
    data['wikipedia'] = this.wikipedia;
    data['image'] = this.image;
    if (this.preview != null) {
      data['preview'] = this.preview!.toJson();
    }
    if (this.wikipediaExtracts != null) {
      data['wikipedia_extracts'] = this.wikipediaExtracts!.toJson();
    }
    if (this.point != null) {
      data['point'] = this.point!.toJson();
    }
    return data;
  }
}

class Address {
  String? city;
  String? state;
  String? country;
  String? postcode;
  String? countryCode;

  Address(
      {this.city, this.state, this.country, this.postcode, this.countryCode});

  Address.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    state = json['state'];
    country = json['country'];
    postcode = json['postcode'];
    countryCode = json['country_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['postcode'] = this.postcode;
    data['country_code'] = this.countryCode;
    return data;
  }
}

class Sources {
  String? geometry;
  List<String>? attributes;

  Sources({this.geometry, this.attributes});

  Sources.fromJson(Map<String, dynamic> json) {
    geometry = json['geometry'];
    attributes = json['attributes'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['geometry'] = this.geometry;
    data['attributes'] = this.attributes;
    return data;
  }
}

class Preview {
  String? source;
  int? height;
  int? width;

  Preview({this.source, this.height, this.width});

  Preview.fromJson(Map<String, dynamic> json) {
    source = json['source'];
    height = json['height'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['source'] = this.source;
    data['height'] = this.height;
    data['width'] = this.width;
    return data;
  }
}

class WikipediaExtracts {
  String? title;
  String? text;
  String? html;

  WikipediaExtracts({this.title, this.text, this.html});

  WikipediaExtracts.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    text = json['text'];
    html = json['html'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['text'] = this.text;
    data['html'] = this.html;
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
