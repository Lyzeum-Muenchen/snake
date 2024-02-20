class Frucht {
  private color farbe = color(255,0,0);
  private int i;
  private int j;
  private float groesse;
  
  public Frucht (float groesse) {
    this.groesse = groesse;
    i = (int) random(kacheln.length);
    j = (int) random(kacheln[0].length);
    
    while (kopf.istInSchlange(i,j)){
      i = (int) random(kacheln.length);
      j = (int) random(kacheln[0].length);
    }
  }
  
  public void zeichnen() {
    fill(farbe);
    ellipseMode(CORNER);
    ellipse(i * groesse, j * groesse, groesse, groesse);
  }
  
}
