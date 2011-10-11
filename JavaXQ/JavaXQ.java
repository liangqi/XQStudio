import java.applet.Applet;
import java.awt.*;

public class JavaXQ extends Applet
{

    public void drawRedE(int i, int j, Graphics g)
    {
        g.setColor(Color.red);
        g.fillOval(i, j, cx - 2, cy - 2);
        g.setColor(Color.white);
        g.drawLine(i + 9, j + 3, i + 9, j + 3);
        g.drawLine(i + 10, j + 4, i + 10, j + 4);
        g.drawLine(i + 9, j + 5, i + 9, j + 7);
        g.drawLine(i + 8, j + 8, i + 11, j + 8);
        g.fillRect(i + 5, j + 9, 5, 2);
        g.drawLine(i + 10, j + 9, i + 10, j + 9);
        g.fillRect(i + 8, j + 11, 2, 9);
        g.drawLine(i + 10, j + 11, i + 10, j + 12);
        g.drawLine(i + 7, j + 12, i + 7, j + 13);
        g.drawLine(i + 6, j + 14, i + 6, j + 14);
        g.drawLine(i + 5, j + 15, i + 5, j + 15);
        g.drawLine(i + 4, j + 16, i + 4, j + 16);
        g.fillRect(i + 12, j + 9, 2, 6);
        g.drawLine(i + 12, j + 15, i + 12, j + 16);
        g.drawLine(i + 14, j + 8, i + 16, j + 8);
        g.fillRect(i + 17, j + 8, 2, 11);
        g.drawLine(i + 15, j + 10, i + 15, j + 10);
        g.drawLine(i + 14, j + 11, i + 15, j + 11);
        g.drawLine(i + 14, j + 13, i + 15, j + 13);
        g.drawLine(i + 13, j + 16, i + 15, j + 16);
        g.drawLine(i + 16, j + 17, i + 16, j + 17);
        g.drawLine(i + 18, j + 18, i + 18, j + 18);
    }

    public void drawRedK(int i, int j, Graphics g)
    {
        g.setColor(Color.red);
        g.fillOval(i, j, cx - 2, cy - 2);
        g.setColor(Color.white);
        g.drawLine(i + 14, j + 4, i + 14, j + 19);
        g.drawLine(i + 15, j + 4, i + 15, j + 5);
        g.drawLine(i + 12, j + 8, i + 18, j + 8);
        g.drawLine(i + 11, j + 9, i + 11, j + 14);
        g.drawLine(i + 12, j + 9, i + 12, j + 10);
        g.drawLine(i + 17, j + 9, i + 18, j + 9);
        g.drawLine(i + 17, j + 10, i + 17, j + 15);
        g.drawLine(i + 15, j + 14, i + 16, j + 14);
        g.drawLine(i + 16, j + 15, i + 16, j + 15);
        g.drawLine(i + 8, j + 5, i + 9, j + 5);
        g.drawLine(i + 7, j + 6, i + 8, j + 6);
        g.drawLine(i + 6, j + 7, i + 7, j + 7);
        g.drawLine(i + 5, j + 8, i + 6, j + 8);
        g.drawLine(i + 9, j + 8, i + 10, j + 8);
        g.drawLine(i + 9, j + 9, i + 9, j + 9);
        g.drawLine(i + 5, j + 9, i + 5, j + 17);
        g.drawLine(i + 6, j + 10, i + 6, j + 10);
        g.drawLine(i + 8, j + 10, i + 9, j + 10);
        g.drawLine(i + 6, j + 11, i + 8, j + 11);
        g.drawLine(i + 6, j + 13, i + 10, j + 13);
        g.drawLine(i + 8, j + 14, i + 9, j + 14);
        g.drawLine(i + 7, j + 15, i + 9, j + 15);
        g.drawLine(i + 6, j + 16, i + 9, j + 16);
    }

