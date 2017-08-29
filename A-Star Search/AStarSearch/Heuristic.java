package AStarSearch;


import AStarSearch.tiles.PendantTile;

public class Heuristic
{

    public int getHeuristic(WorldState state)
    { /// retorna o valor da heurística
        // faço o modulo das diferenças * o menor custo(g) dos possíveis tiles * (qtd de pingentes + 1 - qtd de pingentes que foram pegos) / (qtd de pingentes +1)

        return absoluteDifference(state) * Tile.minCost; //* pendantsWeight(state) ;
        //return 0;
    }

    private int absoluteDifference(WorldState state)
    {
        return (Math.abs(state.goalPositionX - state.agentPositionX) + Math.abs(state.goalPositionY - state.agentPositionY));
    }


    private int pendantsWeight(WorldState state)
    {
        return  ( ((PendantTile.initialPendantQty + 1) - (state.getNumPendantsCaught()) )
                / (PendantTile.initialPendantQty + 1));

    }
}