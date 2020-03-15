class Box2 {

  
  Body body;
  float w;
  float h;

 
  Box2(float x, float y) {
    w = random(4, 50);
    h = random(4, 50);
  
    makeBody(new Vec2(x, y), w, h);
  }

 
  void killBody() {
    mundo2.destroyBody(body);
  }


  boolean done() {
  
    Vec2 pos = mundo2.getBodyPixelCoord(body);
  
    if (pos.y > height+w*h) {
      killBody();
      return true;
    }
    return false;
  }

  void display() {
   
    Vec2 pos = mundo2.getBodyPixelCoord(body);
  
    float a = body.getAngle();

    rectMode(CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    fill(0);
    noStroke();
    rect(0, 0, w, h);
    imageMode(CENTER);
    image(ojo,0,0);
    popMatrix();
  }

  
  void makeBody(Vec2 center, float w_, float h_) {

   
    PolygonShape sd = new PolygonShape();
    float box2dW = mundo2.scalarPixelsToWorld(w_/2);
    float box2dH = mundo2.scalarPixelsToWorld(h_/2);
    sd.setAsBox(box2dW, box2dH);

   
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
  
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;


    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(mundo2.coordPixelsToWorld(center));

    body = mundo2.createBody(bd);
    body.createFixture(fd);

 
    body.setLinearVelocity(new Vec2(random(-5, 5), random(2, 5)));
    body.setAngularVelocity(random(-5, 5));
  }
}
