Kachel[][] kacheln = new Kachel[17][17];
Kopf kopf;
Frucht frucht;

final int INTERVALL = 15;
int timer = INTERVALL;
boolean lebendig = false;
boolean initialisiert = false;
int punkte;

void setup() {
  size(500, 500);
  for (int i = 0; i < 17; i++) {
    for (int j = 0; j < 17; j++) {
      kacheln[i][j] = new Kachel(i, j, width/17.0);
    }
  }
  spielInitialisieren();
}

void draw() {
  background(255);
  for (int i = 0; i < 17; i++) {
    for (int j = 0; j < 17; j++) {
      kacheln[i][j].zeichnen();
    }
  }
  kopf.zeichnen(); 
  frucht.zeichnen();
  
  textAlign(CENTER,CENTER);
  textSize(25);
  fill(255);
  if (! initialisiert) {
    text("Zum Zurücksetzen beliebige Taste drücken", width/2, height/2);
  }
  else if(! lebendig){
    text("Zum Starten beliebige Taste drücken", width/2, height/2);
  }
  
  textAlign(RIGHT, TOP);
  textSize(30);
  text("Punkte: " + punkte, width - 10, 10);
  
  timer --;
  if (lebendig && timer == 0) {
    timer = INTERVALL;
    kopf.schritt();
  }
 }
 
void keyPressed(){
  if (! initialisiert) spielInitialisieren();
  else if (! lebendig) spielStarten();
  else kopf.setRichtung(keyCode);
}

void punktGemacht(){
  frucht = new Frucht(width/17.0);
  punkte ++;
}

void gameOver() {
  lebendig = false;
  initialisiert = false;
}

void spielInitialisieren() {
  kopf = new Kopf(width/17.0, 2, 3);
  kopf.schritt(RIGHT, true);
  kopf.schritt(RIGHT, true);
  frucht = new Frucht(width/17.0);
  punkte = 0;
  initialisiert = true;
}

void spielStarten() {
  timer = INTERVALL;
  lebendig = true;
}
