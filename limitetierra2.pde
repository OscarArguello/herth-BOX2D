class Limitedople{
  float x,y;
  float w;
  float h;
  Body b;
  
  Limitedople( float x_, float y_, float w_, float h_){
    w = w_;
    h = h_;
    x = x_;
    y = y_;
    // Crear la definición del cuerpo
    BodyDef bd = new BodyDef();
    Vec2 posicionInicial = new Vec2(x_,y_);
    Vec2 posicionEnMundo = mundo2.coordPixelsToWorld(posicionInicial);
    bd.position.set(posicionEnMundo);
    bd.type = BodyType.STATIC;
    
    //crear el body : posición y velocidad
    b = mundo2.createBody(bd);
    // una velocidad incial: linear, angular, hacer que el objeto no rote 
    b.setLinearVelocity(new Vec2(random(-5,5),random(10)));
    b.setAngularVelocity(random(-5,5));
    
    //definir su forma 
    PolygonShape ps = new PolygonShape();
    float ancho = mundo2.scalarPixelsToWorld(w_);
    float alto = mundo2.scalarPixelsToWorld(h_);
    ps.setAsBox(ancho/2,alto/2);
    
    //definir sus caracteristicas 
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.friction = 0.3;
    fd.restitution = 0.4;
    fd.density = 1;
    
    b.createFixture(fd);
  }
  
  void display(){    
    pushMatrix();
      translate(x,y);
      rectMode(CENTER);
      noStroke();
      fill(0);
      rect(0,0,w,h);
    popMatrix();
  }

}
