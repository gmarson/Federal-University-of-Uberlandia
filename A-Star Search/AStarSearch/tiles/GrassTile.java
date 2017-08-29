
package AStarSearch.tiles;


import AStarSearch.Tile;

import java.awt.*;
/**
 * grassCounter -> quantos tile desse tipo existem no meu mapa
 * cost -> custo associado ao tile
 * code -> caracter associado ao tile
 */
public class GrassTile extends Tile {
    public static int grassCounter = 0;
    public static int cost = 10;
    public static char code = 'G';

    public GrassTile() {
        grassCounter++;
        this.tileCode = code;
        this.setCost(cost);
        this.color = new Color(102, 255, 102);
        Tile.tileCodeMap.put(this.tileCode, this);
    }
}
