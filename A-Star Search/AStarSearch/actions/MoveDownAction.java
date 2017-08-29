package AStarSearch.actions;


import AStarSearch.Action;
import AStarSearch.Agent;
import AStarSearch.Tile;
import AStarSearch.WorldState;
import AStarSearch.tiles.WallTile;

public class MoveDownAction extends Action
{
    public MoveDownAction(Agent maker) {
        super(maker);
    }

    @Override
    public boolean isLegal(WorldState state) {
        if (state.agentPositionY >= (state.map.height-1)) {
            return false;
        } else {
            Tile destinationTile = state.map.getTile(state.agentPositionX, state.agentPositionY +1);
            if(destinationTile instanceof WallTile) {
                return false;
            } else
                return true;
        }
    }

    @Override
    public WorldState doAction(WorldState state) {
        int x = state.agentPositionX;
        int y = state.agentPositionY;

        if (this.isLegal(state)){
            return state.moveAgent(x, y+1);
        } else
            return null;
    }

    @Override
    public int costOfDoingIt(WorldState state) {
        return state.costOfAgentMovement(state.agentPositionX, state.agentPositionY+1);
    }
}