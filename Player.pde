boolean moveCima, moveBaixo, moveDireita, moveEsquerda;
class Player {
  PImage img;
  float x;
  float y;
  float larg;
  float alt;
  float velocidade;

  Player(float larg, float alt, float velocidade) {
    this.larg = larg;
    this.alt = alt;
    this.velocidade = velocidade;
    y = height - alt;
    x = larguraMundo/2.0;
  }
  void FuncoesPlayer() {
    DesenhaPlayer();
    if (pause) return;
    MovePlayer();
  }
  void DesenhaPlayer() {
    fill(255);
    rect(x, y, larg, alt);
  }
  void MovePlayer() {
    //Movimento horizontal
    if (moveEsquerda) {
      x-= velocidade;
    }
    if (moveDireita) {
      x+= velocidade;
    }
    if (x > xMundo + larguraMundo - larg) {
      x = xMundo + larguraMundo - larg;
    }
    if (x <= xMundo) {
      x = 0;
    }
  }
}

void keyPressed() {
  if (keyCode == 'A' || keyCode == LEFT) {
    moveEsquerda = true;
  }
  if (keyCode == 'D' || keyCode == RIGHT) {
    moveDireita = true;
  }
  Pause();
}

void keyReleased() {
  if (keyCode == 'A' || keyCode == LEFT) {
    moveEsquerda = false;
  }
  if (keyCode == 'D' || keyCode == RIGHT) {
    moveDireita = false;
  }
}
