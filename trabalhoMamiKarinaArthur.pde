float larguraMundo = 1200;
float alturaMundo = 300;
float xMundo = 0;
float yMundo = 100;
int numLinhas = 5;
int numColunas = 20;
Player p;
Bloco[] blocos;
Bola b;
int numBlocos;
boolean pause = false;
float espacoX = 0;
float espacoY = 0;
float alturaBloco = 30;
void setup() {
  size(1200, 800);
  pixelFont = createFont("PublicPixel.ttf", 128);
  textFont(pixelFont);
  numBlocos = numLinhas * numColunas;
  p = new Player(120, 20, 14);
  b = new Bola(width/2, height/2.0, 10, 3);
  blocos = new Bloco[numBlocos];
  for (int i = 0; i < numBlocos; i++) {
    blocos[i] = new Bloco();
  }
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

void draw() {
  background(0);
  p.FuncoesPlayer();
  b.FuncoesBola();
  DesenhaPlacar();
  Vitoria();
  ChecaDerrota();
  for (int i = 0; i < numBlocos; i++) {
    blocos[i].DesenhaBloco();
  }
}
