package com.dao;

import com.bean.Article;
import com.bean.TieZi;
import com.bean.XiaoXi;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

//与数据库交互
public class EASYBUY_USERDao {

    //判断用户名密码是否正确
    public static int selectByNM(String name, String pwd, int power) {
        int count = 0;
        ResultSet rs = null;
        Connection conn = Basedao.getconn();
        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement("select count(*) from user where username=? and password=? and power =?");
            ps.setString(1, name);
            ps.setString(2, pwd);
            ps.setInt(3, power);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Basedao.closeall(rs, ps, conn);
        }
        return count;
    }

    //查询文章内容
    public static Article selectArticle(int id) {
        Article article = null;
        ResultSet rs = null;
        Connection conn = Basedao.getconn();
        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement("select * from article where aid=?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                article = new Article(rs.getInt("aid"), rs.getString("title"), rs.getString("cotnet"), rs.getString("time"), rs.getString("file_name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Basedao.closeall(rs, ps, conn);
        }
        return article;
    }

    //查询所有帖子
    public static ArrayList<TieZi> selectTieZi() {
        ArrayList<TieZi> list = new ArrayList<TieZi>();
        ResultSet rs = null;
        Connection conn = Basedao.getconn();
        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement("select * from tiezi");
            rs = ps.executeQuery();
            while (rs.next()) {
                TieZi t = new TieZi(rs.getInt("tid"), rs.getString("time"), rs.getString("type"), rs.getString("title"), rs.getString("status"), rs.getString("user"));
                System.out.println(t.toString());
                list.add(t);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Basedao.closeall(rs, ps, conn);
        }
        return list;
    }

    //根据状态查找对应帖子
    public static ArrayList<TieZi> selectTieZi(String status) {
        ArrayList<TieZi> list = new ArrayList<TieZi>();
        ResultSet rs = null;
        Connection conn = Basedao.getconn();
        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement("select * from tiezi where status=?");
            ps.setString(1, status);
            rs = ps.executeQuery();
            while (rs.next()) {
                TieZi t = new TieZi(rs.getInt("tid"), rs.getString("time"), rs.getString("type"), rs.getString("title"), rs.getString("status"), rs.getString("user"));
                System.out.println(t.toString());
                list.add(t);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Basedao.closeall(rs, ps, conn);
        }
        return list;
    }

    //更新帖子状态
    public static int updateTieZi(int id, String status) {
        String sql = "update tiezi set status=? where tid=?";
        Object[] params = {status, id};
        return Basedao.exectuIUD(sql, params);
    }
    //更新帖子状态
    public static int updateTieZi2(int id, String status) {
        String sql = "update tiezi set status2=? where tid=?";
        Object[] params = {status, id};
        return Basedao.exectuIUD(sql, params);
    }

    //更新消息状态
    public static int updateXiaoXi(int id) {
        String sql = "update xiaoxi set `read` = 1 where xid=?";
        Object[] params = {id};
        return Basedao.exectuIUD(sql, params);
    }

    //删除消息
    public static int deleteXiaoXi(int id) {
        String sql = "delete from xiaoxi where xid=?";
        Object[] params = {id};
        return Basedao.exectuIUD(sql, params);
    }

    //删除帖子
    public static int deleteTieZi(int id) {
        String sql = "delete from tiezi where tid=?";
        Object[] params = {id};
        return Basedao.exectuIUD(sql, params);
    }

    public static int updateTieZi3(int id, String kind,String type,String phone,String title) {
        String sql = "update tiezi set title=?,phone=?,kind=?,type=? where tid=?";
        Object[] params = {title,phone,kind,type, id};
        return Basedao.exectuIUD(sql, params);
    }

    //根据状态查找对应帖子
    public static ArrayList<TieZi> like(String key,String index) {
        ArrayList<TieZi> list = new ArrayList<TieZi>();
        ResultSet rs = null;
        Connection conn = Basedao.getconn();
        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement("select * from tiezi where title like ? and type in(?,?)");
            ps.setString(1, "%"+key+"%");
            if(index.equals("领养")){
                ps.setString(2, "领养");
                ps.setString(3, "送养");
            }else{
                ps.setString(2, "找主人");
                ps.setString(3, "找宠物");
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                TieZi t = new TieZi(rs.getInt("tid"),rs.getString("time"), rs.getString("kind"),rs.getString("type"), rs.getString("phone"), rs.getString("title"), rs.getString("status"),rs.getString("status2"), rs.getString("imag"), rs.getString("user"));
                System.out.println(t.toString());
                list.add(t);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Basedao.closeall(rs, ps, conn);
        }
        return list;
    }

    //根据类型对应帖子
    public static ArrayList<TieZi> selectTieZiByType(String type) {
        ArrayList<TieZi> list = new ArrayList<TieZi>();
        ResultSet rs = null;
        Connection conn = Basedao.getconn();
        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement("select * from tiezi where type=? and status=?");
            ps.setString(1, type);
            ps.setString(2, "已审核");
            rs = ps.executeQuery();
            while (rs.next()) {
                TieZi t = new TieZi(rs.getInt("tid"), rs.getString("time"), rs.getString("kind"),
                        rs.getString("type"), rs.getString("phone"), rs.getString("title"),
                        rs.getString("status"), rs.getString("status2"), rs.getString("imag"), rs.getString("user"));
                System.out.println(t.toString());
                list.add(t);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Basedao.closeall(rs, ps, conn);
        }
        return list;
    }

    //根据类型对应帖子
    public static ArrayList<TieZi> selectTieZiByType(String type, String user) {
        ArrayList<TieZi> list = new ArrayList<TieZi>();
        ResultSet rs = null;
        Connection conn = Basedao.getconn();
        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement("select * from tiezi where type=? and user=?");
            ps.setString(1, type);
            ps.setString(2, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                TieZi t = new TieZi(rs.getInt("tid"), rs.getString("time"), rs.getString("kind"),
                        rs.getString("type"), rs.getString("phone"), rs.getString("title"),
                        rs.getString("status"), rs.getString("status2"), rs.getString("imag"), rs.getString("user"));
                System.out.println(t.toString());
                list.add(t);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Basedao.closeall(rs, ps, conn);
        }
        return list;
    }

    public static ArrayList<TieZi> selectTieZiAll(String index) {
        ArrayList<TieZi> list = new ArrayList<TieZi>();
        ResultSet rs = null;
        Connection conn = Basedao.getconn();
        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement("select * from tiezi where type in(?,?) and status=?");
            if ("领养".equals(index)) {
                ps.setString(1, "领养");
                ps.setString(2, "送养");
                ps.setString(3, "已审核");
            } else {
                ps.setString(1, "找宠物");
                ps.setString(2, "找主人");
                ps.setString(3, "已审核");
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                TieZi t = new TieZi(rs.getInt("tid"), rs.getString("time"), rs.getString("kind"),
                        rs.getString("type"), rs.getString("phone"), rs.getString("title"),
                        rs.getString("status"), rs.getString("status2"), rs.getString("imag"), rs.getString("user"));
                System.out.println(t.toString());
                list.add(t);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Basedao.closeall(rs, ps, conn);
        }
        return list;
    }

    public static ArrayList<TieZi> selectTieZiAllByUser(String user) {
        ArrayList<TieZi> list = new ArrayList<TieZi>();
        ResultSet rs = null;
        Connection conn = Basedao.getconn();
        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement("select * from tiezi where type in(?,?,?,?) and user=?");
            ps.setString(1, "领养");
            ps.setString(2, "送养");
            ps.setString(3, "找主人");
            ps.setString(4, "找宠物");
            ps.setString(5, user);

            rs = ps.executeQuery();
            while (rs.next()) {
                TieZi t = new TieZi(rs.getInt("tid"), rs.getString("time"), rs.getString("kind"),
                        rs.getString("type"), rs.getString("phone"), rs.getString("title"),
                        rs.getString("status"), rs.getString("status2"), rs.getString("imag"), rs.getString("user"));
                System.out.println(t.toString());
                list.add(t);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Basedao.closeall(rs, ps, conn);
        }
        return list;
    }

    //根据类型对应帖子
    public static ArrayList<TieZi> selectTieZiByKind(String kind, String index) {
        ArrayList<TieZi> list = new ArrayList<TieZi>();
        ResultSet rs = null;
        Connection conn = Basedao.getconn();
        PreparedStatement ps = null;
        try {
            if ("领养".equals(index)) {
                ps = conn.prepareStatement("select * from tiezi where kind=? and type in(?,?) and status=?");
                ps.setString(1, kind);
                ps.setString(2, "领养");
                ps.setString(3, "送养");
                ps.setString(4, "已审核");
            } else {
                ps = conn.prepareStatement("select * from tiezi where kind=? and type in(?,?) and status=?");
                ps.setString(1, kind);
                ps.setString(2, "找宠物");
                ps.setString(3, "找主人");
                ps.setString(4, "已审核");
            }

            rs = ps.executeQuery();
            while (rs.next()) {
                TieZi t = new TieZi(rs.getInt("tid"), rs.getString("time"), rs.getString("kind"),
                        rs.getString("type"), rs.getString("phone"), rs.getString("title"),
                        rs.getString("status"), rs.getString("status2"), rs.getString("imag"), rs.getString("user"));
                System.out.println(t.toString());
                list.add(t);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Basedao.closeall(rs, ps, conn);
        }
        return list;
    }

    //根据类型对应帖子
    public static ArrayList<TieZi> selectTieZiByKind2(String kind, String user) {
        ArrayList<TieZi> list = new ArrayList<TieZi>();
        ResultSet rs = null;
        Connection conn = Basedao.getconn();
        PreparedStatement ps = null;
        try {

            ps = conn.prepareStatement("select * from tiezi where kind=? and type in(?,?,?,?) and user=?");
            ps.setString(1, kind);
            ps.setString(2, "领养");
            ps.setString(3, "送养");
            ps.setString(4, "找宠物");
            ps.setString(5, "找主人");
            ps.setString(6, user);

            rs = ps.executeQuery();
            while (rs.next()) {
                TieZi t = new TieZi(rs.getInt("tid"), rs.getString("time"), rs.getString("kind"),
                        rs.getString("type"), rs.getString("phone"), rs.getString("title"),
                        rs.getString("status"), rs.getString("status2"), rs.getString("imag"), rs.getString("user"));
                System.out.println(t.toString());
                list.add(t);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Basedao.closeall(rs, ps, conn);
        }
        return list;
    }

    public static ArrayList<XiaoXi> selectXiaoXi(String user) {
        ArrayList<XiaoXi> list = new ArrayList<XiaoXi>();
        ResultSet rs = null;
        Connection conn = Basedao.getconn();
        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement("select * from xiaoxi where user=?");
            ps.setString(1, user);

            rs = ps.executeQuery();
            while (rs.next()) {
                XiaoXi t=new XiaoXi(Integer.parseInt(rs.getString("xid")),rs.getString("time"),rs.getString("content"),rs.getString("user"),Integer.parseInt(rs.getString("read")));
                System.out.println(t);
                list.add(t);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Basedao.closeall(rs, ps, conn);
        }
        return list;
    }

    //发送消息
    public static int insertXiaoXi(String content,String user) {
        String sql = "insert into xiaoxi values(null,?,?,?,?)";
        String time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        Object[] params = {time,content,user,0};
        return Basedao.exectuIUD(sql, params);
    }

    //发布帖子
    public static int insertTieZi(String kind, String type,String phone,String title,String status2,String imag,String user) {
        String sql = "insert into tiezi values(null,?,?,?,?,?,?,?,?,?)";
        String time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        Object[] params = {time,kind, type,phone,title,"未审核",status2,imag, user};
        return Basedao.exectuIUD(sql, params);
    }

    //注册用户
    public static int insert(String username, String password) {
        String sql = "insert into user values(null,?,?,?)";
        Object[] params = {username, password, 0};
        return Basedao.exectuIUD(sql, params);
    }

}
