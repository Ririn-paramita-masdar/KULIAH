// Aplikasi Pemesanan Transportasi “SmartRide”

abstract class Transportasi {
  String id;
  String nama;
  double _tarifDasar;
  int kapasitas;

  Transportasi(this.id, this.nama, this._tarifDasar, this.kapasitas);

  double get tarifDasar => _tarifDasar;

  double hitungTarif(int jumlahPenumpang); // abstrak
  void tampilInfo();
}

class Taksi extends Transportasi {
  double jarak; // dalam kilometer

  Taksi(String id, String nama, double tarifDasar, int kapasitas, this.jarak)
      : super(id, nama, tarifDasar, kapasitas);

  @override
  double hitungTarif(int jumlahPenumpang) {
    return tarifDasar * jarak;
  }

  @override
  void tampilInfo() {
    print("🚕 Taksi: $nama");
    print("ID: $id | Kapasitas: $kapasitas | Tarif Dasar: Rp$tarifDasar/km");
    print("Jarak Perjalanan: $jarak km\n");
  }
}

class Bus extends Transportasi {
  bool adaWifi;

  Bus(String id, String nama, double tarifDasar, int kapasitas, this.adaWifi)
      : super(id, nama, tarifDasar, kapasitas);

  @override
  double hitungTarif(int jumlahPenumpang) {
    return (tarifDasar * jumlahPenumpang) + (adaWifi ? 5000 : 0);
  }

  @override
  void tampilInfo() {
    print("🚌 Bus: $nama");
    print("ID: $id | Kapasitas: $kapasitas | Tarif Dasar: Rp$tarifDasar/penumpang");
    print("Fasilitas Wifi: ${adaWifi ? "Tersedia" : "Tidak Ada"}\n");
  }
}

class Pesawat extends Transportasi {
  String kelasPenerbangan; // “Ekonomi” atau “Bisnis”

  Pesawat(String id, String nama, double tarifDasar, int kapasitas, this.kelasPenerbangan)
      : super(id, nama, tarifDasar, kapasitas);

  @override
  double hitungTarif(int jumlahPenumpang) {
    return tarifDasar * jumlahPenumpang * (kelasPenerbangan == "Bisnis" ? 1.5 : 1.0);
  }

  @override
  void tampilInfo() {
    print("✈️ Pesawat: $nama");
    print("ID: $id | Kapasitas: $kapasitas | Tarif Dasar: Rp$tarifDasar/penumpang");
    print("Kelas: $kelasPenerbangan\n");
  }
}


class Pemesanan {
  String idPemesanan;
  String namaPelanggan;
  Transportasi transportasi;
  int jumlahPenumpang;
  double totalTarif;

  Pemesanan(this.idPemesanan, this.namaPelanggan, this.transportasi, this.jumlahPenumpang, this.totalTarif);

  void cetakStruk() {
    print("====== STRUK PEMESANAN SMART RIDE ======");
    print("ID Pemesanan  : $idPemesanan");
    print("Nama Pelanggan: $namaPelanggan");
    print("Transportasi  : ${transportasi.nama}");
    print("Jumlah Penumpang: $jumlahPenumpang");
    print("Total Tarif   : Rp${totalTarif.toStringAsFixed(2)}");
    print("========================================\n");
  }

  Map<String, dynamic> toMap() {
    return {
      "idPemesanan": idPemesanan,
      "namaPelanggan": namaPelanggan,
      "transportasi": transportasi.nama,
      "jumlahPenumpang": jumlahPenumpang,
      "totalTarif": totalTarif,
    };
  }
}

Pemesanan buatPemesanan(Transportasi t, String nama, int jumlahPenumpang) {
  double total = t.hitungTarif(jumlahPenumpang);
  String idPemesanan = "PSN${DateTime.now().millisecondsSinceEpoch}";
  return Pemesanan(idPemesanan, nama, t, jumlahPenumpang, total);
}

void tampilSemuaPemesanan(List<Pemesanan> daftar) {
  print("\n======= DAFTAR SEMUA PEMESANAN =======");
  for (var p in daftar) {
    p.cetakStruk();
  }
}

void main() {
  // Membuat objek transportasi
  var taksi = Taksi("T001", "Blue Bird", 8000, 4, 12.5);
  var bus = Bus("B001", "TransJakarta", 3500, 40, true);
  var pesawat = Pesawat("P001", "Garuda Indonesia", 1200000, 150, "Bisnis");

  // Menampilkan info transportasi
  taksi.tampilInfo();
  bus.tampilInfo();
  pesawat.tampilInfo();

  // Membuat beberapa pemesanan
  var p1 = buatPemesanan(taksi, "Ririn", 1);
  var p2 = buatPemesanan(bus, "Maya", 5);
  var p3 = buatPemesanan(pesawat, "Asta", 2);

  // Simpan ke dalam list
  List<Pemesanan> daftarPemesanan = [p1, p2, p3];

  // Tampilkan semua pemesanan
  tampilSemuaPemesanan(daftarPemesanan);
}
