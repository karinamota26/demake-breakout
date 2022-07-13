int pontosJogador = 0;
int vezesCompletas = 0;
int vidas = 5;
PFont pixelFont;
int blocosDestruidos = 0;
void Vitoria() {
  if (blocosDestruidos == blocos.length) {
    vezesCompletas++;
    ReiniciarPosicoes();
  }
}
void ReiniciarPosicoes() {

  p = new Player(120, 20, 14);

  b.x = width/2.0;
  b.y = height/2.0;
  b.velocidadeX = b.velocidade;
  b.velocidadeY = b.velocidade;

  int i = 0;
  float larguraBloco = (larguraMundo / numColunas) - espacoX * 2;

  for (int linha = 0; linha <numLinhas; linha++) {
    for (int coluna = 0; coluna <numColunas; coluna++) {
      //int i = (linha*numLinhas)+coluna;
      //println(i);
      blocos[i].vivo = true;
      blocos[i].larg = larguraBloco;
      blocos[i].alt = alturaBloco;
      blocos[i].x = espacoX + xMundo + (coluna * (blocos[i].larg + 2 * espacoX));
      blocos[i].y = espacoY + yMundo + (linha * (blocos[i].alt + 2 * espacoY));
      blocos[i].valorEmPontos = numLinhas - linha;
      if (linha == 0) {
        blocos[i].cor = color(213, 84, 73);
      } else if (linha == 1) {
        blocos[i].cor = color(168, 123, 46);
      } else if (linha == 2) {
        blocos[i].cor = color(164, 154, 36);
      } else if (linha == 3) {
        blocos[i].cor = color(66, 146, 68);
      } else if (linha == 4) {
        blocos[i].cor = color(26, 81, 206);
      }
      i++;
    }
  }
}
void Derrota() {
  pontosJogador = 0;
  vezesCompletas = 0;
  vidas = 5;
  blocosDestruidos = 0;
  ReiniciarPosicoes();
}
void ChecaDerrota() {
  if (vidas < 0) {
    Derrota();
  }
}

void DesenhaPlacar() {
  textSize(72);
  fill(200);
  text( nf(pontosJogador, 3), xMundo + larguraMundo/2 - 100, yMundo-20);
  text( vidas, xMundo + larguraMundo - 200, yMundo-20);
  text( vezesCompletas, xMundo + larguraMundo - 400, yMundo-20);
}

void Pause() {
  if (key == ENTER) {
    pause = !pause;
    println("Pause");
  }
}
