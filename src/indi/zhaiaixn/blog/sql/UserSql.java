package indi.zhaiaixn.blog.sql;

/**
 * Created by Joiner-Axin on 2017/6/13.
 */
public class UserSql {
    //添加用户
    public static String newUser = "INSERT INTO t_user (username,password,introduction,photo) VALUES(?,?,?,?)";
    //根据用户名查找用户
    public static String queryByUsername = "SELECT * FROM t_user WHERE username = ?";
}
