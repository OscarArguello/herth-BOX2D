class corazon {

  // We need to keep track of a Body and a width and height
  Body body;
  float w;
  float h;

  // Constructor
  corazon(float x_, float y_) {
    float x = x_;
    float y = y_;
    w = 50;
    h = 50;
    // Add the box to the box2d world
    makeBody(new Vec2(x, y), w, h);
    body.setUserData(this);
  }

  // This function removes the particle from the box2d world
  void killBody() {
    mundo.destroyBody(body);
  }

  boolean contains(float x, float y) {
    Vec2 worldPoint = mundo.coordPixelsToWorld(x, y);
    Fixture f = body.getFixtureList();
    boolean inside = f.testPoint(worldPoint);
    return inside;
  }

  // Drawing the box
  void display() {
    // We look at each body and get its screen position
    Vec2 pos = mundo.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();

    rectMode(PConstants.CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    fill(0);
    
    stroke(0);
    ellipse(0, 0, w, h);
    popMatrix();
  }

  // This function adds the rectangle to the box2d world
  void makeBody(Vec2 center, float w_, float h_) {
    // Define and create the body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(mundo.coordPixelsToWorld(center));
    body = mundo.createBody(bd);

    // Define a polygon (this is what we use for a rectangle)
    PolygonShape sd = new PolygonShape();
    float mundoW = mundo.scalarPixelsToWorld(w_/2);
    float mundoH = mundo.scalarPixelsToWorld(h_/2);
    sd.setAsBox(mundoW, mundoH);

    // Define a fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;

    body.createFixture(fd);
    //body.setMassFromShapes();

    // Give it some initial random velocity
    body.setLinearVelocity(new Vec2(random(-5, 5), random(2, 5)));
    body.setAngularVelocity(random(-5, 5));
  }
}
