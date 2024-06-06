import java.awt.GridLayout;
import java.util.ArrayList;
import javax.swing.JFrame;

public class GlobalClockPanel extends JFrame {
    private ArrayList<GlobalClock> clocks = new ArrayList<GlobalClock>();

    public GlobalClockPanel() {
        this.setTitle("Global Clock");
        this.setSize(600, 400);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        TimeObservable t = new TimeObservable();
        clocks.add(new GlobalClock(t, "Tokyo", 9));
        clocks.add(new GlobalClock(t, "London", 0));

        this.hydrateClocks();
    }

    private void hydrateClocks() {
        this.setLayout(new GridLayout(2,this.clocks.size()));
        for (GlobalClock clock : this.clocks) {
            this.add(clock);
        }
    }

    public static void main(String[] args) {
        GlobalClockPanel frame = new GlobalClockPanel();
        frame.setVisible(true);
    }
}
