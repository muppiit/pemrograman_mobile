void main(List<String> args) {
  var record = ('first', a: 2, b: true, 'last');
  print(record);

  (int, int) tukar((int, int) record) {
    var (a, b) = record;
    return (b, a);
  }

  var record2 = (1, 2);
  var record3 = tukar(record2);
  print(record3);

  // Record type annotation in a variable declaration:
  (String, int) mahasiswa;
  mahasiswa = ('Achmad Mufid', 2241720159);
  print(mahasiswa);

var mahasiswa2 = ('first', a: "Achmad Mufid", b: 2241720159, 'last');

print(mahasiswa2.$1);
print(mahasiswa2.a);
print(mahasiswa2.b);
print(mahasiswa2.$2);
}
