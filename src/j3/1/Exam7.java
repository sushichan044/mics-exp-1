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
  private int max; // 最大履修者数
  private int num; // 登録履修者数
  private Student[] st; // Studentの配列

  public Lesson(String name, String teacher, int max) {
    this.name = name;
    this.teacher = teacher;
    this.max = max;
    this.num = 0; // numは0に初期化
    this.st = new Student[max]; // 配列の確保(オブジェクトは別に生成する必要あり)
  }

  public void add(Student s) {
    this.st[this.num++] = s;
  }

  public void print() {
    System.out.println("Lesson            : " + this.name);
    System.out.println("Teacher           : " + this.teacher);
    System.out.println("Number of Students: " + this.num);

    for (Student s : this.st) {
      if (s == null) {
        continue;
      }
      s.printShort();
    }

    System.out.println("----------");
  }
}


public class Exam7 {
  public static void main(String[] args) {
    Lesson l = new Lesson("Math", "Tanaka", 3);
    Student s1 = new Student("01200", "Suzuki", 90);
    Student s2 = new Student("01201", "Yuzuki", 80);
    Student s3 = new Student("01202", "Shinosawa", 70);
    l.add(s1);
    l.add(s2);
    l.add(s3);
    l.print();
  }
}

// 実行結果
// Lesson : Math
// Teacher : Tanaka
// Number of Students: 3
// 01200, Suzuki, 90
// 01201, Yuzuki, 80
// 01202, Shinosawa, 70
// ----------
