package jdbc_text;

public class Student {
    private int age;
    private String name;
    private double score;
    private String birthday;
    private String insert_time;

    public void setAge(int age) {
        this.age = age;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public void setInsert_time(String insert_time) {
        this.insert_time = insert_time;
    }

    public int getAge() {
        return age;
    }

    public String getName() {
        return name;
    }

    public double getScore() {
        return score;
    }

    public String getBirthday() {
        return birthday;
    }

    public String getInsert_time() {
        return insert_time;
    }

    @Override
    public String toString() {
        return "name='" + name +
                ",age=" + age + '\'' +
                ", score=" + score +
                ", birthday='" + birthday + '\'' +
                ", inserttime='" + insert_time + '\'' +
                '\n';
    }
}