    public void drawRedA(int i, int j, Graphics g)
    {
        g.setColor(Color.red);
        g.fillOval(i, j, cx - 2, cy - 2);
        g.setColor(Color.white);
        g.drawLine(i + 13, j + 5, i + 13, j + 5);
        g.fillRect(i + 14, j + 6, 2, 10);
        g.fillRect(i + 16, j + 10, 3, 2);
        g.fillRect(i + 11, j + 16, 8, 2);
        g.drawLine(i + 10, j + 11, i + 13, j + 11);
        g.drawLine(i + 10, j + 12, i + 10, j + 12);
        g.drawLine(i + 10, j + 17, i + 10, j + 17);
        g.drawLine(i + 9, j + 6, i + 10, j + 6);
        g.fillRect(i + 8, j + 7, 2, 2);
        g.drawLine(i + 7, j + 9, i + 8, j + 9);
        g.drawLine(i + 7, j + 10, i + 7, j + 10);
        g.drawLine(i + 6, j + 11, i + 7, j + 11);
        g.drawLine(i + 5, j + 12, i + 8, j + 12);
        g.drawLine(i + 5, j + 13, i + 5, j + 13);
        g.drawLine(i + 7, j + 13, i + 8, j + 13);
        g.drawLine(i + 4, j + 14, i + 4, j + 14);
        g.drawLine(i + 8, j + 14, i + 8, j + 15);
        g.drawLine(i + 8, j + 17, i + 8, j + 17);
        g.drawLine(i + 7, j + 18, i + 8, j + 18);
    }

    public void drawRedP(int i, int j, Graphics g)
    {
        g.setColor(Color.red);
        g.fillOval(i, j, cx - 2, cy - 2);
        g.setColor(Color.white);
        g.drawLine(i + 14, j + 4, i + 14, j + 4);
        g.drawLine(i + 12, j + 5, i + 15, j + 5);
        g.drawLine(i + 9, j + 6, i + 12, j + 6);
        g.drawLine(i + 9, j + 7, i + 9, j + 13);
        g.drawLine(i + 10, j + 7, i + 10, j + 13);
        g.drawLine(i + 16, j + 7, i + 17, j + 7);
        g.drawLine(i + 13, j + 8, i + 17, j + 8);
        g.drawLine(i + 11, j + 9, i + 15, j + 9);
        g.drawLine(i + 11, j + 10, i + 11, j + 10);
        g.drawLine(i + 13, j + 10, i + 15, j + 10);
        g.drawLine(i + 13, j + 11, i + 13, j + 12);
        g.drawLine(i + 14, j + 11, i + 14, j + 12);
        g.drawLine(i + 11, j + 13, i + 20, j + 13);
        g.drawLine(i + 3, j + 14, i + 20, j + 14);
        g.drawLine(i + 4, j + 15, i + 4, j + 15);
        g.drawLine(i + 20, j + 15, i + 20, j + 15);
        g.drawLine(i + 8, j + 16, i + 9, j + 16);
        g.drawLine(i + 14, j + 16, i + 15, j + 16);
        g.drawLine(i + 6, j + 17, i + 8, j + 17);
        g.drawLine(i + 15, j + 17, i + 17, j + 17);
        g.drawLine(i + 6, j + 18, i + 7, j + 18);
        g.drawLine(i + 16, j + 18, i + 17, j + 18);
        g.drawLine(i + 17, j + 19, i + 17, j + 19);
    }

