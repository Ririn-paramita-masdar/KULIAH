void main() {
  // Data karyawan
  String namaKaryawan = "Ririn Paramita";
  int jamKerja = 40;             
  double upahPerJam = 50000;    
  bool statusTetap = true;       

  // Hitung gaji kotor
  double gajiKotor = jamKerja * upahPerJam;

  // Hitung pajak
  double pajak;
  if (statusTetap) {
    pajak = 0.10 * gajiKotor;  
  } else {
    pajak = 0.05 * gajiKotor;  
  }

  // Hitung gaji bersih
  double gajiBersih = gajiKotor - pajak;

  // Tampilkan hasil
  print("=== Data Gaji Karyawan ===");
  print("Nama Karyawan : $namaKaryawan");
  print("Jam Kerja     : $jamKerja jam");
  print("Upah per Jam  : Rp $upahPerJam");
  print("Status        : ${statusTetap ? "Tetap" : "Kontrak"}");
  print("Gaji Kotor    : Rp $gajiKotor");
  print("Pajak         : Rp $pajak");
  print("Gaji Bersih   : Rp $gajiBersih");
}
