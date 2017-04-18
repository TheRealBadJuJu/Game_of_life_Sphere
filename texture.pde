class Texture
{
  Texture()
  {
  }
  void draw()
  {
  
    pushMatrix();
    {
      translate(width/2, height/2, -500);
      rotateY(RotateY+=1*rotateYMag);
      rotateX(RotateX+=1*rotateXMag);
      shape(Sphere);
    }
    popMatrix();
  }
  void textureSphere()
  {

    Sphere.setTexture(tex);
  }
}