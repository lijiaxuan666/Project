package service;

import dao.QuestionDao;
import util.MySpring;


public class QuestionService {

    QuestionDao dao = MySpring.getBean("dao.QuestionDao");

    public void saveQuestion(String question) {
        dao.saveQuestion(question);
    }

}