    public void drawBlkP(int i, int j, Graphics g)
    {
        g.setColor(Color.blue);
        g.fillOval(i, j, cx - 2, cy - 2);
        g.setColor(Color.white);
        g.drawLine(i + 11, j + 4, i + 11, j + 5);
        g.drawLine(i + 12, j + 4, i + 12, j + 7);
        g.drawLine(i + 13, j + 7, i + 16, j + 7);
        g.drawLine(i + 7, j + 8, i + 14, j + 8);
        g.drawLine(i + 8, j + 9, i + 11, j + 9);
        g.drawLine(i + 14, j + 9, i + 15, j + 9);
        g.drawLine(i + 10, j + 10, i + 10, j + 10);
        g.drawLine(i + 13, j + 10, i + 14, j + 10);
        g.drawLine(i + 9, j + 11, i + 11, j + 11);
        g.drawLine(i + 13, j + 11, i + 16, j + 11);
        g.drawLine(i + 7, j + 12, i + 8, j + 12);
        g.drawLine(i + 11, j + 12, i + 12, j + 12);
        g.drawLine(i + 16, j + 12, i + 16, j + 12);
        g.drawLine(i + 11, j + 13, i + 18, j + 13);
        g.drawLine(i + 8, j + 14, i + 19, j + 14);
        g.drawLine(i + 4, j + 15, i + 7, j + 15);
        g.drawLine(i + 4, j + 16, i + 4, j + 16);
        g.drawLine(i + 12, j + 15, i + 12, j + 22);
        g.drawLine(i + 19, j + 15, i + 19, j + 15);
    }

    public void drawBlkE(int i, int j, Graphics g)
    {
        g.setColor(Color.blue);
        g.fillOval(i, j, cx - 2, cy - 2);
        g.setColor(Color.white);
        g.drawLine(i + 11, j + 3, i + 12, j + 3);
        g.drawLine(i + 10, j + 4, i + 14, j + 4);
        g.drawLine(i + 9, j + 5, i + 10, j + 5);
        g.drawLine(i + 13, j + 5, i + 14, j + 5);
        g.drawLine(i + 8, j + 6, i + 8, j + 6);
        g.drawLine(i + 12, j + 6, i + 12, j + 6);
        g.drawLine(i + 6, j + 7, i + 7, j + 7);
        g.drawLine(i + 11, j + 7, i + 15, j + 7);
        g.drawLine(i + 5, j + 8, i + 5, j + 8);
        g.drawLine(i + 7, j + 8, i + 12, j + 8);
        g.drawLine(i + 14, j + 8, i + 16, j + 8);
        g.drawLine(i + 7, j + 9, i + 8, j + 9);
        g.drawLine(i + 11, j + 9, i + 11, j + 9);
        g.drawLine(i + 14, j + 9, i + 15, j + 9);
        g.drawLine(i + 8, j + 10, i + 8, j + 10);
        g.drawLine(i + 11, j + 10, i + 14, j + 10);
        g.drawLine(i + 9, j + 11, i + 14, j + 11);
        g.drawLine(i + 16, j + 11, i + 16, j + 11);
        g.drawLine(i + 10, j + 12, i + 10, j + 12);
        g.drawLine(i + 15, j + 12, i + 16, j + 12);
        g.drawLine(i + 8, j + 13, i + 14, j + 13);
        g.drawLine(i + 7, j + 14, i + 7, j + 14);
        g.drawLine(i + 10, j + 14, i + 13, j + 14);
        g.drawLine(i + 6, j + 15, i + 6, j + 15);
        g.drawLine(i + 9, j + 15, i + 9, j + 15);
        g.drawLine(i + 11, j + 15, i + 14, j + 15);
        g.drawLine(i + 7, j + 16, i + 8, j + 16);
        g.drawLine(i + 10, j + 16, i + 12, j + 16);
        g.drawLine(i + 15, j + 16, i + 16, j + 16);
        g.drawLine(i + 6, j + 17, i + 6, j + 17);
        g.drawLine(i + 9, j + 17, i + 9, j + 17);
        g.drawLine(i + 12, j + 17, i + 12, j + 19);
        g.drawLine(i + 16, j + 17, i + 18, j + 17);
        g.drawLine(i + 6, j + 18, i + 7, j + 18);
        g.drawLine(i + 11, j + 18, i + 11, j + 21);
        g.drawLine(i + 9, j + 20, i + 10, j + 20);
    }

