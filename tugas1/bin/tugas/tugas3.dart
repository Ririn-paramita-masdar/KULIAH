import 'dart:io';

void main() {
  // Meminta input dari pengguna
  stdout.write("Masukkan skor Anda (0 - 100): ");
  String? input = stdin.readLineSync();

  // Konversi input ke integer
  int? skor = int.tryParse(input ?? "");

  // Validasi input
  if (skor == null) {
    print("Input tidak valid! Harus berupa angka.");
    return;
  }

  if (skor < 0 || skor > 100) {
    print("Error: Skor harus berada dalam rentang 0 - 100.");
    return;
  }

  // Menentukan grade berdasarkan skor
  String grade;
  if (skor >= 85 && skor <= 100) {
    grade = "A";
  } else if (skor >= 70 && skor <= 84) {
    grade = "B";
  } else if (skor >= 60 && skor <= 69) {
    grade = "C";
  } else if (skor >= 50 && skor <= 59) {
    grade = "D";
  } else {
    grade = "E";
  }

  // Menampilkan hasil
  print("Skor Anda: $skor");
  print("Grade Anda: $grade");
}
