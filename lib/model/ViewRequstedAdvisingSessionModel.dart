class ViewRequstedAdvisingSessionModel {
  int? seionId;
  String? userType;
  int? usersId;
  String? name;
  String? male;
  String? gPA;
  String? requstedTybe;

  ViewRequstedAdvisingSessionModel(
      {this.seionId,
      this.userType,
      this.usersId,
      this.name,
      this.male,
      this.gPA,
      this.requstedTybe});

  ViewRequstedAdvisingSessionModel.fromJson(Map<String, dynamic> json) {
    seionId = json['seion_id'];
    userType = json['user_type'];
    usersId = json['users_id'];
    name = json['name'];
    male = json['male'];
    gPA = json['GPA'];
    requstedTybe = json['requsted_tybe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seion_id'] = this.seionId;
    data['user_type'] = this.userType;
    data['users_id'] = this.usersId;
    data['name'] = this.name;
    data['male'] = this.male;
    data['GPA'] = this.gPA;
    data['requsted_tybe'] = this.requstedTybe;
    return data;
  }
}