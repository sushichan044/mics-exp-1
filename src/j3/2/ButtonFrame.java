import javax.swing.*;
import java.awt.*;

public class ButtonFrame extends JFrame {
  public ButtonFrame() {
    this.setSize(300, 200);
    this.setLocation(100, 100);
    JButton b = new JButton("OK");
    this.add(b, BorderLayout.SOUTH);

    this.loadCommonConfig();
  }

  private void loadCommonConfig() {
    this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
  }

  public static void main(String[] args) {
    ButtonFrame frame = new ButtonFrame();
    frame.setVisible(true);
  }
}
