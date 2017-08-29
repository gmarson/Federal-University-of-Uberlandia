package AStarSearch.actions;


import AStarSearch.Action;
import AStarSearch.Agent;
import AStarSearch.Tile;
import AStarSearch.WorldState;
import AStarSearch.tiles.WallTile;

public class MoveRightAction extends Action
{
    public MoveRightAction(Agent maker) {
        super(maker);
    }

    @Override
    public boolean isLegal(WorldState state) {
        if (state.agentPositionX >= (state.map.width - 1)) {
            return false;
        } else {
            Tile destinationTile = state.map.getTile(state.agentPositionX +1, state.agentPositionY);
            if (destinationTile instanceof WallTile) {
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
            return state.moveAgent(x+1, y);
        } else
            return null;
    }

    @Override
    public int costOfDoingIt(WorldState state) {
        return state.costOfAgentMovement(state.agentPositionX+1, state.agentPositionY);
    }
}
