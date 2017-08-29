package AStarSearch;


import java.awt.*;
import java.util.HashMap;
import java.util.Map;
import javax.swing.ImageIcon;
/**
 * Classe responsável pela representação de cada quadrado no mapa, ou seja,  cada quadrado é um tile. Os tipos de tiles
 * estão especificados na pasta tiles
 *
 * pixelSize -> tamanho do pixel
 * tileCode -> recebe um char que diz qual o tipo de tile é o objeto
 * minCost -> custo mínimo. Ele começa com MAX_VALUE pra sempre ser trocado no metodo setCost
 * tileCost -> custo do tile
 * tileCodeMap ->  hashMap que associa um objecto da classe Character, ou seja, um caracter a um tile (só será usado para Dungeons e Pendants)
 * isGoalTile -> variavel que verifica se o tile vigente é o tile final
 * isInitialTile -> variavel que verifica se o tile vigente é o tile inicial
 * color -> cor do tile
 * image -> imagem associada ao tile (pode ser o portal , a espada, as dungeons, etc)
 */

public abstract class Tile {

    public static int pixelSize = 16;
    public static int minCost = Integer.MAX_VALUE;
    private int tileCost;
    public char tileCode;
    public static Map<Character, Tile> tileCodeMap = new HashMap<>();
    public boolean isGoalTile = false;
    public boolean isInitialTile = false;
    public Color color = Color.BLUE;
    public Image image;

    /**
     * Construtor simples do tile
     */
    public Tile() {
    }

    /**
     * o método é responsável por preencher o quadrado
     @param g -> objeto do tipo Graphics responsável pela interface grafica
     @param x -> coordenada x
     @param y -> coordenada y
     */
    public void drawTile(Graphics g, int x, int y)
    {
        g.setColor(this.color);
        g.fillRect((x * Tile.pixelSize), (y * Tile.pixelSize), Tile.pixelSize,
                Tile.pixelSize);
        g.setColor(Color.BLACK);
        g.drawRect((x * Tile.pixelSize), (y * Tile.pixelSize), Tile.pixelSize,
                Tile.pixelSize);
    }

    /**
     * @param codeMap
     * asocia o caracter ao tipo do tile
     */
    public static void setCodeMap(Map<Character, Tile> codeMap) {
        tileCodeMap = codeMap;
    }

    /**
     * @param code char de entrada para achar uma instancia de tile
     * método get do hashMap
     */
    public static Tile getTileFromChar(char code) {
        return tileCodeMap.get(code);
    }

    /**
     * getter do char associado ao tile
     */
    public char getCode() {
        return this.tileCode;
    }

    /**
     * setter do char associado ao tile
     */
    public void setCode(char code) {
        this.tileCode = code;
    }

    /**
     * @return o custo do tile
     */
    public int getCost() {
        return this.tileCost;
    }

    /**
     * @return o custo do tile
     * @param state objeto do tipo WorldState. Dado um state, a função
     *              retorna um tileCost
     */
    public int getCost(WorldState state) {
        return this.tileCost;
    }


    /**
     * Se o parametro cost for menor que o custo minimo entao o tileCost recebe o custo minimo
     * @param cost é um custo a ser associado a um tile
     */
    public void setCost(int cost) {
        this.tileCost = cost;
        if (cost < minCost) {
            minCost = cost;
        }
    }

    /**
     * @return state
     * @param state objeto do tipo WorldState. Dado um state, a função retorna o proprio objeto
     * Esse método é sobrescrito nas classes filhas
     */
    public WorldState arriveInTile(WorldState state) {
        return state;
    }

    // nao ta sendo utilizada por enquanto
    public static void setTileCode(char tileCode, Class<? extends Tile> tileClass) {
        //tileCodeMap.put(tileCode, tileClass);
    }

    @Override
    public String toString() {
        return String.valueOf(this.getCode());
    }
}
