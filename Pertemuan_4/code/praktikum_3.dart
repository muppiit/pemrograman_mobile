void main(List<String> args) {
  var gifts = {
  // Key:    Value
  'Nama': 'Achmad Mufid',
  'NIM': '2241720159',
  'first': 'partridge',
  'second': 'turtledoves',
  'fifth': 1
};

var nobleGases = {
  2: 'helium',
  10: 'neon',
  18: 2,
  19: 'Achmad Mufid',
  20: '2241720159',
};

var mhs1 = Map<String, String>();
gifts['first'] = 'partridge';
gifts['second'] = 'turtledoves';
gifts['fifth'] = 'golden rings';

var mhs2 = Map<int, String>();
nobleGases[2] = 'helium';
nobleGases[10] = 'neon';
nobleGases[18] = 'argon';

mhs1['Nama'] = 'Achmad Mufid';
mhs1['NIM'] = '241720159';

mhs2[1] = 'Achmad Mufid';
mhs2[2] = '241720159';

print(gifts);
print(nobleGases);
print(mhs1);
print(mhs2);

}