    public void drawBlkA(int i, int j, Graphics g)
    {
        g.setColor(Color.blue);
        g.fillOval(i, j, cx - 2, cy - 2);
        g.setColor(Color.white);
        g.drawLine(i + 12, j + 5, i + 12, j + 5);
        g.drawLine(i + 11, j + 6, i + 11, j + 16);
        g.drawLine(i + 12, j + 6, i + 12, j + 16);
        g.drawLine(i + 13, j + 6, i + 13, j + 7);
        g.drawLine(i + 13, j + 9, i + 13, j + 10);
        g.drawLine(i + 13, j + 11, i + 18, j + 11);
        g.drawLine(i + 7, j + 12, i + 19, j + 12);
        g.drawLine(i + 5, j + 13, i + 9, j + 13);
        g.drawLine(i + 19, j + 13, i + 19, j + 13);
        g.drawLine(i + 9, j + 17, i + 16, j + 17);
        g.drawLine(i + 7, j + 18, i + 8, j + 18);
        g.drawLine(i + 17, j + 18, i + 17, j + 18);
    }

    public void drawR(int i, int j, Graphics g)
    {
        g.drawLine(i + 9, j + 6, i + 14, j + 6);
        g.drawLine(i + 9, j + 7, i + 10, j + 7);
        g.drawLine(i + 8, j + 9, i + 8, j + 11);
        g.drawLine(i + 9, j + 9, i + 10, j + 9);
        g.drawLine(i + 9, j + 11, i + 10, j + 11);
        g.drawLine(i + 8, j + 12, i + 9, j + 12);
        g.drawLine(i + 9, j + 13, i + 11, j + 13);
        g.drawLine(i + 11, j + 8, i + 11, j + 13);
        g.drawLine(i + 13, j + 8, i + 16, j + 8);
        g.drawLine(i + 13, j + 10, i + 13, j + 10);
        g.drawLine(i + 13, j + 12, i + 14, j + 12);
        g.drawLine(i + 15, j + 9, i + 15, j + 13);
        g.drawLine(i + 16, j + 9, i + 16, j + 10);
        g.drawLine(i + 5, j + 15, i + 5, j + 15);
        g.drawLine(i + 13, j + 12, i + 14, j + 12);
        g.drawLine(i + 15, j + 9, i + 15, j + 13);
        g.drawLine(i + 16, j + 9, i + 16, j + 10);
        g.drawLine(i + 5, j + 15, i + 5, j + 15);
        g.drawLine(i + 5, j + 16, i + 6, j + 16);
        g.drawLine(i + 7, j + 15, i + 18, j + 15);
        g.drawLine(i + 17, j + 14, i + 17, j + 14);
        g.drawLine(i + 12, j + 3, i + 12, j + 19);
        g.drawLine(i + 11, j + 20, i + 12, j + 20);
    }

    public void drawC(int i, int j, Graphics g)
    {
        g.drawLine(i + 8, j + 5, i + 8, j + 10);
        g.drawLine(i + 7, j + 9, i + 7, j + 13);
        g.drawLine(i + 9, j + 9, i + 9, j + 9);
        g.drawLine(i + 5, j + 10, i + 5, j + 12);
        g.drawLine(i + 4, j + 11, i + 4, j + 12);
        g.drawLine(i + 6, j + 14, i + 6, j + 16);
        g.drawLine(i + 5, j + 16, i + 5, j + 16);
        g.drawLine(i + 4, j + 17, i + 4, j + 17);
        g.drawLine(i + 8, j + 13, i + 8, j + 14);
        g.drawLine(i + 9, j + 14, i + 9, j + 14);
        g.drawLine(i + 10, j + 8, i + 10, j + 8);
        g.drawLine(i + 10, j + 10, i + 10, j + 17);
        g.drawLine(i + 11, j + 11, i + 11, j + 14);
        g.drawLine(i + 14, j + 5, i + 15, j + 5);
        g.drawLine(i + 13, j + 6, i + 14, j + 6);
        g.drawLine(i + 13, j + 7, i + 13, j + 7);
        g.drawLine(i + 12, j + 8, i + 17, j + 8);
        g.drawLine(i + 11, j + 9, i + 12, j + 9);
        g.drawLine(i + 11, j + 11, i + 14, j + 11);
        g.drawLine(i + 13, j + 12, i + 13, j + 13);
        g.drawLine(i + 12, j + 13, i + 12, j + 14);
        g.drawLine(i + 16, j + 9, i + 16, j + 15);
        g.drawLine(i + 17, j + 9, i + 17, j + 12);
        g.drawLine(i + 15, j + 13, i + 15, j + 15);
        g.drawLine(i + 14, j + 14, i + 14, j + 14);
        g.drawLine(i + 11, j + 18, i + 18, j + 18);
        g.drawLine(i + 19, j + 14, i + 19, j + 18);
        g.drawLine(i + 12, j + 19, i + 18, j + 19);
    }

