class Kopf extends Schlangenglied {
  

  public Kopf (float groesse, int i, int j) {
    super(groesse, i, j, RIGHT);
  }
  
  public void schritt(){
    bewegen();
    
    if (i < 0 || j < 0 || i >= kacheln.length || j >= kacheln[0].length){
      gameOver();
    }
    
    boolean fruchtGegessen = i == frucht.i && j == frucht.j;
    if (nachfolger != null)
      nachfolger.schritt(richtung, fruchtGegessen);
    
    if (fruchtGegessen) punktGemacht();
    
    if (nachfolger != null && nachfolger.istInSchlange(i,j)){
      gameOver();
    }
  }
  
}
