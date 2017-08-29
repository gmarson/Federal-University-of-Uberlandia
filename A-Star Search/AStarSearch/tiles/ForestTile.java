
package AStarSearch.tiles;


import AStarSearch.Tile;

import java.awt.*;
/**
 * forestCounter -> quantos tile desse tipo existem no meu mapa
 * cost -> custo associado ao tile
 * code -> caracter associado ao tile
 */
public class ForestTile extends Tile {


    public static int forestCounter = 0;
    public static int cost = 100;
    public static char code = 'F';


    public ForestTile() {
        forestCounter++;
        this.tileCode = code;
        this.setCost(cost);
        this.color = new Color(0, 102, 0);
        Tile.tileCodeMap.put(this.tileCode, this);
    }
}