    public void drawH(int i, int j, Graphics g)
    {
        g.drawLine(i + 13, j + 4, i + 15, j + 4);
        g.drawLine(i + 8, j + 5, i + 15, j + 5);
        g.drawLine(i + 8, j + 6, i + 9, j + 6);
        g.drawLine(i + 11, j + 6, i + 11, j + 11);
        g.drawLine(i + 12, j + 6, i + 12, j + 11);
        g.drawLine(i + 8, j + 8, i + 8, j + 12);
        g.drawLine(i + 9, j + 8, i + 10, j + 8);
        g.drawLine(i + 9, j + 10, i + 10, j + 10);
        g.drawLine(i + 9, j + 11, i + 9, j + 11);
        g.drawLine(i + 13, j + 7, i + 14, j + 7);
        g.drawLine(i + 13, j + 9, i + 15, j + 9);
        g.drawLine(i + 13, j + 10, i + 14, j + 10);
        g.drawLine(i + 10, j + 12, i + 18, j + 12);
        g.drawLine(i + 7, j + 13, i + 10, j + 13);
        g.drawLine(i + 5, j + 16, i + 5, j + 16);
        g.drawLine(i + 6, j + 15, i + 6, j + 17);
        g.drawLine(i + 9, j + 14, i + 9, j + 15);
        g.drawLine(i + 9, j + 16, i + 10, j + 16);
        g.drawLine(i + 11, j + 14, i + 11, j + 14);
        g.drawLine(i + 11, j + 15, i + 12, j + 15);
        g.drawLine(i + 14, j + 14, i + 14, j + 14);
        g.drawLine(i + 14, j + 15, i + 15, j + 15);
        g.drawLine(i + 17, j + 13, i + 17, j + 18);
        g.drawLine(i + 18, j + 13, i + 18, j + 14);
        g.drawLine(i + 16, j + 17, i + 16, j + 17);
        g.drawLine(i + 14, j + 18, i + 16, j + 18);
        g.drawLine(i + 15, j + 19, i + 16, j + 19);
    }

    public void drawBlkC(int i, int j, Graphics g)
    {
        g.setColor(Color.blue);
        g.fillOval(i, j, cx - 2, cy - 2);
        g.setColor(Color.white);
        drawC(i, j, g);
    }

    public void drawBlkH(int i, int j, Graphics g)
    {
        g.setColor(Color.blue);
        g.fillOval(i, j, cx - 2, cy - 2);
        g.setColor(Color.white);
        drawH(i, j, g);
    }

    public void drawBlkR(int i, int j, Graphics g)
    {
        g.setColor(Color.blue);
        g.fillOval(i, j, cx - 2, cy - 2);
        g.setColor(Color.white);
        drawR(i, j, g);
    }

    public void drawRedR(int i, int j, Graphics g)
    {
        g.setColor(Color.red);
        g.fillOval(i, j, cx - 2, cy - 2);
        g.setColor(Color.white);
        drawR(i, j, g);
    }

    public void drawRedH(int i, int j, Graphics g)
    {
        g.setColor(Color.red);
        g.fillOval(i, j, cx - 2, cy - 2);
        g.setColor(Color.white);
        drawH(i, j, g);
    }

    public void drawRedC(int i, int j, Graphics g)
    {
        g.setColor(Color.red);
        g.fillOval(i, j, cx - 2, cy - 2);
        g.setColor(Color.white);
        drawC(i, j, g);
    }

