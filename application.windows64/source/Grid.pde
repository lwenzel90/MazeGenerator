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
