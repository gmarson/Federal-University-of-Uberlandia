
package AStarSearch.tiles;


import AStarSearch.Tile;

import java.awt.*;
/**
 * waterCounter -> quantos tile desse tipo existem no meu mapa
 * cost -> custo associado ao tile
 * code -> caracter associado ao tile
 */
public class WaterTile extends Tile {
    public static int waterCounter = 0;
    public static int cost = 180;
    public static char code = 'W';


    public WaterTile() {
        this.tileCode = code;
        this.setCost(cost);
        this.color = new Color(0,154,205);
        waterCounter++;
        Tile.tileCodeMap.put(this.tileCode, this);
    }
}
