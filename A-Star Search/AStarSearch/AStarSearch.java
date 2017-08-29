package AStarSearch;

import java.io.IOException;
import java.util.*;

/**
 *  nextNodesQueue -> fila de prioridade do algoritmo A*
 *  visitedWorldStates -> Hash de nodos visitados, para não expandir nodos desnecessários
 *  actions -> arraylist de actions
 *  heuristics -> é a heristica
 */

public class AStarSearch 
{
    public PriorityQueue<Node> nextNodesQueue = new PriorityQueue<Node>();
    // public Set<Node> visitedNodesSet = new HashSet<>(); //conjunto de nodos visitados. A principal op do conjunto eh saber se existe ou nao elemento nele
    public Set<WorldState> visitedWorldStates = new HashSet<>();
    public List<Action> actions; // como eh o funcionamento do jogador
    public Heuristic heuristic;
    public int numCreatedNodes = 0;
    public int numExpandedNodes = 0;

    /**
     * Construtor que recebe uma lista de ações e a heuristica
     */
    public AStarSearch(List<Action> actions, Heuristic heuristic)
    {
        this.actions = actions;
        this.heuristic = heuristic;
    }

    /**
     * O algoritmo começa definindo o custo inicial em 0 e pegando a heurística inicial dado o initialState
     */
    // public Node(Node node, int pathCost, int heuristicCost, int starCost, WorldState resultState, Action action)
    public List<Action> search(WorldState initialState, WorldState solutionState)
    {

        int initialCost = 0;
        int initialHeuristic = heuristic.getHeuristic(initialState);
        int initialStarCost = initialCost + initialHeuristic;

        //instância do nó que recebe dois null pois um eh referente ao pai e outro  ás ações
        Node initialNode = new Node(null, initialCost, initialHeuristic, initialStarCost, initialState, null);

        //o nó inicial é adicionado à fila de prioridade e são aumentadas as variáveis de nós criados e nós expandidos
        this.nextNodesQueue.add(initialNode);
        numCreatedNodes++;
        numExpandedNodes++;
        Node currentNode;

        //começa a contabilização do tempo de execução do A*
        long startTime = System.currentTimeMillis();
        while(true)
        {
            currentNode = this.nextNodesQueue.poll(); //pool() eu tiro da PriorityQueue

            // o algoritmo para se o currentNode == Null ou seja, nao existem mais nós na fila de prioridade
            if (currentNode == null) {
                return null;
            }

            // o algoritmo tambem para se currentNode == solutionState
            if (isSolution(currentNode, solutionState)) {
                break;
            }


            //dado o nó corrente que será expandido, é retornado uma lista resultante, com no máximo, 4 nós
            //os nós novos são adicionados a priorityQueue
            List<Node> newNodes = expandNode(currentNode);
            for (Node node : newNodes)
            {
                this.nextNodesQueue.add(node);
            }
        }
        
        List<Action> actionsTaken = new ArrayList<>();
        for (Node auxNode = currentNode; auxNode.parent != null ; auxNode = auxNode.parent)
        {
            actionsTaken.add(auxNode.actionTaken);
        }
        Collections.reverse(actionsTaken);

        //contabilização do tempo total de execução so A*
        long stopTime = System.currentTimeMillis();
        long elapsedTime = stopTime - startTime;

        System.out.println("Tempo de Execução do A* :"+elapsedTime+" ms");
        System.out.print("Custo melhor no:  ");
        System.out.println(currentNode.pathCost);
        //System.out.print("Custo \"Estrela\" do melhor no:  ");
        //System.out.println(currentNode.starCost);
        System.out.print("Acoes realizadas:  ");
        System.out.println(actionsTaken.size());
        System.out.print("Nos Criados:  ");
        System.out.println(String.valueOf(this.numCreatedNodes));
        System.out.print("Nos Expandidos:  ");
        System.out.println(String.valueOf(this.numExpandedNodes));

        return actionsTaken;
    }
    
    private boolean isSolution(Node node, WorldState solutionState){
        return node.state.equals(solutionState);
    }


    /**
     * método expande o no de acordo com as actions disponíveis,
     * adiciona o nó expandido à lista dos visitedWorldStates
     */
    private List<Node> expandNode(Node node) {
        List<Node> newNodes = new ArrayList<>(this.actions.size());

        //se o nó a ser expandido ja foi expandido entao nao faço nada
        if (this.visitedWorldStates.contains(node.state)) {
            return newNodes;
        }

        visitedWorldStates.add(node.state);
        this.numExpandedNodes++;

        int parentCost = node.pathCost;
        for (Action action : this.actions)
        {

            if(action.isLegal(node.state))
            {
                int costOfAction = action.costOfDoingIt(node.state);
                WorldState resultState = action.doAction(node.state);
                if (visitedWorldStates.contains(resultState)) {
                    continue;
                }
                int heuristicCost = this.heuristic.getHeuristic(resultState);
                int pathCost = Math.max(costOfAction, Math.max(parentCost, costOfAction + parentCost));
                int starCost = Math.max(pathCost, Math.max(heuristicCost,pathCost + heuristicCost));

                Node newNode = new Node(node, pathCost, heuristicCost, starCost, resultState, action);
                newNodes.add(newNode);
                numCreatedNodes++;
            }
        }
        return newNodes;
    }
}
