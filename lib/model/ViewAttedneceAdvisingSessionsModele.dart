class ViewAttedneceAdvisingSessionsModle {
  int? sessionId;
  String? userType;
  int? usersId;
  String? name;
  String? male;
  String? gPA;
  String? attendanceTybe;

  ViewAttedneceAdvisingSessionsModle(
      {this.sessionId,
      this.userType,
      this.usersId,
      this.name,
      this.male,
      this.gPA,
      this.attendanceTybe});

  ViewAttedneceAdvisingSessionsModle.fromJson(Map<String, dynamic> json) {
    sessionId = json['session_id'];
    userType = json['user_type'];
    usersId = json['users_id'];
    name = json['name'];
    male = json['male'];
    gPA = json['GPA'];
    attendanceTybe = json['attendance_tybe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['session_id'] = this.sessionId;
    data['user_type'] = this.userType;
    data['users_id'] = this.usersId;
    data['name'] = this.name;
    data['male'] = this.male;
    data['GPA'] = this.gPA;
    data['attendance_tybe'] = this.attendanceTybe;
    return data;
  }
}