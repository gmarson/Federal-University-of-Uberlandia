package AStarSearch;

import javax.swing.*;
import java.awt.*;
import java.io.IOException;
import java.util.*;
import java.util.List;


public class Window extends JFrame {

    Board board;

    public Window(List<WorldState> states) {
        super();
        JFrame window = new JFrame("ZeldAStar");
        window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.board = new Board(states);
        window.setContentPane(board);
        window.setResizable(false);
        window.setVisible(true);
        window.setSize(1024, 720);
        //this.update(g);
    }

//    public void setStateOfBoard(WorldState state) {
//        this.board.setState(state);
//    }
}


