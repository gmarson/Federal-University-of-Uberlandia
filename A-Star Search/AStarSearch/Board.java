package AStarSearch;

import java.awt.*;
import java.awt.image.*;
import java.awt.event.*;
import java.util.List;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.Timer;

public class Board extends JPanel implements Runnable, ActionListener{


    //Dimensões
    public static int WIDTH = 800; //42 tiles 16x16
    public static int HEIGHT = 800;

    //game thread
    private Thread thread;
    private boolean running; //Variável para o loop do jogo
    private Timer timer;    //Temporizador para atualizar o jogo
    private int FPS=50;
    private int targetTime = 1000 / FPS;
    private final int DELAY = 300; //Delay para repintar imagem

    //WorldState
    private List<WorldState> states;
    private WorldState currentState;
    private int stateIndex;

    //Image
    private BufferedImage image; //Imagem a ser carregada
    private Graphics2D g; //atributo do tipo Graphics2D que contém métodos para desenhar na tela.


    public Board(List<WorldState> states)
    {
        this.states = states;
        setPreferredSize(new Dimension(WIDTH,HEIGHT));
        setFocusable(true);
        requestFocus();
        addKeyListener(new TAdapter());
        setIgnoreRepaint(true);

        timer = new Timer(DELAY, this);
        timer.start();
    }

//    public void setState(WorldState state) {
//        this.state = state;
//        WIDTH = this.state.map.width * Tile.pixelSize;
//        HEIGHT = this.state.map.height * Tile.pixelSize;
//    }

    public void addNotify()
    {
        super.addNotify();
        if(thread == null)
        {
            thread = new Thread(this);
            thread.start();
        }
    }

    public void run()
    {
        init();
        long startTime;
        long elapsedTime;
        long waitTime;

        while(running)
        {
            startTime = System.nanoTime();
            update();
            render();
            draw();

            elapsedTime = (System.nanoTime() - startTime)/1000000;
            waitTime = targetTime - elapsedTime;

            if(waitTime < 0)
            {
                waitTime = 5;
            }
            try
            {
                Thread.sleep(waitTime);
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        }

    }


    private void init()
    {
        running = true;
        image = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
        g = (Graphics2D) image.getGraphics();
    }

    private void update()
    {
       // gsm.update();

    }

    //Desenha imagem na tela
    private void render()
    {
        WorldState currentState = getCurrentState();
        int agentX = currentState.agentPositionX;
        int agentY = currentState.agentPositionY;

        currentState.map.drawTilesMap(g);

        //Atualiza o desenho do link (Agente do nosso sistema).
        g.drawImage(currentState.getAgentImage().getImage(), agentX * 16, agentY * 16,  null);
    }

    private void draw()
    {
        Graphics g2 = getGraphics();
        g2.drawImage(this.image,0,0,null);
       // g2.drawImage(currentState.getAgentImage().getImage(), currentState.agentPositionX*16, currentState.agentPositionY*16,  null);
        Toolkit.getDefaultToolkit().sync();
        g2.dispose();
    }


    @Override
    public void actionPerformed(ActionEvent e)
    {


    }

    public WorldState getCurrentState() {
        return this.states.get(this.stateIndex);
    }



    private class TAdapter extends KeyAdapter {

        @Override
        public void keyReleased(KeyEvent e) {
        }

        @Override
        public void keyPressed(KeyEvent e) {
            if (e.getKeyCode() == KeyEvent.VK_RIGHT) {
                if (stateIndex < states.size()-1) {
                    stateIndex++;
                }
            } else if (e.getKeyCode() == KeyEvent.VK_LEFT) {
                if (stateIndex > 0) {
                    stateIndex--;
                }
            }
        }
    }


}

