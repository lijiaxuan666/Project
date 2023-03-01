package dao;

import domain.User;
import util.UserFileReader;

//持久层：数据的持久化
public class UserDao {

    //查询一行记录
    public User selectOne(String account){
        return UserFileReader.getUser(account);
    }
    //用户注册
    public void register(String account, String password){
        UserFileReader.register(account,password);
    }


}
