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
                pstmt.setLong(6,blog.getId());
            }
            pstmt.setString(1,blog.getTitle());
            pstmt.setString(2,blog.getAbstracts());
            pstmt.setString(3,blog.getHtml_content());
            pstmt.setString(4,blog.getContent());
            pstmt.setString(5,blog.getCategory());

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
                blog.setLast_modified_time(rs.getTimestamp("last_modified_time"));
                blogList.add(blog);
            }
            connPool.release(rs,pstmt,connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return blogList;
    }

    public Blog selectByTitle(String title){

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
                blog.setId(rs.getInt("id"));
                blog.setTitle(rs.getString("title"));
                blog.setAbstracts(rs.getString("abstracts"));
                blog.setHtml_content(rs.getString("html_content"));
                blog.setContent(rs.getString("content"));
                blog.setCategory(rs.getString("category"));
                blog.setLast_modified_time(rs.getTimestamp("last_modified_time"));
            }
            connPool.release(rs,pstmt,connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return blog;
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
                blog.setLast_modified_time(rs.getTimestamp("last_modified_time"));
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
                blog.setLast_modified_time(rs.getTimestamp("last_modified_time"));
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

    public Long totalPage(String pageSize){

        //总的数据量
        long count=0;
        //总的页数
        long totalPage=0;

        PreparedStatement pstmt = null;

        try{
            this.connection = connPool.getConnection();
            pstmt = connection.prepareStatement(BlogSql.countBlog);
            ResultSet rsCount = pstmt.executeQuery();
            while (rsCount.next()){
                count = rsCount.getInt("count");//获得总数据量
            }

            totalPage = count/Integer.parseInt(pageSize);//总页数=总记录数/每页的记录数

            totalPage = count%Integer.parseInt(pageSize)>0?(totalPage+1):totalPage;//若有余数，则总页数加一；否则不变

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return totalPage;

    }


    public List<Blog> listAllPageing(String pageIndex,String pageSize){


        //数据库检索从start
        int start =(Integer.parseInt(pageIndex)-1)*Integer.parseInt(pageSize);

        List<Blog> blogList = new ArrayList<Blog>();
        PreparedStatement pstmt = null;
        Blog blog = null;

        try{
            this.connection = connPool.getConnection();
            pstmt = connection.prepareStatement(BlogSql.listBlogPageing);
            pstmt.setInt(1,start);
            pstmt.setInt(2,Integer.parseInt(pageSize));
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()){
                blog = new Blog();
                blog.setId(rs.getInt("id"));
                blog.setTitle(rs.getString("title"));
                blog.setAbstracts(rs.getString("abstracts"));
                blog.setContent(rs.getString("content"));
                blog.setCategory(rs.getString("category"));
                blog.setLast_modified_time(rs.getTimestamp("last_modified_time"));
                blogList.add(blog);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return blogList;
    }
}
