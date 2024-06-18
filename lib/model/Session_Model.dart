class SessionModel {
  dynamic seionId;
  String? sessionDetiels;
  int? maxStudint;
  int? studintEnroll;
  String? sessionTybe;
  int? sessionAprrove;
  int? isArchived;
  DateTime? sessionStartTime;
  DateTime? sessionEndTime;
  int? careerAdvisorId;
  int? employerId;
  String? sessionTitle;
  String? sessionPlase;
  String? speaker;
  String? careerAdvisorName;
  String? employerName;

  SessionModel(
      {this.seionId,
      this.sessionDetiels,
      this.maxStudint,
      this.studintEnroll,
      this.sessionTybe,
      this.sessionAprrove,
      this.isArchived,
      this.sessionStartTime,
      this.sessionEndTime,
      this.careerAdvisorId,
      this.employerId,
      this.sessionTitle,
      this.sessionPlase,
      this.speaker,
      this.careerAdvisorName,
      this.employerName});

  SessionModel.fromJson(Map<String, dynamic> json) {
    seionId = json['seion_id'];
    sessionDetiels = json['session_detiels'];
    maxStudint = json['max_studint'];
    studintEnroll = json['studint_enroll'];
    sessionTybe = json['session_tybe'];
    sessionAprrove = json['session_aprrove'];
    isArchived = json['isArchived'];
    sessionStartTime = json['session_start_time']!= null ? DateTime.parse(json['session_start_time']) : null;
    sessionEndTime = json['session_end_time']!= null ? DateTime.parse(json['session_end_time']) : null;;
    careerAdvisorId = json['career_advisor_id'];
    employerId = json['Employer_id'];
    sessionTitle = json['session_title'];
    sessionPlase = json['session_plase'];
    speaker = json['speaker'];
    careerAdvisorName = json['career_advisor_name'];
    employerName = json['employer_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seion_id'] = this.seionId;
    data['session_detiels'] = this.sessionDetiels;
    data['max_studint'] = this.maxStudint;
    data['studint_enroll'] = this.studintEnroll;
    data['session_tybe'] = this.sessionTybe;
    data['session_aprrove'] = this.sessionAprrove;
    data['isArchived'] = this.isArchived;
    data['session_start_time'] = this.sessionStartTime;
    data['session_end_time'] = this.sessionEndTime;
    data['career_advisor_id'] = this.careerAdvisorId;
    data['Employer_id'] = this.employerId;
    data['session_title'] = this.sessionTitle;
    data['session_plase'] = this.sessionPlase;
    data['speaker'] = this.speaker;
    data['career_advisor_name'] = this.careerAdvisorName;
    data['employer_name'] = this.employerName;
    return data;
  }
}