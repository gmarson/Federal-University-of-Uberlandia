package AStarSearch.tiles;

import AStarSearch.Tile;
import AStarSearch.TilesMap;
import AStarSearch.WorldState;

import java.awt.*;
import java.util.Objects;
import javax.swing.ImageIcon;


public class DungeonTile extends Tile {
    /**
     * dungeonMap -> é um objeto do tipo tilesMap, ou seja é o mapa da dungeon quando se entra nela
     * previousMap -> é o mapa principal que fica salvo para quando o personagem sai da dungeon
     * returnPositions ->
     * numOfPendantsWhenEntered -> qtd de pingentes pegos ao entrar na dungeon
     */

    public static int initialDungeonsQty = 0;

    public TilesMap dungeonMap;
    TilesMap previousMap;
    public int numOfPendantsWhenEntered;
    public int returnPositionX;
    public int returnPositionY;

    public ImageIcon dungeonEntry;
   // public static ImageIcon dungeonEntry = new ImageIcon("Image/dungeon-entry.png");

    /**
     * @param tileCode é um char que vai diferenciar os tipos de dungeons
     *  análogo ao PendantTile
     */
    public DungeonTile(char tileCode) {
        Tile.tileCodeMap.put(tileCode, this);
        initialDungeonsQty++;
        this.tileCode = tileCode;
        this.color = new Color(192, 192, 192); //Desenhei o fundo de Sand
        this.isInitialTile = true;
        dungeonEntry = new ImageIcon("Image/dungeon-entry.png");
        this.image = dungeonEntry.getImage();
    }

    public void drawTile(Graphics g, int x, int y)
    {
        g.setColor(this.color); //Desenhei o fundo de Sand
        g.fillRect((x * Tile.pixelSize), (y * Tile.pixelSize), Tile.pixelSize,
                Tile.pixelSize);
        g.setColor(Color.BLACK);
        g.drawRect((x * Tile.pixelSize), (y * Tile.pixelSize), Tile.pixelSize,
                Tile.pixelSize);
        g.drawImage(this.image, x* Tile.pixelSize, y* Tile.pixelSize, null);
    }

    public int getCost(WorldState state) {
        if (!state.isInsideDungeon && state.hasVisitedDungeon(this)) {
            return Integer.MAX_VALUE;
        } else if (state.isInsideDungeon && state.getNumPendantsCaught() <= this.numOfPendantsWhenEntered) {
            return Integer.MAX_VALUE;
        } else {
            return Tile.minCost;
        }
    }

    /**
     * dado um state como parametro essa função é responsável por fazer a mudança
     * de mapa no algoritmo. Se o Link esta dentro da dungeon, quer dizer que ele vai sair da dungeon
     * entao eu saio da dungeon e atualizo a posição do Link.
     * Caso eu queira entrar na dungeon, o privious map será atualizado e será salvo a posição
     * do agente antes de entrar na dungeon
     */
    public WorldState arriveInTile(WorldState state) {
        if(state.isInsideDungeon) {
            state.exitDungeon(this.previousMap);
            state.agentPositionX = this.returnPositionX;
            state.agentPositionY = this.returnPositionY;
        } else {
            this.numOfPendantsWhenEntered = state.getNumPendantsCaught();
            this.previousMap = state.map;
            this.returnPositionX = state.agentPositionX;
            this.returnPositionY = state.agentPositionY;
            state.enterDungeon(this, this.dungeonMap);
        }
        return state;
    }

    public void setDungeonMap(TilesMap dungeonMap) {
        this.dungeonMap = dungeonMap;
    }

    @Override
    public int hashCode() {
        return Objects.hash(this.getCode(), this.dungeonMap);
    }
}
