void main() {
  int byte = 3221225472;
  double gb = byte / (1024 * 1024 * 1024);
  double mb = byte / (1024 * 1024);
  if (gb >= 1) {
    print('${gb.toStringAsFixed(2)} ГБ');
  } else {
    print('${mb.toStringAsFixed(2)} МБ');
  }
}