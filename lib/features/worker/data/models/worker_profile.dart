class WorkerProfile {
  final String firstName;
  final String lastName;
  final String phone;
  final String? email;
  final String language;
  final String category;
  final String experience;
  final String? profileImage;

  WorkerProfile({
    required this.firstName,
    required this.lastName,
    required this.phone,
    this.email,
    required this.language,
    required this.category,
    required this.experience,
    this.profileImage,
  });
}
