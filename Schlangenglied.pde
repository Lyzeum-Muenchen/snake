class Schlangenglied {
  protected float groesse;
  protected color farbe;
  protected int i, altesI;
  protected int j, altesJ;
  protected int richtung;
  protected Schlangenglied nachfolger;

  public Schlangenglied (float groesse, int i, int j, int richtung) {
    this.groesse = groesse;
    this.i = i;
    this.j = j;
    altesI = i;
    altesJ = j;
    this.richtung = richtung;
    farbe = color(79, 120, 248);
  }

  // t läuft zwischen je zwei Schritten von 0 bis 1
  public void zeichnen(float t) {
    fill(farbe);
    
    if (nachfolger != null)
      rect(altesI*groesse, altesJ*groesse, groesse, groesse);
      
    rect((i*t + altesI*(1-t))*groesse, (j*t + altesJ*(1-t))*groesse, groesse, groesse);

    if (nachfolger != null)
      nachfolger.zeichnen(t);
  }

  public void schritt(int neueRichtung, boolean gliedAnfuegen) {    
    if (gliedAnfuegen && nachfolger == null) {
      nachfolger = new Schlangenglied(groesse, i, j, richtung);
      bewegen();
      richtung = neueRichtung;
      return;
    }
    bewegen();
    if (nachfolger != null)
      nachfolger.schritt(richtung, gliedAnfuegen);
    richtung = neueRichtung;
  }

  public void bewegen() {
    altesI = i;
    altesJ = j;
    
    switch(richtung) {
    case LEFT:
      i --;
      break;
    case UP:
      j --;
      break;
    case RIGHT:
      i++;
      break;
    case DOWN:
      j ++;
      break;
    }
  }

  public void setRichtung(int richtung) {
    if (
           ((richtung == LEFT || richtung == RIGHT) && (this.richtung == UP || this.richtung == DOWN)) 
        || ((this.richtung == LEFT || this.richtung == RIGHT) && (richtung == UP || richtung == DOWN))
       )
      this.richtung = richtung;
  }

  public boolean istInSchlange(int i, int j) {
    if (i == this.i && j == this.j) return true;
    if (nachfolger != null) return nachfolger.istInSchlange(i, j);
    return false;
  }
}
