
class Tile {
  private int col, row;
  private int x, y;
  private int size = 60;
  private boolean visited = false;
  private boolean[] walls = {true, true, true, true};

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
    drawWalls();
    noStroke();
    rect(x + 1,y + 1, size - 1, size - 1);
    
  }
  
  private void drawWalls(){    
     if(walls[0]){
       stroke(0);
       line(x, y, x + size, y); 
     } else {
       stroke(0, 255, 0);
        line(x, y, x + size, y); 
     }
     if(walls[1]){
       stroke(0);
       line(x + size, y, x + size, y + size);
     } else {
       stroke(0, 255, 0);
        line(x + size, y, x + size, y + size);
     }
     if(walls[2] == true){
       stroke(0);
       line(x + size, y + size, x, y + size) ;
     } else {
       stroke(0, 255, 0);
        line(x + size, y + size, x, y + size);
     }
     if(walls[3] == true){
       stroke(0);
       line(x, y + size, x, y);
     } else {
       stroke(0, 255, 0);
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
