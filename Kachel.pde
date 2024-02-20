class Kachel {
  private color farbe;
  private float x;
  private float y;
  private float groesse;

  Kachel(int i, int j, float groesse) {
    x = i * groesse;
    y = j * groesse;
    this.groesse = groesse;
    if ((i+j) % 2 == 0) {
      farbe = color(167, 217, 72);
    } else {
      farbe = color(142, 204, 57);
    }
  }

  public void zeichnen() {
    fill(farbe);
    strokeWeight(0);
    rect(x, y, groesse, groesse);
  }
}
