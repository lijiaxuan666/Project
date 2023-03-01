package service;

import dao.UserDao;
import domain.User;
import util.MySpring;

//Service业务层
//负责处理读到的数据, 负责处理业务逻辑产生的新数据
public class UserService {

    private UserDao dao = MySpring.getBean("dao.UserDao");

    //登录
    public String login(String account, String password){
        User user = dao.selectOne(account);
        if(user != null && user.getPassword().equals(password)){
            return "登录成功";
        }else{
            return "用户名或密码错误";
        }
    }
    public void register(String account, String password){
        dao.register(account,password);
    }

}
