void main() {

  String nama = "Achmad Mufid";
  String nim = "2241720159";

  bool isPrime(int number) {
    if (number <= 1) return false;
    for (int i = 2; i <= number ~/ 2; i++) {
      if (number % i == 0) return false;
    }
    return true;
  }

  for (int i = 0; i <= 201; i++) {
    if (isPrime(i)) {
      print("$i adalah bilangan prima.");
      print("Nama: $nama, NIM: $nim\n");
    }
  }
}
