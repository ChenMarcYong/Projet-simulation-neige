class Particle {
    PVector pos;
    PVector vel;
    ArrayList<Particle> voisins;
    PVector gravity;
    float wind;
    float mass;
    
    boolean IsCollide;

    Particle(float x, float y) {
      pos = new PVector(x, y);
      voisins = new ArrayList<Particle>();
      gravity = new PVector(0, 9.81 / 5);
      wind = random(-0.5, 0.5);
      mass = random(0.65, 1.35);
      vel = new PVector(wind, gravity.y * mass);
      IsCollide = false;
    }

    void display() {
      strokeWeight(4 * mass);
      stroke(255);
      point(pos.x, pos.y);
    }
    
    
    void findNeighboors(Grid g)
    {
      //voisins.clear();
      
      Field f = g.getField(pos);
      if(f != null) voisins = f.particles;
    }
    
    void update()
    {
      pos.x += vel.x;
      pos.y += vel.y;
    }
    
    void outScreen()
    {
      if((pos.x < - 0.1 * width || pos.x > width * 1.1) || ( pos.y > height))
      {
        pos.x = random(width);
        pos.y = - height * 0.1;
      }
    }
}
