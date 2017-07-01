package indi.zhaiaixn.blog.dao.impl;

import indi.zhaiaixn.blog.dao.BlogDao;
import indi.zhaiaixn.blog.entity.Blog;
import indi.zhaiaixn.blog.sql.BlogSql;
import indi.zhaiaixn.blog.util.ConnPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
                pstmt.setLong(5,blog.getId());
            }
            pstmt.setString(1,blog.getTitle());
            pstmt.setString(2,blog.getAbstracts());
            pstmt.setString(3,blog.getContent());
            pstmt.setString(4,blog.getCategory());

            if(pstmt.executeUpdate() > 0){
                flag = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        connPool.release(null,pstmt,connection);
        return flag;
    }


    public boolean delBlog(int id){

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
        connPool.release(null,pstmt,connection);
        return flag;
    }


    public List<Blog> queryByTitle(String title){

        connection = null;
        PreparedStatement pstmt = null;
        Blog blog = null;
        List<Blog> blogList = new ArrayList<Blog>();
        try{

            this.connection = connPool.getConnection();
            pstmt = connection.prepareStatement("SELECT * FROM t_blog WHERE title LIKE '%" + title + "%'");
//            pstmt.setString(1,title);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                blog = new Blog();
                blog.setId(rs.getInt("id"));
                blog.setTitle(rs.getString("title"));
                blog.setAbstracts(rs.getString("abstracts"));
                blog.setContent(rs.getString("content"));
                blog.setCategory(rs.getString("category"));
                blogList.add(blog);
            }
            connPool.release(rs,pstmt,connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return blogList;
    }


    public List<Blog> listAll(){

        List<Blog> blogList = new ArrayList<Blog>();
        connection = null;
        PreparedStatement pstmt = null;
        Blog blog = null;

        try{
            this.connection = connPool.getConnection();
            pstmt = connection.prepareStatement(BlogSql.listAll);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                blog = new Blog();
                blog.setId(rs.getInt("id"));
                blog.setTitle(rs.getString("title"));
                blog.setAbstracts(rs.getString("abstracts"));
                blog.setContent(rs.getString("content"));
                blog.setCategory(rs.getString("category"));
                blogList.add(blog);
            }
            connPool.release(rs,pstmt,connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return blogList;
    }

    public List<Blog> listByCategory(String category){

        List<Blog> blogList = new ArrayList<Blog>();
        connection = null;
        PreparedStatement pstmt = null;
        Blog blog = null;

        try{
            this.connection = connPool.getConnection();
            pstmt = connection.prepareStatement(BlogSql.listByCategory);
            pstmt.setString(1,category);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                blog = new Blog();
                blog.setId(rs.getInt("id"));
                blog.setTitle(rs.getString("title"));
                blog.setAbstracts(rs.getString("abstracts"));
                blog.setContent(rs.getString("content"));
                blog.setCategory(rs.getString("category"));
                blogList.add(blog);
            }
            connPool.release(rs,pstmt,connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return blogList;
    }

    public List listCategory(){

        List categoryList = new ArrayList<Blog>();
        connection = null;
        PreparedStatement pstmt = null;
        try{
            this.connection = connPool.getConnection();
            pstmt = connection.prepareStatement(BlogSql.listCategory);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                categoryList.add(rs.getString("category"));
            }
            connPool.release(rs,pstmt,connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categoryList;
    }

//    public List<Blog> listAllPageing(String pageIndex,String pageSize,int totalPage){
//
//        if(pageIndex==null||"".equals(pageIndex.trim())){//trim()去掉字符串首尾的空格
//            pageIndex="1";
//        }
//
//        if(pageSize==null||"".equals(pageSize.trim())){
//            pageSize="5";
//        }
//        int start =(Integer.parseInt(pageIndex)-1)*Integer.parseInt(pageSize);
//        //数据库中所有数据的数量
//        int count=0;
//        //总的页数
//
//
//        List<Blog> blogList = new ArrayList<Blog>();
//        PreparedStatement pstmt = null;
//        Blog blog = null;
//
//        try{
//            this.connection = connPool.getConnection();
//            pstmt = connection.prepareStatement(BlogSql.countBlog);
//            ResultSet rsCount = pstmt.executeQuery();
//            while (rsCount.next()){
//              count = rsCount.getInt("count");
//            }
//
//            totalPage = count/Integer.parseInt(pageSize);//总页数=总记录数/每页的记录数
//
//            totalPage = count%Integer.parseInt(pageSize)>0?(totalPage+1):totalPage;//若有余数，则总页数加一；否则不变
//
//
//            pstmt = connection.prepareStatement(BlogSql.listBlogPageing);
//            pstmt.setInt(1,start);
//            pstmt.setInt(2,Integer.parseInt(pageSize));
//            ResultSet rs = pstmt.executeQuery();
//            while (rs.next()){
//                blog = new Blog();
//                blog.setId(rs.getInt("id"));
//                blog.setTitle(rs.getString("title"));
//                blog.setAbstracts(rs.getString("abstracts"));
//                blog.setContent(rs.getString("content"));
//                blog.setCategory(rs.getString("category"));
//                blogList.add(blog);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//        return blogList;
//    }
}
