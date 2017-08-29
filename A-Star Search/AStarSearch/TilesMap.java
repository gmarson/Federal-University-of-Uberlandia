package AStarSearch;
import AStarSearch.tiles.*;

import java.awt.*;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Scanner;
import javax.swing.ImageIcon;

public class TilesMap {

    /**
     * tilesMatrix -> matriz que vai armazenar o mapa onde cada local eh um tile
     * width, height -> dimensoes de cada mapa
     * tilesString -> matriz que armazena o mapa em forma de caracteres dos tiles
     * fixedS -> são as posições finais e iniciais de objetivo e do jogador. Isso facilita
     * na hr de trocar o mapa
     */

    List<List<Tile>> tilesMatrix = new ArrayList<>();

    public int width;
    public int height;
    public String tilesString;

    public int fixedInitialPositionX;
    public int fixedInitialPositionY;

    public int fixedGoalPositionX;
    public int fixedGoalPositionY;

    /**
     * @param fileName  diretorio do mapa
     *                 o método pega esse diretório e monta as matrizes
     */
    public TilesMap(String fileName) throws IOException
    {
        //this.tilesMatrix.add(new ArrayList<>());
        try
        {
            String map = TilesMap.readMapFromFile(fileName);
            Scanner s = new Scanner(map);
            Scanner teste = new Scanner(System.in);
            List<Tile> tileLine = new ArrayList<>();
            char tileChar;
            this.tilesString = "";
            int positionY = 0;
            int positionX = 0;
            while(s.hasNextLine())
            {
                String line = s.nextLine();
                this.tilesString = this.tilesString + "\n" + line;
                //System.out.println(this.tilesString);

                //teste.nextLine();
                line = line.replaceAll("\\s+","");
                for(positionX=0; positionX<line.length(); positionX++)
                {
                    tileChar = line.charAt(positionX);
                    Tile newTile = Tile.getTileFromChar(tileChar);
                    if (newTile.isGoalTile) {
                        this.fixedGoalPositionX = positionX;
                        this.fixedGoalPositionY = positionY;
                    }
                    if (newTile.isInitialTile) {
                        this.fixedInitialPositionX = positionX;
                        this.fixedInitialPositionY = positionY;
                    }
                    tileLine.add(newTile);
                }

                this.tilesMatrix.add(tileLine);

                tileLine = new ArrayList<>();
                positionY++;
            }
            s.close();
            this.width = positionX;//this.tilesMatrix.size();
            this.height = positionY;//this.tilesMatrix.get(0).size();
        }
        catch(IOException e)
        {
            e.printStackTrace();
        }
    }

    //vou retornar o mapa normal


    public void printTileMatrix()
    {
        for(List<Tile> tiles: this.tilesMatrix)
        {
            for(Tile tile: tiles)
            {
                System.out.print(tile.getCode());
                System.out.print("  ");
            }
            System.out.println();
        }
    }


    /* RETURNS
    "X X X X X X
    X X X X X X" */
    private static String readMapFromFile(String filename) throws IOException {
        String content = null;
        File file = new File(filename); //for ex foo.txt
        FileReader reader = null;

        try
        {
            reader = new FileReader(file);
            char[] chars = new char[(int) file.length()];
            reader.read(chars);
            content = new String(chars);
            reader.close();
        }

        catch (IOException e)
        {
            e.printStackTrace();
        }

        finally
        {
            if(reader !=null) {reader.close();}
        }

        return content;
    }

    public int costOfPosition(int newPositionX, int newPositionY, WorldState state) {
        return this.getTile(newPositionX, newPositionY).getCost(state);
    }


    /**
     * esse método vai retornar o proximo state do grafo. A arrive in tile ta verificando se eu passo em cima
     * de um pingente ou se entro ou saio de dungeons
     */
    public WorldState arriveInPosition(int newPositionX, int newPositionY, WorldState state) {
        return this.getTile(newPositionX, newPositionY).arriveInTile(state);
    }

    public Tile getTile(int positionX, int positionY) {
        return tilesMatrix.get(positionY).get(positionX);
    }

    public void setTile(int positionX, int positionY, Tile tile) {
        tilesMatrix.get(positionY).set(positionX, tile);
    }


    public String getTilesString()
    {
        return this.tilesString;
    }

    @Override
    public int hashCode() {
        return Objects.hash(this.width, this.height, this.tilesString, this
                .fixedInitialPositionX, this.fixedInitialPositionY, this.fixedGoalPositionX, this
                .fixedGoalPositionY);
    }


    public void drawTilesMap(Graphics g)
    {
        int x=0;
        int y=0;
        for(List<Tile> tiles: this.tilesMatrix)
        {
            for(Tile tile: tiles)
            {
                tile.drawTile(g,x,y);
                x++;
            }
            y++;
            x=0;
        }
    }
}
