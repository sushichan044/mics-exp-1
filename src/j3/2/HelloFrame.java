import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

// おみくじを引くクラス
class Omikuji {
  final private String[] kuji = {"大吉", "中吉", "小吉", "吉", "凶", "大凶"};

  public String draw() {
    int i = (int) (Math.random() * this.kuji.length);
    return kuji[i];
  }

  public String[] draw10() {
    String[] result = new String[10];
    for (int i = 0; i < 10; i++) {
      int j = (int) (Math.random() * this.kuji.length);
      result[i] = kuji[j];
    }
    return result;
  }
}


class HelloFrame extends JFrame implements ActionListener {
  private JLabel label;
  final private Omikuji omikuji = new Omikuji();
  final private String draw1Label = "おみくじを引く";
  final private String draw10Label = "おみくじを10回引く";

  public HelloFrame() {
    this.setTitle("おみくじβ");
    this.setSize(300, 200);
    this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

    JPanel p = new JPanel();
    GridBagLayout gblayout = new GridBagLayout();
    p.setLayout(gblayout);
    JButton Draw1Button = new JButton(this.draw1Label);
    this.add(Draw1Button, BorderLayout.SOUTH);
    JButton Draw10Button = new JButton(this.draw10Label);
    this.add(Draw10Button, BorderLayout.SOUTH);
    GridBagConstraints gbc = new GridBagConstraints();
    gbc.gridx = 0;
    gbc.gridy = 0;
    gbc.gridwidth = 1;
    gbc.gridheight = 1;
    gbc.weightx = 1.0;
    gbc.weighty = 1.0;
    gbc.fill = GridBagConstraints.BOTH;
    gblayout.setConstraints(Draw1Button, gbc);
    p.add(Draw1Button);
    gbc.gridx = 1;
    gblayout.setConstraints(Draw10Button, gbc);
    p.add(Draw10Button);
    this.add(p, BorderLayout.SOUTH);
    Draw1Button.addActionListener(this);
    Draw10Button.addActionListener(this);

    label = new JLabel(" ", JLabel.CENTER);
    this.add(label, BorderLayout.CENTER);
  }

  public void actionPerformed(ActionEvent ev) {
    final String action = ev.getActionCommand();
    String str = "";

    if (action.equals(this.draw1Label)) {
      str = this.omikuji.draw();
    } else if (action.equals(this.draw10Label)) {
      String[] result = this.omikuji.draw10();
      str = String.join(", ", result);
    } else {
      str = "Unknown command: " + action;
    }

    // htmlとして表示しないと、出力が長いとき改行されずにellipsisが表示される
    this.label.setText("<html><font size='5'>" + str + "</font></html>");
  }

  public static void main(String[] args) {
    HelloFrame f = new HelloFrame();
    f.setVisible(true);
  }
}
