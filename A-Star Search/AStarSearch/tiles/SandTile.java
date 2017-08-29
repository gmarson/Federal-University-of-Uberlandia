
package AStarSearch.tiles;


import AStarSearch.Tile;

import java.awt.*;
/**
 * sandCounter -> quantos tile desse tipo existem no meu mapa
 * cost -> custo associado ao tile
 * code -> caracter associado ao tile
 */
public class SandTile extends Tile {
    public static int sandCounter = 0;
    public static int cost = 20;
    public static char code = 'S';

    public SandTile() {
        sandCounter++;
        this.tileCode = code;
        this.setCost(cost);
        this.color = new Color(255,250,205);
        Tile.tileCodeMap.put(this.tileCode, this);
    }
}