    public void drawBlkK(int i, int j, Graphics g)
    {
        g.setColor(Color.blue);
        g.fillOval(i, j, cx - 2, cy - 2);
        g.setColor(Color.white);
        g.drawLine(i + 6, j + 7, i + 6, j + 9);
        g.drawLine(i + 7, j + 6, i + 7, j + 7);
        g.drawLine(i + 7, j + 9, i + 10, j + 9);
        g.drawLine(i + 5, j + 10, i + 7, j + 10);
        g.drawLine(i + 5, j + 12, i + 5, j + 13);
        g.drawLine(i + 6, j + 12, i + 13, j + 12);
        g.drawLine(i + 6, j + 13, i + 6, j + 16);
        g.drawLine(i + 5, j + 16, i + 5, j + 17);
        g.drawLine(i + 9, j + 5, i + 10, j + 5);
        g.drawLine(i + 9, j + 6, i + 9, j + 18);
        g.drawLine(i + 8, j + 11, i + 8, j + 11);
        g.drawLine(i + 14, j + 4, i + 14, j + 5);
        g.drawLine(i + 12, j + 6, i + 13, j + 6);
        g.drawLine(i + 16, j + 6, i + 17, j + 6);
        g.drawLine(i + 12, j + 7, i + 16, j + 7);
        g.drawLine(i + 11, j + 8, i + 12, j + 8);
        g.drawLine(i + 15, j + 8, i + 15, j + 8);
        g.drawLine(i + 12, j + 9, i + 14, j + 9);
        g.drawLine(i + 13, j + 10, i + 13, j + 10);
        g.drawLine(i + 11, j + 11, i + 19, j + 11);
        g.drawLine(i + 16, j + 9, i + 16, j + 20);
        g.drawLine(i + 18, j + 12, i + 19, j + 12);
        g.drawLine(i + 11, j + 14, i + 12, j + 14);
        g.drawLine(i + 11, j + 15, i + 13, j + 15);
        g.drawLine(i + 13, j + 18, i + 13, j + 18);
        g.drawLine(i + 14, j + 19, i + 15, j + 19);
    }
 
    public void drawBoard(Graphics g)
    {
        g.setColor(backColor);
        g.fillRect(0, 0, cx * 12, cy * 15);
        g.setColor(foreColor);
        
        // Draw border
        g.setColor(Color.gray);
        g.drawRect(3, 3, boardW - 6, boardH - 6);
        g.setColor(Color.white);
        g.drawRect(4, 4, boardW - 6, boardH - 6);
        g.setColor(foreColor);
        
        // Draw H line
        for(int i = 0; i < 10; i++)  drawBoardLine(g, 0, i, 8, i);
        
        // Draw V line
        drawBoardLine(g, 0, 0, 0, 9);
        for(int i = 1; i < 8; i++)
        {
            drawBoardLine(g, i, 0, i, 4);
            drawBoardLine(g, i, 5, i, 9);
        }
        drawBoardLine(g, 8, 0, 8, 9);

        // Draw X pos        
        drawX(g, 1, 2);
        drawX(g, 7, 2);
        for(int j = 0; j < 9; j += 2)
        {
            drawX(g, j, 3);
            drawX(g, j, 6);
        }
        drawX(g, 1, 7);
        drawX(g, 7, 7);

        // Draw King pos
        drawBoardLine(g, 3, 0, 5, 2);
        drawBoardLine(g, 3, 2, 5, 0);
        drawBoardLine(g, 3, 9, 5, 7);
        drawBoardLine(g, 3, 7, 5, 9);
    }

