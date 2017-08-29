package AStarSearch;


public abstract class Action {

    Agent maker;

    public Action(Agent maker) {
        this.maker = maker;
    }

    public abstract boolean isLegal(WorldState state);
    public abstract WorldState doAction(WorldState state);
    public abstract int costOfDoingIt(WorldState state);

    @Override
    public String toString() {
        return this.getClass().getSimpleName();
    }
}
