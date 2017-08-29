/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AStarSearch;


import java.util.*;

// Só uso na busca

public class Node implements Comparable<Node>
{
    Node parent;
    int pathCost;
    int heuristicCost;
    int starCost; // f + g
    WorldState state;
    Action actionTaken;


    public Node(Node node, int pathCost, int heuristicCost, int starCost, WorldState resultState, Action action)
    {
        this.parent = node;
        this.pathCost = pathCost;
        this.heuristicCost = heuristicCost;
        this.starCost = starCost;
        this.state = resultState;
        this.actionTaken = action;
    }

    @Override
    public int compareTo(Node o) {
        if(this.starCost > o.starCost)
            return 1;
        else if(this.starCost < o.starCost)
            return -1;
        else
            return 0;
    }
}
