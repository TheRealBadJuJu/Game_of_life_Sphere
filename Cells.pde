class Cells
{
  Cells()
  {
  }
  void drawCells()
  {
   stroke(55);
    for (int i=0; i<width/cellCount; i++)
    {
      for (int j=0; j<height/cellCount; j++)
      {
        if (cells[i][j] == 1)
        {
          fill(Alive);
        } else
        {
          fill(Dead);
        }
        rect(i*cellCount, j*cellCount, cellCount, cellCount);
      }
    }
  }
  void updateCells()
  {
    if (millis() - lastTime>time)
    {
      iterate();
      lastTime = millis();
    }
  }
  void iterate()
  {
    for (int i = 0; i<width/cellCount; i++)
    {
      for (int j = 0; j<height/cellCount; j++)
      {
        cellBuffer[i][j] = cells[i][j];
      }
    }
    for (int i = 0; i < width/cellCount; i++) 
    { 
      for (int j = 0; j < height/cellCount; j++) 
      { 
        int nextTo = 0;

        for (int x = i -1; x <= i +1; x++) 
        { 
          for (int y = j -1; y <= j +1; y++) 
          {   
            if (((x >= 0) && (x < width/cellCount)) && (( y >= 0) && (y < height/cellCount))) 
            { 
              if (!((i == x) && (j == y))) 
              {  
                if (cellBuffer[x][y] == 1)
                { 
                  nextTo ++;
                }
              }
            }
          }
        } 
        if (cellBuffer[i][j] == 1) 
        { 
          if (nextTo < 2 || nextTo > 3) 
          { 
            cells[i][j] = 0;
          }
        } else 
        {   
          if (nextTo == 3 ) 
          { 
            cells[i][j] = 1;
          }
        }
      }
    }
  }
}