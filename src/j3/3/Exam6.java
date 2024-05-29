import java.util.ArrayList;

class Student {
  private String id; // 学籍番号
  private String name; // 名前
  private int grade; // 成績

  Student(String id, String name) {
    this.id = id;
    this.name = name;
  }

  Student(String id, String name, int grade) {
    this.id = id;
    this.name = name;
    this.grade = grade;
  }

  /* 成績はあとから変わる可能性があるのでSetterを用意 */
  public void setGrade(int grade) {
    this.grade = grade;
  }

  public String getId() {
    return this.id;
  }

  public String getName() {
    return this.name;
  }

  public int getGrade() {
    return this.grade;
  }

  public void print() {
    System.out.println("ID   : " + this.id);
    System.out.println("Name : " + this.name);
    System.out.println("Grade: " + this.grade);
  }

  public void printShort() {
    System.out.println(this.id + ", " + this.name + ", " + this.grade);
  }
}


class Lesson {
  private String name; // 課題名
  private String teacher; // 担当者
  private ArrayList<Student> st; // Studentの配列

  public Lesson(String name, String teacher, int max) {
    this.name = name;
    this.teacher = teacher;
    this.st = new ArrayList<Student>(); // 配列の確保(オブジェクトは別に生成する必要あり)
  }

  public void add(Student s) {
    this.st.add(s);
    this.sortId();
  }

  public void print() {
    System.out.println("Lesson            : " + this.name);
    System.out.println("Teacher           : " + this.teacher);
    System.out.println("Number of Students: " + this.getStudentsAmount());

    for (Student s : this.st) {
      if (s == null) {
        continue;
      }
      s.printShort();
    }

    System.out.println("----------");
  }

  public int getStudentsAmount() {
    return this.st.size();
  }

  /**
   * Sorts the array of students by their IDs in ascending order.
   */
  public void sortId() {
    st.sort((a, b) -> {
      if (a == null && b == null)
        return 0;
      if (a == null)
        return 1;
      if (b == null)
        return -1;
      return a.getId().compareTo(b.getId());
    });
  }

  /**
   * Sorts the array of students by their names in alphabetical order.
   */
  public void sortName() {
    /* alphabetical order */
    st.sort((a, b) -> {
      if (a == null && b == null)
        return 0;
      if (a == null)
        return 1;
      if (b == null)
        return -1;
      return a.getName().compareTo(b.getName());
    });
  }

  /**
   * Sorts the array of students by their grades in descending order.
   */
  public void sortGrade() {
    st.sort((a, b) -> {
      if (a == null && b == null)
        return 0;
      if (a == null)
        return 1;
      if (b == null)
        return -1;
      return b.getGrade() - a.getGrade();
    });
  }
}


public class Exam6 {
  public static void main(String[] args) {
    Lesson l = new Lesson("Java", "Yamada", 3);

    Student st = new Student("01110", "Yuzuki Jiro", 90);
    Student st2 = new Student("01111", "Suzuki Taro", 80);
    Student st3 = new Student("01112", "Suzuki Saburo", 70);
    Student st4 = new Student("01113", "Suzuki Shiro", 60);

    l.add(st2);
    l.add(st);
    l.add(st3);
    l.add(st4);
    l.print();
  }
}

// 修正点
// 1. ArrayListを使うようになった
// - あわせてsortもArrayList.sortを使うように変更
// - 現在の履修者数はArrayList.size()で取得するように変更
// 2. addメソッド内で自動的に学籍番号の昇順にソートするように変更
