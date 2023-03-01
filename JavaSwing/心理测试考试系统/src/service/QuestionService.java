package service;

import dao.QuestionDao;
import domain.Question;
import util.MySpring;

import java.util.ArrayList;

public class QuestionService {

    QuestionDao dao = MySpring.getBean("dao.QuestionDao");

    //获取试卷
    public ArrayList<Question> getPaper(int count){
        return dao.getPaper(count);
    }

    public void saveResult(String result) {
        dao.saveResult(result);
    }

    public void saveQuestion(String question) {
        dao.saveQuestion(question);
    }

}
