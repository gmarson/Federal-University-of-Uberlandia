package AStarSearch;

import AStarSearch.tiles.DungeonTile;
import AStarSearch.tiles.PendantTile;

import javax.swing.ImageIcon;

import java.util.*;
import java.util.List;

public class WorldState
{// Representação do nosso estado : uma matriz de tiles(classe, eh tipo a classe que todos herdarão, "azulejo" ) e a posição em que o agente(classe) está.

    /**
     * agentImage -> imagem do Link
     * map -> matriz de Tiles
     * pendantsCaught ->
     * isInsideDungeon -> variável de controle para ver se o Link está dentro de uma dungeon
     * actionsCounter -> contador de ações feitas pelo Link
     * agent e goal positions -> posições do agente e do estado final
     */
    public static ImageIcon agentImage = new ImageIcon("Image/link.png");

    public TilesMap map;

    public Set<PendantTile> pendantsCaught = new LinkedHashSet<>(PendantTile.initialPendantQty);
    public boolean isInsideDungeon = false;
    public Set<DungeonTile> dungeonsVisited = new LinkedHashSet<>(DungeonTile.initialDungeonsQty);

    public int actionsCounter = 0;

    public int agentPositionX;
    public int agentPositionY;

    public int goalPositionX;
    public int goalPositionY;

    /**
     * constroi um objecto worldstate dado a posicção do agente e a posição em que o agente deve estar
     */
    WorldState(TilesMap map, int agentPositionX, int agentPositionY, int goalPositionX, int goalPositionY) {
        this.map = map;
        this.agentPositionX = agentPositionX;
        this.agentPositionY = agentPositionY;
        this.goalPositionX = goalPositionX;
        this.goalPositionY = goalPositionY;
    }


    WorldState(WorldState state) {
        this.dungeonsVisited = new LinkedHashSet<>(state.dungeonsVisited);
        this.map = state.map;
        this.pendantsCaught = new LinkedHashSet<>(state.pendantsCaught);
        this.isInsideDungeon = state.isInsideDungeon;
        this.actionsCounter = state.actionsCounter;
        this.agentPositionX = state.agentPositionX;
        this.agentPositionY = state.agentPositionY;
        this.goalPositionX = state.goalPositionX;
        this.goalPositionY = state.goalPositionY;
    }


    /**
     * @param newPositionX posição x em que esta o Link
     * @param newPositionY  posição y em que esta o Link
     * O método moveAgent retorna um worldState dadas as novas posições do Link
     * Naturalmente, a cada vez que Link movimenta, o actionsCounter é incrementado
     * A função arriveInPosition atualiza a posição no mapa e manda um novo state
     * Toda a vez que eu mudar de posição, eu tenho que verificar se essa posição é um dungeon
     * Isso é feito em Tile->DungeonTile
     */
    public WorldState moveAgent(int newPositionX, int newPositionY) {
        WorldState newState = new WorldState(this);
        newState.agentPositionX = newPositionX;
        newState.agentPositionY = newPositionY;
        newState.actionsCounter++;
        return newState.map.arriveInPosition(newPositionX, newPositionY, newState);
    }

    public int costOfAgentMovement(int newPositionX, int newPositionY) {
        return this.map.costOfPosition(newPositionX, newPositionY, this);
    }


    /**
     * setter de um mapa a um worldstate
     */
    public void setTilesMap(TilesMap map) {
        this.map = map;
    }


    /**
     * Nesse método ocorre a mudança de mapa. Esse método é invocado nas entradas e saídas das dungeons
     */
    public void changeMap (TilesMap newMap) {
        this.map = newMap;

        this.agentPositionX = newMap.fixedInitialPositionX;
        this.agentPositionY = newMap.fixedInitialPositionY;

        this.goalPositionX = newMap.fixedGoalPositionX;
        this.goalPositionY = newMap.fixedGoalPositionY;
    }

    /**
     * Ao entrar na dungeon, a variavel de verificação vai pra true
     */
    public void enterDungeon(DungeonTile dungeonTile, TilesMap dungeonMap) {
        this.dungeonsVisited.add(dungeonTile);
        this.isInsideDungeon = true;
        this.changeMap(dungeonMap);
    }

    /**
     * quando sair da dungeon tem como argumento o tilesmap anterior
     */
    public void exitDungeon(TilesMap previousMap) {
        this.isInsideDungeon = false;
        this.changeMap(previousMap);
    }

    public boolean hasVisitedDungeon(DungeonTile dungeon) {
        return dungeonsVisited.contains(dungeon);
    }

    //retorna o mapa e a localização do agente
    public String getWorldStateString()
    {
        int positionX=0, positionY =0;
        String worldAgentTile = this.map.getTilesString();
        worldAgentTile = worldAgentTile.replaceAll("\\s+","");
        for(int i=0; i<worldAgentTile.length();i++)
        {
            if( worldAgentTile.charAt(i) == '\n')
            {
                positionY++;
                if (positionY == this.agentPositionY)
                {
                    while(positionX < this.agentPositionX)
                    {
                        positionX++;
                    }
                    positionY = i;
                    break;
                }
            }
        }
        StringBuilder finalWorldAgentTile = new StringBuilder(worldAgentTile);
        finalWorldAgentTile.setCharAt(positionY+positionX, '@');

        return finalWorldAgentTile.toString() ;
    }

    /**
     * Metodo equals sobrescrito pra ver se um worldState é igual ao outro
     */
    @Override
    public boolean equals(Object obj) {
        if(obj instanceof WorldState) {
            WorldState state = (WorldState) obj;
            if ( (this.getNumPendantsCaught() == state.getNumPendantsCaught()) &&
                    (this.isInsideDungeon == state.isInsideDungeon) &&
                    (this.agentPositionX == state.agentPositionX) &&
                    (this.agentPositionY == state.agentPositionY) &&
                    (this.goalPositionX == state.goalPositionX) &&
                    (this.goalPositionY == state.goalPositionY) ) {
                return true;
            }
        }
        return false;
    }

    @Override
    public int hashCode() {
        return Objects.hash( this.isInsideDungeon, this.pendantsCaught, this.agentPositionX, this
                .agentPositionY, this.goalPositionX, this.goalPositionY, this.map, this.dungeonsVisited);
    }

    public ImageIcon getAgentImage() { return this.agentImage; }

    /**
     * @return o numero de pingentes pegos
     */
    public int getNumPendantsCaught() {
        return this.pendantsCaught.size();
    }


    public boolean isPendantCaught(PendantTile pendant) {
        return this.pendantsCaught.contains(pendant);
    }

    /**
     * adiciono o pingente pego à minha lista de pingentes
     */
    public void caughtPendant(PendantTile pendant) {
        this.pendantsCaught.add(pendant);
    }
}
