
class Tile {
  private int col, row;
  private int x, y;
  private int size = 25;
  private boolean visited = false;
  private boolean[] walls = {false, false, false, false};

  Tile(int row, int col){
     this.row = row;
     this.col = col;  
     this.x = col * size;
     this.y = row * size;
  }
  
  public void show(){
    if(visited){
      fill(0, 255, 0);  
    } else {
      fill(255); 
    }  
    noStroke();
    rect(x + 1,y + 1, size - 1, size - 1);
    drawWalls();
  }
  
  private void drawWalls(){    
    noStroke();
     if(walls[0]){
        //line(x, y, x + size, y); 
     }
     if(walls[1]){
       //line(x + size, y, x + size, y + size);
     }
     if(walls[2]){
       
       //line(x + size, y + size, x, y + size);
     }
     if(walls[3]){
       line(x, y + size, x, y);
     }
  }
 public int getX(){
    return x;
 }
  
  public int getY(){
     return y; 
  }
  
  public int getSize(){
     return size; 
  }
  
  public int getCol(){
     return col; 
  }

  public void setCol(int data){
     col = data;
  }
  
  public int getTileRow(){
     return row; 
  }
  
  public void setTileRow(int data){
      row = data;
  }
  
  public boolean[] getWalls(){
     return walls; 
  }
  
  public void setWalls(int index, boolean state){
     walls[index] = state; 
  }

  public void printWalls(){
    System.out.println(walls[0] + ", "  + walls[1] + ", " + walls[2] + ", " + walls[3]); 
  }

  public void setVisited(){
     visited = true; 
  }
  
  public boolean getVisited(){
     return visited; 
  }
}
