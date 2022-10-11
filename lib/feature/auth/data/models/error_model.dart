class ErrorModel {
  String? message;
  String? path;
  String? status;
  int? timestamp;

  ErrorModel({this.message, this.path, this.status, this.timestamp});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    path = json['path'];
    status = json['status'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['path'] = this.path;
    data['status'] = this.status;
    data['timestamp'] = this.timestamp;
    return data;
  }
}