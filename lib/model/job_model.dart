// import 'dart:ffi';
//
// class Job {
//   int? jobId;
//   String? jobDescription;
//   DateTime? jobCreate;
//   int? jobAproves;
//   int? isArchived;
//   String? jobType;
//   String? jobTitle;
//   DateTime? jobApllayingDedline;
//   String? companyName;
//   String? jobRequirement;
//
//   Job(
//       {this.jobId,
//       this.jobDescription,
//       this.jobCreate,
//       this.jobAproves,
//       this.isArchived,
//       this.jobType,
//       this.jobTitle,
//       this.jobApllayingDedline,
//       this.companyName,
//       this.jobRequirement});
//
//   Job.fromJson(Map<String, dynamic> json) {
//     jobId = json['job_id'];
//     jobDescription = json['job_description'];
//     jobCreate = json['job_create'] != null ? DateTime.parse(json['job_create']) : null;
//     jobAproves = json['job_aproves'];
//     isArchived = json['isArchived'];
//     jobType = json['job_type'];
//     jobTitle = json['job_title'];
//     jobApllayingDedline = json['job_Apllaying_Dedline'] != null ? DateTime.parse(json['job_Apllaying_Dedline']) : null;
//     companyName = json['company_name'];
//     jobRequirement = json['job_Requirement'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['job_id'] = this.jobId;
//     data['job_description'] = this.jobDescription;
//     data['job_create'] = this.jobCreate?.toIso8601String();
//     data['job_aproves'] = this.jobAproves;
//     data['isArchived'] = this.isArchived;
//     data['job_type'] = this.jobType;
//     data['job_title'] = this.jobTitle;
//     data['job_Apllaying_Dedline'] = this.jobApllayingDedline?.toIso8601String();
//     data['company_name'] = this.companyName;
//     data['job_Requirement'] = this.jobRequirement;
//     return data;
//   }
// }
class Job{
int? jobId;
String? jobDescription;
DateTime? jobCreate;
int? jobAproves;
int? isArchived;
String? jobType;
String? jobTitle;
DateTime? jobApllayingDedline;
String? jobRequirement;
int? employerId;
int? jobApllyed;
String? employerName;

Job(
    {this.jobId,
      this.jobDescription,
      this.jobCreate,
      this.jobAproves,
      this.isArchived,
      this.jobType,
      this.jobTitle,
      this.jobApllayingDedline,
      this.jobRequirement,
      this.employerId,
      this.jobApllyed,
      this.employerName});

Job.fromJson(Map<String, dynamic> json) {
jobId = json['job_id'];
jobDescription = json['job_description'];
jobCreate = json['job_create'] != null ? DateTime.parse(json['job_create']) : null;
jobAproves = json['job_aproves'];
isArchived = json['isArchived'];
jobType = json['job_type'];
jobTitle = json['job_title'];
jobApllayingDedline = json['job_Apllaying_Dedline'] != null ? DateTime.parse(json['job_Apllaying_Dedline']) : null;
jobRequirement = json['job_Requirement'];
employerId = json['Employer_id'];
jobApllyed = json['job_apllayed'];
employerName = json['employer_name'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['job_id'] = this.jobId;
data['job_description'] = this.jobDescription;
data['job_create'] = this.jobCreate?.toIso8601String();
data['job_aproves'] = this.jobAproves;
data['isArchived'] = this.isArchived;
data['job_type'] = this.jobType;
data['job_title'] = this.jobTitle;
data['job_Apllaying_Dedline'] = this.jobApllayingDedline?.toIso8601String();
data['job_Requirement'] = this.jobRequirement;
data['Employer_id'] = this.employerId;
data['job_apllayed'] = this.jobApllyed;
data['employer_name'] = this.employerName;
return data;
}
}