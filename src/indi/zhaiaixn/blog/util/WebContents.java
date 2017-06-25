package indi.zhaiaixn.blog.util;

/**
 * jsp页面URL的封装
 *
 * @author zhaiaxin
 * @time: 2017/6/24 11:18.
 */
public class WebContents {

    //博客新增
    public static final String newBlog = "/BlogServlet?state=newOrUpdateBlog";
    //博客列表
    public static final String listBlog = "/BlogServlet?state=listBlog";
    //博客编辑
    public static final String updateBlog = "/BlogServlet?state=newOrUpdateBlog";
    //博客标题查询
    public static final String queryBlog = "/BlogServlet?state=queryByTitle";
    //博客分类查询
    public static final String listByCategory = "/BlogServlet?state=listByCategory";
    //博客详情
    public static final String toDetail = "/BlogServlet?state=toDetail";
    //博客删除
    public static final String delBlog = "/BlogServlet?state=delBlog";


}