    public void drawX(Graphics g, int i, int j)
    {
        byte byte0 = 4;
        int k = x0 + cx * i;
        int l = y0 + cy * j;
        if(i > 0)
        {
            g.drawLine(k - 2, l - cy / byte0, k - 2, l - 2);
            g.drawLine(k - 2, l + cy / byte0, k - 2, l + 2);
            g.drawLine(k - cx / byte0, l - 2, k - 2, l - 2);
            g.drawLine(k - cx / byte0, l + 2, k - 2, l + 2);
        }
        if(i < 8)
        {
            g.drawLine(k + 2, l - cy / byte0, k + 2, l - 2);
            g.drawLine(k + 2, l + cy / byte0, k + 2, l + 2);
            g.drawLine(k + cx / byte0, l - 2, k + 2, l - 2);
            g.drawLine(k + cx / byte0, l + 2, k + 2, l + 2);
        }
    }

    public void paint(Graphics g)
    {
    	if (isPaintBusy) return;
    	isPaintBusy = true;
        if(offScreen == null)
        {
            offScreen = createImage(cx * 12, cy * 15);
            offGraphics = offScreen.getGraphics();
            offGraphics.setFont(getFont());
            offGraphics.setColor(getBackground());
        }
        drawBoard(offGraphics);
        drawPosition(offGraphics);
        g.drawImage(offScreen, 0, 0, null);
        lblStepNo.setText(stepNo + "/" + stepNum);
        isPaintBusy = false;
    }

    void drawPiece(Graphics g, char pieceChar, int xPos, int yPos)
    {
    	if (isRedAtBottom)
    	{
    	    yPos = 9 - yPos;
    	}
    	else
        {
            xPos = 8 - xPos; 	
        }    	
        int x = (x0 + cx * xPos) - cx / 2 + 1;
        int y = (y0 + cy * yPos) - cy / 2 + 1;
        switch(pieceChar)
        {
            case 'r': drawBlkR(x, y, g); return;
            case 'h': drawBlkH(x, y, g); return;
            case 'c': drawBlkC(x, y, g); return;
            case 'k': drawBlkK(x, y, g); return;
            case 'a': drawBlkA(x, y, g); return;
            case 'e': drawBlkE(x, y, g); return;
            case 'p': drawBlkP(x, y, g); return;
            case 'R': drawRedR(x, y, g); return;
            case 'H': drawRedH(x, y, g); return;
            case 'C': drawRedC(x, y, g); return;
            case 'K': drawRedK(x, y, g); return;
            case 'A': drawRedA(x, y, g); return;
            case 'E': drawRedE(x, y, g); return;
            case 'P': drawRedP(x, y, g); return;
        }
    }
    
    public void drawBoardLine(Graphics g, int xPos1, int yPos1, int xPos2, int yPos2)
    {
        g.drawLine(x0 + cx * xPos1, y0 + cy * yPos1, x0 + cx * xPos2, y0 + cy * yPos2);    	
    }

    void drawPosition(Graphics g)
    {
    	for (int i = 0; i < 32; i++) pieceCurrXY[i] = pieceInitXY[i];
    	
    	// Get current position
    	for (int iStep = 0; iStep < stepNo; iStep++)
    	{
    	    for (int i = 0; i < 32; i++)
    	    {
    	    	if (pieceCurrXY[i] == stepListXYt[iStep]) pieceCurrXY[i] = 100;
    	        if (pieceCurrXY[i] == stepListXYf[iStep]) pieceCurrXY[i] = stepListXYt[iStep];	
    	    }
    	}
    	
    	for (int i = 0; i < 32; i++)
    	{
    	    if (pieceCurrXY[i] > 89) continue;
    	    drawPiece(g, pieceName.charAt(i), pieceCurrXY[i]/10, pieceCurrXY[i]%10);    	    
    	}
    }

