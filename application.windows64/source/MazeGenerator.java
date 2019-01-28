import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.Random; 
import java.util.Stack; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class MazeGenerator extends PApplet {




Grid grid = new Grid();
Tile current = grid.getTile(0, 0);
Tile next;
ArrayList<Tile> neighbors;
Random random = new Random();
Stack<Tile> stack = new Stack<Tile>();

public void setup() {
   
  loop();
  frameRate(60);
  background(255);
  current.setVisited();
}

public void draw() {
  
  for(int i = 0; i < grid.getGridLength(); i++) {
    for(int j = 0; j < grid.getGridLength(); j++) {
      grid.showTile(i, j);
      
    }
  }
  
  neighbors = grid.getUnvisitedNeighbors(current.getTileRow(), current.getCol());
  if(neighbors.size() != 0) {
    next = neighbors.get(random.nextInt(neighbors.size()));
    stack.push(current);
    grid.removeWalls(grid.getTile(current.getTileRow(), current.getCol()), grid.getTile(next.getTileRow(), next.getCol()));
    current = next;
    current.setVisited();
    
  } else if(!stack.isEmpty()){
   current = stack.pop(); 
  }
  
  
}

public void mouseClicked(){
noLoop();
}
class Grid {
  private Tile t = new Tile(0, 0);
  private int gridLength = 600 / t.getSize();
  private Tile[][] grid = new Tile[gridLength][gridLength];

  Grid() {
    for (int i = 0; i < gridLength; i++) {
      for (int j = 0; j < gridLength; j++) {
        grid[i][j] = new Tile(i, j);
      }
    }
  }

  public ArrayList<Tile> getUnvisitedNeighbors(int row, int col) {
    ArrayList<Tile> neighbors = new ArrayList<Tile>();
    if (row >= 1 && !grid[row - 1][col].getVisited()) {
      neighbors.add(grid[row - 1][col]);
    }
    if (col < gridLength - 1 && !grid[row][col + 1].getVisited()) {
      neighbors.add(grid[row][col + 1]);
    }
    if ((row < gridLength - 1) && !grid[row + 1][col].getVisited()) {
      neighbors.add(grid[row + 1][col]);
    }
    if (col >= 1 && !grid[row][col - 1].getVisited()) {
      neighbors.add(grid[row][col - 1]); 
    }
    return neighbors;
  }
 
  
  public void removeWalls(Tile curr, Tile next){
    //bottom to top 
    if(curr.getTileRow() - next.getTileRow() == 1){
      curr.setWalls(0, false);
      next.setWalls(2, false);
    }
    //left to right 
    if(curr.getCol() - next.getCol() == -1){
       curr.setWalls(1, false);
       next.setWalls(3, false);
    }
    //top to bottom 
    if(curr.getTileRow() - next.getTileRow() == -1){
      curr.setWalls(2, false);
      next.setWalls(0, false);
    }
    //right to left
    if(curr.getCol() - next.getCol() == 1){
       curr.setWalls(3, false);
       next.setWalls(1, false);
    }
    curr.printWalls();
    next.printWalls();
    System.out.println();
  }

  public Tile getTile(int row, int col) {
     return grid[row][col];
  }

  public void showTile(int row, int col) {
    grid[row][col].show();
  }

  public int getGridLength() {
    return gridLength;
  }

  public void printVisited() {
    for (int i = 0; i < gridLength; i++) {
      for (int j = 0; j < gridLength; j++) {
        System.out.print(grid[i][j].getVisited() + ", ");
      }
      System.out.println();
    }
  }
}

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
  public void settings() {  size(600, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "MazeGenerator" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
