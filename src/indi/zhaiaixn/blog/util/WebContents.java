package indi.zhaiaixn.blog.util;

/**
 * jsp页面URL的封装
 *
 * @author zhaiaxin
 * @time: 2017/6/24 11:18.
 */
public class WebContents {

    //博客新增或编辑
    public static final String newOrUpdateBlog = "/BlogServlet?state=newOrUpdateBlog";
    //博客标题查询,去详情页
    public static final String selectBlog = "/BlogServlet?state=selectByTitle";
    //博客删除
    public static final String delBlog = "/BlogServlet?state=delBlog";
    //博客分页
    public static final String listBlogPaging = "/BlogServlet?state=listBlogPaging";
    //跳到add.jsp页面
    public static final String toAddOrUpdate = "/BlogServlet?state=toAddOrUpdate";


    //用户登录
    public static final String login = "/UserServlet?state=login";
    //跳到toLogin.jsp页面
    public static final String toLogin = "/pages/user/login.jsp";


}
