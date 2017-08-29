package AStarSearch.tiles;


import AStarSearch.Tile;
import AStarSearch.WorldState;

import javax.swing.*;
import java.awt.*;

public class SwordTile extends Tile {
    public static int cost = Integer.MAX_VALUE;
    public static char code = '+';

    public ImageIcon mastersword;

    public SwordTile() {
        this.tileCode = code;
        this.setCost(cost);
        this.color = new Color(102, 255, 102); //fundo grass
        Tile.tileCodeMap.put(this.tileCode, this);
        this.isGoalTile = true;
        mastersword = new ImageIcon("Image/master-sword.png");
        this.image = mastersword.getImage();
    }

    public void drawTile(Graphics g, int x, int y)
    {
        g.setColor(this.color);
        g.fillRect((x * Tile.pixelSize), (y * Tile.pixelSize), Tile.pixelSize,
                Tile.pixelSize);
        g.setColor(Color.BLACK);
        g.drawRect((x * Tile.pixelSize), (y * Tile.pixelSize), Tile.pixelSize,
                Tile.pixelSize);
        g.drawImage(this.image, x* Tile.pixelSize, y* Tile.pixelSize, null);
    }
    public int getCost(WorldState state) {
        if (state.getNumPendantsCaught() == PendantTile.initialPendantQty)
            return Tile.minCost;
        else
            return this.getCost();
    }
}