    public void init()
    {
        setLayout(null);
        setBackground(backColor);
        isRedAtBottom = true;

        btnSwitchSide = new Button("@");
        btnShowLast   = new Button("#");
        hsbStepNo     = new Scrollbar(0, 0, 1, 0, 30);
        lblStepNo     = new Label("0/0");
        btnBack       = new Button("<");
        btnNext       = new Button(">");

        add(btnSwitchSide);
        add(btnShowLast);
        add(hsbStepNo);
        add(lblStepNo);
        add(btnBack);
        add(btnNext);

        int y = ((y0 + cy * 10) - cy / 2) + 4;
        
        btnSwitchSide.reshape(14, y, 15, 19);
        btnShowLast.reshape(32, y, 15, 19);
        hsbStepNo.reshape(50, y, 100, 19);
        lblStepNo.reshape(153, y, 45, 19);
        lblStepNo.setAlignment(1);
        btnBack.reshape(201, y, 15, 19);
        btnNext.reshape(219, y, 15, 19);
                
        String s;
        
        // Init "Position" param
        if ((s = getParameter("Position")) == null)
        {
            s = "I0,H0,G0,F0,E0,D0,C0,B0,A0,H2,B2,I3,G3,E3,C3,A3|A9,B9,C9,D9,E9,F9,G9,H9,I9,B7,H7,A6,C6,E6,G6,I6"; 
        }
        for(int i = 0; i < 32; i++) 
        {  
            pieceInitXY[i] = 100;
            if ((s.charAt(i * 3) >= 'A') && (s.charAt(i * 3) <= 'I'))
            {
                pieceInitXY[i] = (s.charAt(i * 3) - 'A') * 10 + (s.charAt(i * 3 + 1) - '0');
            }
        }
       
        // Init "MoveList" param
        if((s = getParameter("MoveList")) != null)
        {
            int iStep = 0;
            for (int i=0; i < s.length(); i+=6, iStep++)
            {
                stepListXYf[iStep] = (s.charAt(i    ) - 'A') * 10 + (s.charAt(i + 1) - '0'); 
                stepListXYt[iStep] = (s.charAt(i + 3) - 'A') * 10 + (s.charAt(i + 4) - '0');            
            }
            stepNum = iStep;
            hsbStepNo.setValues(hsbStepNo.getValue(), 1, hsbStepNo.getMinimum(), stepNum + 1);
            hsbStepNo.setPageIncrement((stepNum < 5)?1:(stepNum/5));        
        }
    }

    public boolean handleEvent(Event event)
    {
        if(event.target.equals(hsbStepNo))
        {
            stepNo = hsbStepNo.getValue();
            paint(getGraphics());
            return true;
        } 
        else
        {
            return super.handleEvent(event);
        }
    }

    public boolean action(Event event, Object obj)
    {
        if(obj.equals("@"))
        {
    	    isRedAtBottom = !isRedAtBottom;
            paint(getGraphics());
            return true;
        }
        else if(obj.equals(">"))
        {
            if(stepNo < stepNum)
            {
                hsbStepNo.setValue(hsbStepNo.getValue() + 1);
                stepNo = hsbStepNo.getValue();
                paint(getGraphics());
                return true;
            }
        } 
        else if(obj.equals("<"))
        {
            if(stepNo > 0)
            {
                hsbStepNo.setValue(hsbStepNo.getValue() - 1);
                stepNo = hsbStepNo.getValue();
                paint(getGraphics());
                return true;
            }
        } 
        return super.action(event, obj);
    }

    private Scrollbar hsbStepNo;
    private Button btnSwitchSide;
    private Button btnShowLast;
    private Label lblStepNo;
    private Button btnNext;
    private Button btnBack;
    private int x0 = 20;
    private int y0 = 20;
    private int cx = 26;
    private int cy = 26;
    private int boardW = 247;
    private int boardH = 299;
    private Color foreColor = Color.white;
    private Color backColor = new Color(153, 204, 153);
    private Color boxColor;

    private int    pieceInitXY[] = new int[32];
    private int    pieceCurrXY[] = new int[32];
    private String pieceName = "RHEAKAEHRCCPPPPPrheakaehrccppppp";

    private int stepNo = 0;
    private int stepNum = 0;
    private boolean isRedAtBottom;
    private int stepListXYf[] = new int[512];
    private int stepListXYt[] = new int[512];
    
    private boolean isPaintBusy = false;
    private Image offScreen;
    private Graphics offGraphics;
}
