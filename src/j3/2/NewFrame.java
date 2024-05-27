import javax.swing.*;
import java.awt.*;


class NewFrame extends JFrame {
  public NewFrame() {
    this.setTitle("New Frame");
    this.loadCommonConfig();
  }

  public NewFrame(String title) {
    this.setTitle(title);
    this.loadCommonConfig();
  }

  private void loadCommonConfig() {
    this.setSize(300, 200);
    this.setLocation(100, 100);
    this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
  }

  public static void main(String[] args) {
    NewFrame frame = new NewFrame("New Frame");
    frame.setVisible(true);
  }
}
