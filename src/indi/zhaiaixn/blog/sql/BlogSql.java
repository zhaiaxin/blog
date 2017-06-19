package indi.zhaiaixn.blog.sql;

/**
 * BlogSql语句的封装
 *
 * @author zhaiaxin
 * @time: 2017/6/18 21:41.
 */
public class BlogSql {

    //新增一篇博客
    public static String newBlog = "INSERT INTO t_blog (title,content,category) VALUES(?,?,?)";
    //根据id修改博客
    public static String updateBlog = "UPDATE t_blog SET title = ?,content = ?,category = ? WHERE id =?";
    //根据id删除博客
    public static String delBlog = "DELETE FROM t_blog WHERE id = ?";
    //根据title查找博客
    public static String queryByTitle = "SELECT * FROM t_blog WHERE title = ?";


}
