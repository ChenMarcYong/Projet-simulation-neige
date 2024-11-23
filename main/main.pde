Grid grid;
ArrayList<Particle> particles;

void setup() {
  size(1000, 1000);
  float cellSize = 50;
  grid = new Grid(width * 1.2, height * 1.2, cellSize);

  // Initialiser quelques particules
  particles = new ArrayList<Particle>();
  for (int i = 0; i < 10000; i++) {
    particles.add(new Particle(random(width), random(- height * 0.1)));
  }
  

}

void draw() {
  background(0);
  grid.clearGrid();
  for (Particle p : particles) grid.addParticle(p);
  for (Particle p : particles) p.findNeighboors(grid);
  for (Particle p : particles)
  {
    p.update();
    p.display();
    p.outScreen();
  } 
  println(particles.get(0).voisins.size());
}
