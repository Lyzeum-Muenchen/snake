class Schlangenglied {
  protected float groesse;
  protected color farbe;
  protected int i;
  protected int j;
  protected int richtung;
  protected Schlangenglied nachfolger;

  public Schlangenglied (float groesse, int i, int j, int richtung) {
    this.groesse = groesse;
    this.i = i;
    this.j = j;
    this.richtung = richtung;
    farbe = color(79, 120, 248);
  }

  public void zeichnen() {
    fill(farbe);
    rect(i*groesse, j*groesse, groesse, groesse);

    if (nachfolger != null)
      nachfolger.zeichnen();
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
