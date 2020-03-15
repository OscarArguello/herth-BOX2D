class PantallaCarga{
  int p=0;
  
  PantallaCarga(){}
  
  void cambio(){
    if (p == 0)
    pan1();
  }
    void pan1(){
    fill(0);
      rect (10,10,1600,1600);
      
      
  //titulo
  fill(255,0,0);
  textSize(70);
  text("MUEVETE CON EL MOUSE",115,395);
  fill(255,0,0);
  textSize(60);
  text("EMPUJALOS HACIA AFUERA",128,440);
  fill(255,0,0);
  textSize(50);
  text("NO DEJES QUE TE CONTENGAN",135,478);
  fill(255,0,0);
  textSize(50);
  text("PRECIONA '1' PARA COMENZAR",139,517);
  
  
 
      
      if(keyPressed)
      if(key=='1')
      p++;
    }
    

    
}
