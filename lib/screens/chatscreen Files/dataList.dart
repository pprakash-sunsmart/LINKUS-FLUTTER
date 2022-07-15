// ignore_for_file: non_constant_identifier_names
class Employee {
  int id;
  String Name;
  bool isChecked;
  String jobProfile;
  String? photourl;
  String? status;
  Employee(
      {required this.id,
      required this.Name,
      required this.jobProfile,
      required this.isChecked,
      this.photourl,
      this.status});
}

List<Employee> listItems = [];
List<dynamic> Contactmodel = [];
List<Employee> liveItems = [];
