import java.util.Random;
import java.util.Stack;

Grid grid = new Grid();
Tile current = grid.getTile(0, 0);
Tile next;
ArrayList<Tile> neighbors;
Random random = new Random();
Stack<Tile> stack = new Stack<Tile>();

void setup() {
  size(600, 600); 
  loop();
  frameRate(60);
  background(255);
  current.setVisited();
}

void draw() {
  
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

void mouseClicked(){
noLoop();
}
