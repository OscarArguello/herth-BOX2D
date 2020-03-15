
import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;
PImage harta;
PImage ojo;
PFont font;

// Just a single box this time
corazon box;
corazon2 box2;
Spring spring;
Spring2 spring2;
PantallaCarga c;


Box2DProcessing mundo;
Box2DProcessing mundo2;

Limite suelo;
Limite izquierdo;
Limite izquierdoB;
Limite derecho;
Limite arriba;

Limitedople suelo2;
Limitedople izquierdo2;
Limitedople derecho2;
Limitedople2 derecho_2;
Limitedople arriba2;

ArrayList<Box> boxes;
ArrayList<Box2> boxes2;

void setup() {
  size(600,600);
  smooth();
  harta = loadImage("harta.jpg");
  harta.resize(80,80);
  ojo = loadImage("ojo.png");
  ojo.resize(60,60);
  mundo = new Box2DProcessing(this);
  c = new PantallaCarga();
  mundo.createWorld();
  
  mundo2 = new Box2DProcessing(this);
  mundo2.createWorld();
  
    // Turn on collision listening!
  mundo.listenForCollisions();
    // Make the box
  box = new corazon(width/2,height/2);
      // Turn on collision listening!
  mundo2.listenForCollisions();
    // Make the box
  box2 = new corazon2(width/2,height/2);


  // Make the spring (it doesn't really get initialized until the mouse is clicked)
  spring = new Spring();
  spring.bind(width/2,height/2,box);
    // Make the spring (it doesn't really get initialized until the mouse is clicked)
  spring2 = new Spring2();
  spring2.bind(width/2,height/2,box2);
 

  mundo.setGravity(0, -2);
  mundo2.setGravity(0, 2);
   
  suelo = new Limite(200,600,800,20);
  izquierdo = new Limite(0,300,30,300);
  izquierdoB = new Limite(0,300,30,350);
  derecho = new Limite(600,0,30,1500);
  arriba = new Limite (0,0,1500,20);
  
  suelo2 = new Limitedople(200,600,800,20);
  izquierdo2 = new Limitedople(0,300,30,200);
  derecho2 = new Limitedople(600,0,30,350);
  derecho_2 = new Limitedople2(600,550,30,300);
  arriba2 = new Limitedople(0,0,1500,20);
  
  //fuente
  font = loadFont("rpgletra2.vlw");
  textFont(font);


  boxes = new ArrayList<Box>();
  boxes2 = new ArrayList<Box2>();
 }

void draw() {
  background(0);
  c.cambio();
  mundo.step();
  mundo2.step();
  
  suelo.display();
  izquierdo.display();
  izquierdoB.display();
  derecho.display();
  arriba.display();

  suelo2.display();
  izquierdo2.display();
  derecho2.display();
  derecho_2.display();
  arriba2.display();
    // Draw the box
  box.display();
  box2.display();
  
  if (mousePressed) {
    spring.update(mouseX,mouseY);
    spring.display();
  } else {
   
  }
  
  if (mousePressed) {
    spring2.update(mouseX,mouseY);
    spring2.display();
  } else {
   
  }
  box.body.setAngularVelocity(0);
  box2.body.setAngularVelocity(0);
 
  if (random(2) < 0.1) {
    Box p = new Box(width/2,30);
    boxes.add(p);
  }
  for (Box b: boxes) {
    b.display();
  }
  for (int i = boxes.size()-1; i >= 0; i--) {
    Box b = boxes.get(i);
    if (b.done()) {
      boxes.remove(i);
    }
  }

  if (random(2) < 0.1) {
    Box2 p = new Box2(width/2,570);
    boxes2.add(p);
  }
  for (Box2 c: boxes2) {
    c.display();
  }
  for (int i = boxes2.size()-1; i >= 0; i--) {
    Box2 c = boxes2.get(i);
    if (c.done()) {
      boxes2.remove(i);
    }
  }
  
  fill(255,0,0);
  noStroke();
  rect(5,300,20,190);
 }
 
// Collision event functions!
void beginContact(Contact cp) {
  // Get both fixtures
  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();
  // Get both bodies
  Body b1 = f1.getBody();
  Body b2 = f2.getBody();
  // Get our objects that reference these bodies
  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();

  // If object 1 is a Box, then object 2 must be a particle
  // Note we are ignoring particle on particle collisions
  if (o1.getClass() == corazon.class) {
    Box p = (Box) o2;
  
  } 
  // If object 2 is a Box, then object 1 must be a particle
  else if (o2.getClass() == corazon.class) {
    Box p = (Box) o1;
   
  }
  
    // Get both fixtures
  Fixture m1 = cp.getFixtureA();
  Fixture m2 = cp.getFixtureB();
  // Get both bodies
  Body s1 = f1.getBody();
  Body s2 = f2.getBody();
  // Get our objects that reference these bodies
  Object c1 = b1.getUserData();
  Object c2 = b2.getUserData();

  // If object 1 is a Box, then object 2 must be a particle
  // Note we are ignoring particle on particle collisions
  if (c1.getClass() == corazon2.class) {
    Box2 p = (Box2) c2;
  
  } 
  // If object 2 is a Box, then object 1 must be a particle
  else if (c2.getClass() == corazon2.class) {
    Box2 p = (Box2) c1;
   
  }
} 
