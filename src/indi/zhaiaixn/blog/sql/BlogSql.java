package indi.zhaiaixn.blog.sql;

/**
 * BlogSql语句的封装
 *
 * @author zhaiaxin
 * @time: 2017/6/18 21:41.
 */
public class BlogSql {

    //新增一篇博客
    public static final String newBlog = "INSERT INTO t_blog (title,abstracts,html_content,content,category) VALUES(?,?,?,?,?)";
    //根据id修改博客
    public static final String updateBlog = "UPDATE t_blog SET title = ?,abstracts = ?,html_content = ?,content = ?,category = ? WHERE id =?";
    //根据id删除博客
    public static final String delBlog = "DELETE FROM t_blog WHERE id = ?";
    //根据title查找博客
    public static final String queryByTitle = "SELECT * FROM t_blog WHERE title = ?";
//    public static final String queryByTitle = "SELECT * FROM t_blog WHERE title LIKE CONCAT('%','?','%')";
    //列出所有的博客
    public static final String listAll = "SELECT * FROM t_blog";
    //根据分类查找博客
    public static final String listPageingByCategory = "SELECT * FROM t_blog WHERE category = ? limit ?,?";
    //列出所有的目录
    public static final String listCategory = "SELECT DISTINCT category FROM t_blog";
    //统计博客数量
    public static final String countBlog = "SELECT count(1) as count from t_blog";//1代表这个查询的表里的第一个字段id
    //检索start+1到pageSize的博客
    public static final String listBlogPageing = "SELECT * FROM t_blog limit ?,?";



}
