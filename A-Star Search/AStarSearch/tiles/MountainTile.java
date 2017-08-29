
package AStarSearch.tiles;


import AStarSearch.Tile;

import java.awt.*;
/**
 * mountainCounter -> quantos tile desse tipo existem no meu mapa
 * cost -> custo associado ao tile
 * code -> caracter associado ao tile
 */
public class MountainTile extends Tile {
    public static int mountainCounter = 0;
    public static int cost = 150;
    public static char code = 'M';

    public MountainTile() {
        mountainCounter++;
        this.tileCode = code;
        this.setCost(cost);
        this.color = new Color(156,102,31);
        Tile.tileCodeMap.put(this.tileCode, this);
    }
}
