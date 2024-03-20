ArrayList<Planet> planets;

float density = 100;
float G = 0.0005;


PVector gravVector;

void setup() {
  size(1000, 800);

  planets = new ArrayList<Planet>();
}

void draw() {
  background(255);

  for (Planet currentPlanet : planets) {

    for (Planet otherPlanet : planets) {
      if (!currentPlanet.equals(otherPlanet)) {

        float d = currentPlanet.pos.dist(otherPlanet.pos);

        float grav = G * currentPlanet.mass * otherPlanet.mass/sq(d);
        PVector gravVector = otherPlanet.pos.sub(currentPlanet.pos).setMag(grav);


        currentPlanet.applyForce(gravVector);
      }
    }
  }


  for (Planet currentPlanet : planets) {
    currentPlanet.run();
  }
}

void mouseClicked() {
  println(planets.size());
  planets.add(new Planet(new PVector(mouseX, mouseY), new PVector(0, 0), random(10, 200), color(random(0, 255), random(0, 255), random(0, 255))));
}
