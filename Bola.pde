color corBola = color(255);
float velocidadeMaximaBola = 15;
class Bola {
  float x;
  float y;
  float raio;
  float velocidadeX, velocidadeY;
  float velocidade;
  boolean indoDireita;
  color cor;

  Bola(float x, float y, float raio, float velocidade) {
    this.x = x;
    this.y = y;
    this.raio = raio;
    this.velocidadeX = velocidade;
    this.velocidadeY = velocidade;
    this.velocidade = velocidade;
  }
  void DesenhaBola() {
    //corpo
    fill(corBola);
    noStroke();
    //Blococeria
    circle(x, y, raio * 2);
  }
  void MoveBola() {
    x+= velocidadeX;
    y+=velocidadeY;
    if (y - raio<yMundo) {
      velocidadeY = - velocidadeY;
    }
    if (y + raio > height) {
      ReiniciarPosicoes();
      vidas--;
      return;
    }
    if (x - raio < xMundo || x + raio > xMundo + larguraMundo) {
      velocidadeX = - velocidadeX;
    }
  }
  void FuncoesBola() {
    DesenhaBola();
    if (pause) return;
    MoveBola();
    ColisaoPlayer();
    ColisaoBlocos();
  }
  void DefinirVelocidade(float x, float y, float larg, float alt, boolean player) {
    float xPorcento = (this.x - raio - x)/(larg);
    float yPorcento = -(y - this.y - raio)/(alt);
    //println(xPorcento);
    //println(yPorcento);
    if (xPorcento > .5f && velocidadeX < 0 || xPorcento < .5f && velocidadeX > 0) {
      velocidadeX = - velocidadeX;
      if (player) {
        if (xPorcento > .5f) velocidadeX*= 1 +xPorcento/2;
        else velocidadeX*= 1 +xPorcento;
        if (velocidadeX > velocidadeMaximaBola) velocidadeX = velocidadeMaximaBola;
      }
    }
    if (yPorcento > .5f && velocidadeY < 0 || yPorcento < .5f && velocidadeY>0) {
      velocidadeY = - velocidadeY;
      if (player) {
        if (yPorcento > .5f) velocidadeY*= 1 +yPorcento/2;
        else velocidadeY*= 1 +yPorcento;
        if (velocidadeY > velocidadeMaximaBola) velocidadeY = velocidadeMaximaBola;
      }
    }
  }
  void ColisaoPlayer() {
    float testX = x, testY = y;
    if (x < p.x)             testX = p.x;        // borda de esquerda
    else if (x > p.x + p.larg) testX = p.x+p.larg;     // borda direita

    if (y < p.y)         testY = p.y;        // borda de cima
    else if (y > p.y+p.alt) testY = p.y + p.alt;    // bora de baixo

    float distX = x-testX;
    float distY = y-testY;
    float distance = sqrt( (distX*distX) + (distY*distY));

    if (distance <= raio) {
      DefinirVelocidade(p.x, p.y, p.larg, p.alt, true);
    }
  }
  void ColisaoBlocos() {
    for (int i = 0; i < blocos.length; i++) {
      if (blocos[i].vivo) {
        float testX = x, testY = y;
        if (x + raio < blocos[i].x)             testX = blocos[i].x;        // borda esquerda
        else if (x -raio > blocos[i].x+blocos[i].larg) testX = blocos[i].x+blocos[i].larg;     // borda direita

        if (y +raio < blocos[i].y)         testY = blocos[i].y;        // borda de cima
        else if (y -raio> blocos[i].y+blocos[i].alt) testY = blocos[i].y + blocos[i].alt;    // borda de baixo

        float distX = x-testX;
        float distY = y-testY;
        float distance = sqrt( (distX*distX) + (distY*distY) );

        if (distance <= raio) {
          DefinirVelocidade(blocos[i].x, blocos[i].y, blocos[i].larg, blocos[i].alt, false);
          blocos[i].vivo = false;
          pontosJogador+=blocos[i].valorEmPontos;
          blocosDestruidos++;
          println("Bloco destruido");
          return;
        }
      }
    }
  }
}
