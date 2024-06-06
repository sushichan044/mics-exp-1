import java.util.Observable;
import javax.swing.Timer;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

@SuppressWarnings("deprecation")
public class TimeObservable extends Observable implements ActionListener {
    private Timer timer;
    // 現在時刻を保持するインスタンス変数
    private int hour, min, sec;

    public TimeObservable() {
        // 1秒毎にactionPerformedを呼び出す
        timer = new Timer(1000, this);
        timer.start();
    }

    public void actionPerformed(ActionEvent arg0) {
        this.setValue();
    }

  void setValue() {
    // 現在時刻を取得
    long time = System.currentTimeMillis();
    // 時間に変換
    time /= 1000;
    time %= 86400;
    hour = (int) (time / 3600);
    min = (int) ((time % 3600) / 60);
    sec = (int) (time % 60);
    // 変更を通知
    setChanged();
    notifyObservers();
  }

  String getValue(int diff) {
    int h = (hour + diff) % 24;
    int m = min;
    int s = sec;
    if (h < 0) {
      h += 24;
    }
    return String.format("%02d:%02d:%02d", h, m, s);
  }
}
