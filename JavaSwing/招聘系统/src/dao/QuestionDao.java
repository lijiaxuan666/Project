package dao;

import domain.Question;
import util.QuestionFileReader;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Random;

public class QuestionDao {

    public ArrayList<Question> getPaper(int count) {
        //卷子
        HashSet<Question> paper = new HashSet<>();
        //题库
        ArrayList<Question> questionBank = new ArrayList<>(QuestionFileReader.getQuestion());
        while (paper.size() != count) {
            int index = new Random().nextInt(questionBank.size());//[0, 13)
            paper.add(questionBank.get(index));
        }
        return new ArrayList<>(paper);
    }

    public void saveResult(String result) {
        QuestionFileReader.saveResult(result);
    }

    public void saveQuestion(String question) {
        QuestionFileReader.saveQuestion(question);
    }


}
