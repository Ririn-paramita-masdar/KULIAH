import 'dart:io';

void main() {
  bool lanjut = true;

  while (lanjut) {
    Map<int, String> menu = {
      1: "Nasi Goreng",
      2: "Mie Ayam",
      3: "Ayam Geprek",
      4: "Es Teh",
      5: "Jus Mangga",
      6: "Kopi Susu"
    };

    Map<int, int> harga = {
      1: 15000,
      2: 12000,
      3: 18000,
      4: 5000,
      5: 10000,
      6: 8000
    };

    print("\n===== MENU RESTORAN =====");
    menu.forEach((key, value) {
      print("$key. $value\tRp${harga[key]}");
    });
    print("==========================");

    Map<int, int> pesanan = {};

    while (true) {
      stdout.write("\nMasukkan nomor menu (0 untuk selesai): ");
      int? pilihan = int.tryParse(stdin.readLineSync()!);

      if (pilihan == null) {
        print("⚠️ Masukkan angka yang benar!");
        continue;
      }

      if (pilihan == 0) break;

      if (menu.containsKey(pilihan)) {
        stdout.write("Berapa porsi ${menu[pilihan]}: ");
        int? jumlah = int.tryParse(stdin.readLineSync()!);
        if (jumlah == null || jumlah <= 0) {
          print("⚠️ Jumlah tidak valid!");
          continue;
        }
        pesanan[pilihan] = (pesanan[pilihan] ?? 0) + jumlah;
        print("✅ ${menu[pilihan]} ($jumlah porsi) ditambahkan!");
      } else {
        print("⚠️ Nomor menu tidak valid!");
      }
    }

    if (pesanan.isEmpty) {
      print("Tidak ada pesanan.");
      break;
    }

    int total = 0;
    print("\n===== RINCIAN PESANAN =====");
    pesanan.forEach((key, jumlah) {
      int subtotal = harga[key]! * jumlah;
      print("${menu[key]} ($jumlah porsi) = Rp$subtotal");
      total += subtotal;
    });
    print("============================");
    print("Total Harga: Rp$total");

    stdout.write("\nApakah ingin melanjutkan ke pembayaran? (y/n): ");
    String? konfirmasi = stdin.readLineSync();

    if (konfirmasi?.toLowerCase() == 'y') {
      print("\n💰 Pembayaran sebesar Rp$total berhasil! Terima kasih sudah memesan 💛");
    } else {
      print("\n❌ Pembayaran dibatalkan.");
    }

    stdout.write("\nApakah ingin memesan lagi? (y/n): ");
    String? ulang = stdin.readLineSync();
    if (ulang?.toLowerCase() != 'y') {
      lanjut = false;
      print("\n👋 Terima kasih, sampai jumpa lagi!");
    }
  }
}
