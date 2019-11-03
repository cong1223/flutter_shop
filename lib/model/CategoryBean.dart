class CategoryBean {
  String _code;
  String _message;
  List<Data> _data;

  CategoryBean({String code, String message, List<Data> data}) {
    this._code = code;
    this._message = message;
    this._data = data;
  }

  String get code => _code;
  set code(String code) => _code = code;
  String get message => _message;
  set message(String message) => _message = message;
  List<Data> get data => _data;
  set data(List<Data> data) => _data = data;

  CategoryBean.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = new List<Data>();
      json['data'].forEach((v) {
        _data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this._code;
    data['message'] = this._message;
    if (this._data != null) {
      data['data'] = this._data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String _mallCategoryId;
  String _mallCategoryName;
  List<BxMallSubDto> _bxMallSubDto;
  Null _comments;
  String _image;

  Data(
      {String mallCategoryId,
      String mallCategoryName,
      List<BxMallSubDto> bxMallSubDto,
      Null comments,
      String image}) {
    this._mallCategoryId = mallCategoryId;
    this._mallCategoryName = mallCategoryName;
    this._bxMallSubDto = bxMallSubDto;
    this._comments = comments;
    this._image = image;
  }

  String get mallCategoryId => _mallCategoryId;
  set mallCategoryId(String mallCategoryId) => _mallCategoryId = mallCategoryId;
  String get mallCategoryName => _mallCategoryName;
  set mallCategoryName(String mallCategoryName) =>
      _mallCategoryName = mallCategoryName;
  List<BxMallSubDto> get bxMallSubDto => _bxMallSubDto;
  set bxMallSubDto(List<BxMallSubDto> bxMallSubDto) =>
      _bxMallSubDto = bxMallSubDto;
  Null get comments => _comments;
  set comments(Null comments) => _comments = comments;
  String get image => _image;
  set image(String image) => _image = image;

  Data.fromJson(Map<String, dynamic> json) {
    _mallCategoryId = json['mallCategoryId'];
    _mallCategoryName = json['mallCategoryName'];
    if (json['bxMallSubDto'] != null) {
      _bxMallSubDto = new List<BxMallSubDto>();
      json['bxMallSubDto'].forEach((v) {
        _bxMallSubDto.add(new BxMallSubDto.fromJson(v));
      });
    }
    _comments = json['comments'];
    _image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mallCategoryId'] = this._mallCategoryId;
    data['mallCategoryName'] = this._mallCategoryName;
    if (this._bxMallSubDto != null) {
      data['bxMallSubDto'] = this._bxMallSubDto.map((v) => v.toJson()).toList();
    }
    data['comments'] = this._comments;
    data['image'] = this._image;
    return data;
  }
}

class BxMallSubDto {
  String _mallSubId;
  String _mallCategoryId;
  String _mallSubName;
  String _comments;

  BxMallSubDto(
      {String mallSubId,
      String mallCategoryId,
      String mallSubName,
      String comments}) {
    this._mallSubId = mallSubId;
    this._mallCategoryId = mallCategoryId;
    this._mallSubName = mallSubName;
    this._comments = comments;
  }

  String get mallSubId => _mallSubId;
  set mallSubId(String mallSubId) => _mallSubId = mallSubId;
  String get mallCategoryId => _mallCategoryId;
  set mallCategoryId(String mallCategoryId) => _mallCategoryId = mallCategoryId;
  String get mallSubName => _mallSubName;
  set mallSubName(String mallSubName) => _mallSubName = mallSubName;
  String get comments => _comments;
  set comments(String comments) => _comments = comments;

  BxMallSubDto.fromJson(Map<String, dynamic> json) {
    _mallSubId = json['mallSubId'];
    _mallCategoryId = json['mallCategoryId'];
    _mallSubName = json['mallSubName'];
    _comments = json['comments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mallSubId'] = this._mallSubId;
    data['mallCategoryId'] = this._mallCategoryId;
    data['mallSubName'] = this._mallSubName;
    data['comments'] = this._comments;
    return data;
  }
}