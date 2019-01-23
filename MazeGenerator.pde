import java.util.Random;
Grid grid = new Grid();
Tile current = grid.getTile(0, 0);
Tile next;
ArrayList<Tile> neighbors;
Random random = new Random();


void setup() {
  size(600, 600); 
  loop();
  frameRate(10);
  background(255);
  current.setVisited();
}

void draw() {
  clear();
  for(int i = 0; i < grid.getGridLength(); i++) {
    for(int j = 0; j < grid.getGridLength(); j++) {
      grid.showTile(i, j);
      
    }
  }
  
  neighbors = grid.getUnvisitedNeighbors(current.getTileRow(), current.getCol());
  if(neighbors.size() != 0) {
    next = neighbors.get(random.nextInt(neighbors.size()));
    grid.removeWalls(grid.getTile(current.getTileRow(), current.getCol()), grid.getTile(next.getTileRow(), next.getCol()));
    grid.removeAllWalls(current);
    current = next;
    current.setVisited();
    
  } 
  
  
}

void mouseClicked(){
 noLoop(); 
}
