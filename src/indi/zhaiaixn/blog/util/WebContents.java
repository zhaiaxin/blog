package indi.zhaiaixn.blog.util;

/**
 * jsp页面URL的封装
 *
 * @author zhaiaxin
 * @time: 2017/6/24 11:18.
 */
public class WebContents {

    //博客新增或修改
    public static final String newOrUpdateBlog = "/BlogServlet?state=newOrUpdateBlog";
    //博客列表
    public static final String listBlog = "/BlogServlet?state=listBlog";
//    //博客编辑
//    public static final String updateBlog = "/BlogServlet?state=newOrUpdateBlog";
    //博客标题查询
    public static final String queryBlog = "/BlogServlet?state=queryByTitle";
    //博客分类查询
    public static final String listByCategory = "/BlogServlet?state=listByCategory";
    //博客详情
    public static final String toDetail = "/BlogServlet?state=toDetail";
    //博客删除
    public static final String delBlog = "/BlogServlet?state=delBlog";
    //博客分页
    public static final String listBlogPaging = "/BlogServlet?state=listBlogPaging";

    //用户登录
    public static final String login = "/UserServlet?state=login";

    //跳到add.jsp页面
    public static final String toAdd = "/pages/blog/add.jsp";
    //跳到toLogin.jsp页面
    public static final String toLogin = "/pages/user/login.jsp";


}
