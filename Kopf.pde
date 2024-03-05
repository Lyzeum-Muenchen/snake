class Kopf extends Schlangenglied {


  public Kopf (float groesse, int i, int j) {
    super(groesse, i, j, RIGHT);
  }

  public void schritt() {

    bewegen();
    if (i < 0 || j < 0 || i >= kacheln.length || j >= kacheln[0].length) {
      gameOver();
    }
    boolean fruchtGegessen = i == frucht.i && j == frucht.j;

    if (nachfolger != null)
      nachfolger.schritt(richtung, fruchtGegessen);

    if (fruchtGegessen) punktGemacht();

    if (nachfolger != null && nachfolger.istInSchlange(i, j)) {
      gameOver();
    }
  }

  public void zeichnen(float t) {
    super.zeichnen(t);

    float x = (i*t + altesI*(1-t))*groesse;
    float y = (j*t + altesJ*(1-t))*groesse;

    fill(255);
    ellipseMode(CENTER);

    switch(richtung) {
    case RIGHT:
      ellipse(x + 0.66 * groesse, y + 0.25 * groesse, 0.4 * groesse, 0.2 * groesse);
      ellipse(x + 0.66 * groesse, y + 0.75 * groesse, 0.4 * groesse, 0.2 * groesse);
      break;
    case LEFT:
      ellipse(x + 0.33 * groesse, y + 0.25 * groesse, 0.4 * groesse, 0.2 * groesse);
      ellipse(x + 0.33 * groesse, y + 0.75 * groesse, 0.4 * groesse, 0.2 * groesse);
      break;
    case UP:
      ellipse(x + 0.25 * groesse, y + 0.33 * groesse, 0.2 * groesse, 0.4 * groesse);
      ellipse(x + 0.75 * groesse, y + 0.33 * groesse, 0.2 * groesse, 0.4 * groesse);
      break;
    case DOWN:
      ellipse(x + 0.25 * groesse, y + 0.66 * groesse, 0.2 * groesse, 0.4 * groesse);
      ellipse(x + 0.75 * groesse, y + 0.66 * groesse, 0.2 * groesse, 0.4 * groesse);
      break;
    }
  }
}
