package domain;

import java.math.BigDecimal;

public class Question {

    private String name;
    private String intro;
    private String sex;
    private int high;
    private int weight;
    private String hobby;

    public Question(String name, String intro, String sex, int high, int weight, String hobby, String sick) {
        this.name = name;
        this.intro = intro;
        this.sex = sex;
        this.high = high;
        this.weight = weight;
        this.hobby = hobby;
        this.sick = sick;
    }

    public String getIntro() {
        return intro;
    }

    public String getName() {
        return name;
    }

    public String getSex() {
        return sex;
    }

    public int getHigh() {
        return high;
    }

    public int getWeight() {
        return weight;
    }

    public String getHobby() {
        return hobby;
    }

    public String getSick() {
        return sick;
    }

    private String sick;

    public Question(String name, String sex, int high, int weight, String hobby, String sick) {
        this.name = name;
        this.sex = sex;
        this.high = high;
        this.weight = weight;
        this.hobby = hobby;
        this.sick = sick;
    }

    public String equals(Question qu){
        double score=0;
        if(this.sex.equals("无")){
            score +=30;
        }else if(this.sex.equals("男")){
            score += qu.getSex().equals("男")? 30:0;
        }else{
            score += qu.getSex().equals("女")? 30:0;
        }
        System.out.println(score);
        score += Math.max(30 - Math.abs(this.high-qu.getHigh())/2.0,0);
        System.out.println("-"+Math.abs(this.high-qu.getHigh())/2.0);
        System.out.println(score);
        score += Math.max(30 - Math.abs(this.weight-qu.getWeight())/2.0,0);
        System.out.println("-"+Math.abs(this.weight-qu.getWeight())/2.0);
        System.out.println(score);
        score += qu.getSick().equals("无")? 30:0;
        System.out.println(score);
        score += getSimilarityRatio(this.hobby,qu.getHobby()) *3.0/10.0;
        System.out.println(score);
        BigDecimal two1 = new BigDecimal(score/150*100);
        return Double.toString(two1.setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue());
    }

    public static double getSimilarityRatio(String str, String target) {
        int d[][]; // 矩阵
        int n = str.length();
        int m = target.length();
        int i; // 遍历str的
        int j; // 遍历target的
        char ch1; // str的
        char ch2; // target的
        int temp; // 记录相同字符,在某个矩阵位置值的增量,不是0就是1
        if (n == 0 || m == 0) {
            return 0;
        }
        d = new int[n + 1][m + 1];
        for (i = 0; i <= n; i++) { // 初始化第一列
            d[i][0] = i;
        }

        for (j = 0; j <= m; j++) { // 初始化第一行
            d[0][j] = j;
        }

        for (i = 1; i <= n; i++) { // 遍历str
            ch1 = str.charAt(i - 1);
            // 去匹配target
            for (j = 1; j <= m; j++) {
                ch2 = target.charAt(j - 1);
                if (ch1 == ch2 || ch1 == ch2 + 32 || ch1 + 32 == ch2) {
                    temp = 0;
                } else {
                    temp = 1;
                }
                // 左边+1,上边+1, 左上角+temp取最小
                d[i][j] = Math.min(Math.min(d[i - 1][j] + 1, d[i][j - 1] + 1), d[i - 1][j - 1] + temp);
            }
        }

        return (1 - (double) d[n][m] / Math.max(str.length(), target.length())) * 100F;
    }


}
