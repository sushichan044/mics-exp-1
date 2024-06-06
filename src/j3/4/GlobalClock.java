import java.awt.GridLayout;
import java.util.Observable;
import java.util.Observer;
import javax.swing.JLabel;
import javax.swing.JPanel;

@SuppressWarnings("deprecation")
public class GlobalClock extends JPanel implements Observer {
    private TimeObservable timeObservable;
    private int diff;
    private JLabel timeLabel;

    private String getLabelHtml(String text) {
        return "<html><font size='5'>" + text + "</font></html>";
    }

    public GlobalClock(TimeObservable to, String place, int diff) {
        timeObservable = to;
        this.diff = diff;
        timeObservable.addObserver(this);
        timeLabel = new JLabel(this.getLabelHtml(to.getValue(diff)), JLabel.CENTER);
        this.setLayout(new GridLayout(1, 2));
        this.add(new JLabel(this.getLabelHtml(place)));
        this.add(timeLabel);
    }

    public void update(Observable o, Object arg) {
        timeLabel.setText(this.getLabelHtml(timeObservable.getValue(diff)));
    }
}
