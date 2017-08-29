package AStarSearch.tiles;


import AStarSearch.WorldState;
import AStarSearch.Tile;

import javax.swing.*;
import java.awt.*;
/**
 * intialPendantQty -> quantidade de pingentes no jogo
 * pendantImage ->  classe para guardar a imagem do pingente
 */
public class PendantTile extends Tile {
    public static int initialPendantQty = 0;

    public ImageIcon pendantImage;

    /**
     * @param pendantImage recebe um arquivo imagem que é a representação visual do pingente
     * @param tileCode caractere que vai simbolizar o pingente
     *
     *  A cada pingente criado, a qtd de pingentes é aumentada, um caractere é  atribuído a um pingente
     *  bem como o custo, cor, atualização do hashMap(tileCodeMap), isGoalTile = true pq o pingente é
     *  um objetivo parcial nesse algoritmo pois o Link deve pegar todos antes de se dirigir para o objetivo
     *  final. Tambem é atribuida a imagem do pingente que é diferente a cada instancia de pingente
     */
    public PendantTile(char tileCode, ImageIcon pendantImage) {
        initialPendantQty++;
        this.tileCode = tileCode;
        this.setCost(Tile.minCost);
        this.color = new Color(102, 255, 102);
        Tile.tileCodeMap.put(tileCode, this);
        this.isGoalTile = true;
        this.pendantImage = pendantImage;
        this.image = pendantImage.getImage();
    }


    @Override
    public int getCost(WorldState state) {
        if (state.isPendantCaught(this)) {
            return Integer.MAX_VALUE;
        } else
            return this.getCost();
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

    public WorldState arriveInTile(WorldState state) {
        if (state.isPendantCaught(this)) {
            return state;
        } else {
            state.caughtPendant(this);
            state.goalPositionX = state.map.fixedInitialPositionX;
            state.goalPositionY = state.map.fixedInitialPositionY;
            return state;
        }
    }

    @Override
    public String toString() {
        return this.getCode() + this.getClass().getSimpleName();
    }
}
