package indi.zhaiaixn.blog.dao.impl;

import indi.zhaiaixn.blog.dao.BlogDao;
import indi.zhaiaixn.blog.entity.Blog;
import indi.zhaiaixn.blog.sql.BlogSql;
import indi.zhaiaixn.blog.util.ConnPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * BlogDao的方法底部实现
 *
 * @author zhaiaxin
 * @time: 2017/6/18 20:39.
 */
public class BlogDaoImpl implements BlogDao{

    private ConnPool connPool;
    private Connection connection;

    public BlogDaoImpl(){
        this.connPool = new ConnPool();
    }

    /**
     * 增加或者修改博客
     * @param blog
     * @return
     */
    public boolean newOrUpdateBlog(Blog blog){

        boolean flag = false;
        connection = null;
        PreparedStatement pstmt = null;
        try{
            this.connection = connPool.getConnection();
            if(blog.getId() == 0 ){
                pstmt = connection.prepareStatement(BlogSql.newBlog);
            }else {
                pstmt = connection.prepareStatement(BlogSql.updateBlog);
                pstmt.setLong(4,blog.getId());
            }
            pstmt.setString(1,blog.getTitle());
            pstmt.setString(2,blog.getContent());
            pstmt.setString(3,blog.getCategory());

            if(pstmt.executeUpdate() > 0){
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    /**
     * 根据id删除博客
     * @param id
     * @return
     */
    public boolean delBlog(long id){

        boolean flag = false;
        connection = null;
        PreparedStatement pstmt = null;
        try{
            this.connection = connPool.getConnection();
            pstmt = connection.prepareStatement(BlogSql.delBlog);
            pstmt.setLong(1,id);
            if (pstmt.executeUpdate() > 0){
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    /**
     * 根据title去查找博客
     * @param title
     * @return
     */
    public Blog queryByTitle(String title){

        connection = null;
        PreparedStatement pstmt = null;
        Blog blog = null;
        try{
            this.connection = connPool.getConnection();
            pstmt = connection.prepareStatement(BlogSql.queryByTitle);
            pstmt.setString(1,title);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                blog = new Blog();
                blog.setId(rs.getLong("id"));
                blog.setTitle(rs.getString("title"));
                blog.setContent(rs.getString("content"));
                blog.setCategory(rs.getString("category"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return blog;
    }
}
