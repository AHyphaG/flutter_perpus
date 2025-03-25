class Profile {
  final String email;
  final String namaDepan;
  final String namaBelakang;
  final String tanggalLahir;

  Profile({
    required this.email,
    required this.namaDepan,
    required this.namaBelakang,
    required this.tanggalLahir,
  });

  Map<String, dynamic> toJson() => {
    'email': email,
    'nama_depan': namaDepan,
    'nama_belakang': namaBelakang,
    'tanggal_lahir': tanggalLahir,
  };
}
