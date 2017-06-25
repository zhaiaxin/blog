package indi.zhaiaixn.blog.sql;

/**
 * BlogSql语句的封装
 *
 * @author zhaiaxin
 * @time: 2017/6/18 21:41.
 */
public class BlogSql {

    //新增一篇博客
    public static final String newBlog = "INSERT INTO t_blog (title,abstracts,content,category) VALUES(?,?,?,?)";
    //根据id修改博客
    public static final String updateBlog = "UPDATE t_blog SET title = ?,abstracts = ?,content = ?,category = ? WHERE id =?";
    //根据id删除博客
    public static final String delBlog = "DELETE FROM t_blog WHERE id = ?";
//    //根据title查找博客
//    public static final String queryByTitle = "SELECT * FROM t_blog WHERE title = ?";
    //列出所有的博客
    public static final String listAll = "SELECT * FROM t_blog";
    //根据分类查找博客
    public static final String listByCategory = "SELECT * FROM t_blog WHERE category = ?";
    //列出所有的目录
    public static final String listCategory = "SELECT DISTINCT category FROM t_blog";



}
