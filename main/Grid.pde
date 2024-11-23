class Grid
{
  Particle p;
  Field[] fields;
  int nWidth, nHeight;
  float h;
  
  public Grid(float w, float ht, float h)
  {
    this.h = h;
    nWidth = ceil(w/h);
    nHeight = ceil(ht/h);
    fields = new Field[nWidth * nHeight];
    for (int i = 0; i < fields.length; i++) fields[i] = new Field();

  }
  
  
  Field getField(PVector pos)
  {
    int iWidth = floor(pos.x / h);
    int iHeight = floor(pos.y / h);
    if ((iWidth >= 0 && iWidth < nWidth) && (iHeight >= 0 && iHeight < nHeight)) return fields[iWidth * nHeight + iHeight];
    return null;
  }
  
  void addParticle(Particle p)
  {
    for(int i = -1; i < 2; i++)
    {
      for(int j = -1; j < 2; j++)
      {
        float x = p.pos.x + h * float(i);
        float y = p.pos.y + h * float(j);
        Field f = getField(new PVector(x, y));
        if(f != null)
        {
          f.particles.add(p);
        }
      }
    }
  }
  
  void clearGrid()
  {
    for(Field f : fields) f.particles.clear();
  }
}

class Field
{
  ArrayList<Particle> particles;
  
  public Field()
  {
    particles = new ArrayList<Particle>();
  }
}
