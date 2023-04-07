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

//�����ݿ⽻��
public class EASYBUY_USERDao {

    //�ж��û��������Ƿ���ȷ
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

    //��ѯ��������
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

    //��ѯ��������
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

    //����״̬���Ҷ�Ӧ����
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

    //��������״̬
    public static int updateTieZi(int id, String status) {
        String sql = "update tiezi set status=? where tid=?";
        Object[] params = {status, id};
        return Basedao.exectuIUD(sql, params);
    }
    //��������״̬
    public static int updateTieZi2(int id, String status) {
        String sql = "update tiezi set status2=? where tid=?";
        Object[] params = {status, id};
        return Basedao.exectuIUD(sql, params);
    }

    //������Ϣ״̬
    public static int updateXiaoXi(int id) {
        String sql = "update xiaoxi set `read` = 1 where xid=?";
        Object[] params = {id};
        return Basedao.exectuIUD(sql, params);
    }

    //ɾ����Ϣ
    public static int deleteXiaoXi(int id) {
        String sql = "delete from xiaoxi where xid=?";
        Object[] params = {id};
        return Basedao.exectuIUD(sql, params);
    }

    //ɾ������
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

    //����״̬���Ҷ�Ӧ����
    public static ArrayList<TieZi> like(String key,String index) {
        ArrayList<TieZi> list = new ArrayList<TieZi>();
        ResultSet rs = null;
        Connection conn = Basedao.getconn();
        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement("select * from tiezi where title like ? and type in(?,?)");
            ps.setString(1, "%"+key+"%");
            if(index.equals("����")){
                ps.setString(2, "����");
                ps.setString(3, "����");
            }else{
                ps.setString(2, "������");
                ps.setString(3, "�ҳ���");
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

    //�������Ͷ�Ӧ����
    public static ArrayList<TieZi> selectTieZiByType(String type) {
        ArrayList<TieZi> list = new ArrayList<TieZi>();
        ResultSet rs = null;
        Connection conn = Basedao.getconn();
        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement("select * from tiezi where type=? and status=?");
            ps.setString(1, type);
            ps.setString(2, "�����");
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

    //�������Ͷ�Ӧ����
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
            if ("����".equals(index)) {
                ps.setString(1, "����");
                ps.setString(2, "����");
                ps.setString(3, "�����");
            } else {
                ps.setString(1, "�ҳ���");
                ps.setString(2, "������");
                ps.setString(3, "�����");
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
            ps.setString(1, "����");
            ps.setString(2, "����");
            ps.setString(3, "������");
            ps.setString(4, "�ҳ���");
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

    //�������Ͷ�Ӧ����
    public static ArrayList<TieZi> selectTieZiByKind(String kind, String index) {
        ArrayList<TieZi> list = new ArrayList<TieZi>();
        ResultSet rs = null;
        Connection conn = Basedao.getconn();
        PreparedStatement ps = null;
        try {
            if ("����".equals(index)) {
                ps = conn.prepareStatement("select * from tiezi where kind=? and type in(?,?) and status=?");
                ps.setString(1, kind);
                ps.setString(2, "����");
                ps.setString(3, "����");
                ps.setString(4, "�����");
            } else {
                ps = conn.prepareStatement("select * from tiezi where kind=? and type in(?,?) and status=?");
                ps.setString(1, kind);
                ps.setString(2, "�ҳ���");
                ps.setString(3, "������");
                ps.setString(4, "�����");
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

    //�������Ͷ�Ӧ����
    public static ArrayList<TieZi> selectTieZiByKind2(String kind, String user) {
        ArrayList<TieZi> list = new ArrayList<TieZi>();
        ResultSet rs = null;
        Connection conn = Basedao.getconn();
        PreparedStatement ps = null;
        try {

            ps = conn.prepareStatement("select * from tiezi where kind=? and type in(?,?,?,?) and user=?");
            ps.setString(1, kind);
            ps.setString(2, "����");
            ps.setString(3, "����");
            ps.setString(4, "�ҳ���");
            ps.setString(5, "������");
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

    //������Ϣ
    public static int insertXiaoXi(String content,String user) {
        String sql = "insert into xiaoxi values(null,?,?,?,?)";
        String time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        Object[] params = {time,content,user,0};
        return Basedao.exectuIUD(sql, params);
    }

    //��������
    public static int insertTieZi(String kind, String type,String phone,String title,String status2,String imag,String user) {
        String sql = "insert into tiezi values(null,?,?,?,?,?,?,?,?,?)";
        String time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        Object[] params = {time,kind, type,phone,title,"δ���",status2,imag, user};
        return Basedao.exectuIUD(sql, params);
    }

    //ע���û�
    public static int insert(String username, String password) {
        String sql = "insert into user values(null,?,?,?)";
        Object[] params = {username, password, 0};
        return Basedao.exectuIUD(sql, params);
    }

}
