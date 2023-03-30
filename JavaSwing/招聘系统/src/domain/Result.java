package domain;

public class Result {
    private Question question;
    private String score;

    public Result(Question question, String score) {
        this.question = question;
        this.score = score;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }
}
