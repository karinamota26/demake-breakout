class Bloco {
  float x;
  float y;
  float larg;
  float alt;
  color cor;
  boolean vivo = true;
  int valorEmPontos;

  Bloco() {
  }
  void DesenhaBloco() {
    if (vivo) {
      //corpo
      fill(cor);
      noStroke();
      rect(x, y, larg, alt);
    }
  }
}
