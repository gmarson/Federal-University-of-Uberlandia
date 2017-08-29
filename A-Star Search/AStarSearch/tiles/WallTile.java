package AStarSearch.tiles;

import AStarSearch.Tile;

import java.awt.*;

public class WallTile extends Tile{
    public static int wallCounter = 0;
    public static int cost = Integer.MAX_VALUE-1;
    public static char code = '0';

    public WallTile() {
        wallCounter++;
        this.tileCode = code;
        this.setCost(cost);
        this.color = new Color(96,96,96);
        Tile.tileCodeMap.put(this.tileCode, this);
    }
}
