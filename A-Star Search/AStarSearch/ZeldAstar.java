
package AStarSearch;

import AStarSearch.actions.MoveDownAction;
import AStarSearch.actions.MoveLeftAction;
import AStarSearch.actions.MoveRightAction;
import AStarSearch.actions.MoveUpAction;
import AStarSearch.tiles.*;

import javax.swing.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ZeldAstar {

    public static void main(String[] args) throws IOException {
        System.out.println();
        System.out.println("    INITIATING  ZeldAStar");
        System.out.println();

        // posição inicial do agente
        int INITIAL_AGENT_POSITION_X = 24;
        int INITIAL_AGENT_POSITION_Y = 27;

        //simbologia adotada para cada dungeon. A esses tiles, serão associados os seguintes símbolos. Eles são necessários para diferenciar as dungeons
        DungeonTile dungeon1Tile = new DungeonTile('#');
        DungeonTile dungeon2Tile = new DungeonTile('$');
        DungeonTile dungeon3Tile = new DungeonTile('%');

        //são declarados os demais Tiles. Eles ja vem com o simbolo definido na classe.
        ForestTile forestTile = new ForestTile();
        GrassTile grassTile = new GrassTile();
        MountainTile mountainTile = new MountainTile();
        SandTile sandTile = new SandTile();
        SwordTile swordTile = new SwordTile();
        WaterTile waterTile = new WaterTile();
        WallTile wallTile = new WallTile();

        //imagens dos pingentes
        ImageIcon pendantc = new ImageIcon("Image/pendant-of-courage.png");
        ImageIcon pendanti = new ImageIcon("Image/pendant-of-wisdom.png");
        ImageIcon pendantp = new ImageIcon("Image/pendant-of-power.png");
        //Image image = pendant1.getImage();

        //declaração dos pingentes
        PendantTile couragePendant = new PendantTile('C', pendantc);
        PendantTile intelligencePendant = new PendantTile('I',pendanti);
        PendantTile powerPendant = new PendantTile('P',pendantp);

        //Caminho para os mapas das dungeons e o mapa inicial
        String dungeon1File = "Maps/Dungeon 1.txt";
        String dungeon2File = "Maps/Dungeon 2.txt";
        String dungeon3File = "Maps/Dungeon 3.txt";
        String initialMapFile = "Maps/Mapa Inicial.txt";

        //instanciando os tiles maps e setando os mapa às variáveis
        TilesMap dungeon1Map = new TilesMap(dungeon1File);
        TilesMap dungeon2Map = new TilesMap(dungeon2File);
        TilesMap dungeon3Map = new TilesMap(dungeon3File);
        dungeon1Tile.setDungeonMap(dungeon1Map);
        dungeon2Tile.setDungeonMap(dungeon2Map);
        dungeon3Tile.setDungeonMap(dungeon3Map);

        // iniciando o mapa inicial e atribuindo as coordenadas iniciais a ele
        TilesMap initialMap = new TilesMap(initialMapFile);
        initialMap.fixedInitialPositionX = INITIAL_AGENT_POSITION_X;
        initialMap.fixedInitialPositionY = INITIAL_AGENT_POSITION_Y;


        // crio dois states, o início e o goal state. Para parar o algoritmo eu sempre verifico se
        // currentState.equals(goalState)
        WorldState initialState = new WorldState(initialMap, INITIAL_AGENT_POSITION_X, INITIAL_AGENT_POSITION_Y, initialMap.fixedGoalPositionX, initialMap.fixedGoalPositionY);
        WorldState goalState = new WorldState(initialMap, initialMap.fixedGoalPositionX, initialMap.fixedGoalPositionY,
                initialMap.fixedGoalPositionX, initialMap.fixedGoalPositionY);
        goalState.caughtPendant(couragePendant);
        goalState.caughtPendant(intelligencePendant);
        goalState.caughtPendant(powerPendant);

        // criação do agente Link
        Agent Link = new Agent();

        //instancio as actions que o Link Pode fazer
        Action downAction = new MoveDownAction(Link);
        Action leftAction = new MoveLeftAction(Link);
        Action rightAction = new MoveRightAction(Link);
        Action upAction = new MoveUpAction(Link);

        //atribuição das actions a um arrayList de Action
        List<Action> actionsList = new ArrayList<>(4);
        actionsList.add(downAction);
        actionsList.add(leftAction);
        actionsList.add(rightAction);
        actionsList.add(upAction);

        //instancia da heuristica
        Heuristic heuristic = new Heuristic();

        // instancia do algoritmo de busca e manda a heristica e as ações possíveis
        // chama o método de busca mandando o initial state e o goal state
        // e espera uma lista com as melhores ações possíveis
        AStarSearch aStar = new AStarSearch(actionsList, heuristic);
        List<Action> bestActions = aStar.search(initialState, goalState);

        //
        List<WorldState> states = new ArrayList<>(bestActions.size());
        states.add(initialState);
        WorldState currentState = initialState;
        for (Action action : bestActions) {
            currentState = action.doAction(currentState);
            states.add(currentState);
        }

        Window window = new Window(states);
    }
}

