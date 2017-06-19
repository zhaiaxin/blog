package indi.zhaiaixn.blog.dao.impl;

import indi.zhaiaixn.blog.dao.UserDao;
import indi.zhaiaixn.blog.entity.User;
import indi.zhaiaixn.blog.sql.UserSql;
import indi.zhaiaixn.blog.util.ConnPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by Joiner-Axin on 2017/6/13.
 */
public class UserDaoImpl implements UserDao{

    private ConnPool connPool;
    private Connection conn;

    public UserDaoImpl(){
        this.connPool = new ConnPool();
    }

    /**
     * 新增一个用户
     * @param user
     * @return
     */
    public boolean newUser(User user){

        boolean flag = false;
        conn = null;
        PreparedStatement pstmt = null;
        try{
            this.conn = connPool.getConnection();
            pstmt = conn.prepareStatement(UserSql.newUser);
            pstmt.setString(1,user.getUsername());
            pstmt.setString(2,user.getPassword());
            pstmt.setString(3,user.getIntroduction());
            pstmt.setString(4,user.getPhoto());
            if(pstmt.executeUpdate()>0){
                flag = true;
            }
            connPool.release(null,pstmt,conn);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    /**
     * 根据用户名查找用户
     * @param username
     * @return
     */
    public User queryByUsername(String username){

        User user = null;
        conn = null;
        PreparedStatement pstmt = null;
        try{
            this.conn = connPool.getConnection();
            pstmt = conn.prepareStatement(UserSql.queryByUsername);
            pstmt.setString(1,username);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                user = new User();
                user.setId(rs.getLong("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setIntroduction(rs.getString("introduction"));
                user.setPhoto(rs.getString("photo"));
            }
            connPool.release(rs,pstmt,conn);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;

    }

}
