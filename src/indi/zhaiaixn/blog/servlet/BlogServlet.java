package indi.zhaiaixn.blog.servlet;

import indi.zhaiaixn.blog.dao.BlogDao;
import indi.zhaiaixn.blog.dao.impl.BlogDaoImpl;
import indi.zhaiaixn.blog.entity.Blog;
import indi.zhaiaixn.blog.sql.BlogSql;
import indi.zhaiaixn.blog.util.ConnPool;
import indi.zhaiaixn.blog.util.WebContents;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 职责
 *
 * @author zhaiaxin
 * @time: 2017/6/24 10:36.
 */
@WebServlet(name = "BlogServlet",urlPatterns = "/BlogServlet")
public class BlogServlet extends javax.servlet.http.HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws javax.servlet.ServletException, IOException {

        doPost(request,response);

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws javax.servlet.ServletException, IOException {

        //使客户端浏览器，区分不同种类的数据，并根据不同的MIME调用浏览器内不同的程序嵌入模块来处理相应的数据。
        response.setContentType("text/html");
        //设置对客户端请求进行重新编码的编码为utf-8
        request.setCharacterEncoding("utf-8");
        //指定对服务器响应进行重新编码的编码为utf-8
        response.setCharacterEncoding("utf-8");
        //服务器向客户端反馈的时候需要用流向客户端输出数据
        String state = request.getParameter("state");
        switch (state){
            case "newOrUpdateBlog":
                newOrUpdateBlog(request,response);
                break;
            case "delBlog":
                delBlog(request,response);
                break;
            case "queryByTitle":
                queryByTitle(request,response);
                break;
//            case "queryByCategoryOrTitle":
//                queryByCategoryOrTitle(request,response);
//                break;
            case "listByCategory":
                listByCategory(request,response);
                break;
            case "listBlogPaging":
                listBlogPaging(request,response);
                break;
            case "toAddOrUpdate":
                toAddOrUpdate(request,response);
                break;
        }


    }

    private void newOrUpdateBlog(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
        //获取request中所有的参数名及参数值
//        Enumeration enu=request.getParameterNames();
//        while(enu.hasMoreElements()){
//            String paraName=(String)enu.nextElement();
//            paraName = request.getParameter(paraName);
//        }

        Blog blog = new Blog();
        if(request.getParameter("id").equals("")){
            blog.setId(0);
        }else{
            blog.setId(Integer.parseInt(request.getParameter("id")));
        }
        blog.setTitle(request.getParameter("title"));
        blog.setAbstracts(request.getParameter("abstracts"));
        blog.setHtml_content(request.getParameter("html_content"));
        blog.setContent(request.getParameter("content"));
        blog.setCategory(request.getParameter("category"));

        BlogDao blogDao = new BlogDaoImpl();
        RequestDispatcher rd = null;


        if(blogDao.newOrUpdateBlog(blog)){
            rd = request.getRequestDispatcher(WebContents.listBlogPaging);
            rd.forward(request,response);
        }else {
            rd = request.getRequestDispatcher(WebContents.toAddOrUpdate);
            request.setAttribute("msg","新增或修改博客失败！");
            rd.forward(request,response);
        }
    }

    private void delBlog(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{

        int id = Integer.parseInt(request.getParameter("id"));

        BlogDao blogDao = new BlogDaoImpl();//实例化接口和实例化接口的实现？？？？？？？
        RequestDispatcher rd = null;

        if(blogDao.delBlog(id)){
            rd = request.getRequestDispatcher(WebContents.listBlogPaging);
            rd.forward(request,response);
        }else {
            rd = request.getRequestDispatcher(WebContents.listBlogPaging);
            request.setAttribute("msg","删除博客失败");
            rd.forward(request,response);
        }
    }


    private void queryByTitle(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{


        BlogDao blogDao = new BlogDaoImpl();
        Blog blog = blogDao.selectByTitle(request.getParameter("title"));
        List categoryList = blogDao.listCategory();



        request.setAttribute("blog",blog);
        request.setAttribute("categoryList",categoryList);

        RequestDispatcher rd = null;
        rd = request.getRequestDispatcher("/pages/blog/detail.jsp");
        rd.forward(request,response);
    }


    private void listByCategory(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{

        List<Blog> blogList = new ArrayList<>();
        BlogDao blogDao = new BlogDaoImpl();
        blogList = blogDao.listByCategory(request.getParameter("category"));
        List categoryList = blogDao.listCategory();

        request.setAttribute("blogList",blogList);
        request.setAttribute("categoryList",categoryList);

        RequestDispatcher rd = null;
        rd = request.getRequestDispatcher("/pages/blog/index.jsp");
        rd.forward(request,response);
    }


    private void listBlogPaging(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{

        // 获得当前页码数
        String pageIndex = request.getParameter("pageIndex");
        //获得每页显示的数量
        String pageSize = request.getParameter("pageSize");


        if(pageIndex == null||"".equals(pageIndex.trim())){//trim()去掉字符串首尾的空格
            pageIndex="1";
        }

        if(pageSize == null||"".equals(pageSize.trim())){
            pageSize="3";
        }


        BlogDao blogDao = new BlogDaoImpl();

        List<Blog> blogList = blogDao.listAllPageing(pageIndex,pageSize);

        Long totalPage = blogDao.totalPage(pageSize);


        List categoryList = blogDao.listCategory();

        request.setAttribute("categoryList",categoryList);




        /*
           通过目录或者标题进行搜索
         */
        if(request.getParameter("category") != null && request.getParameter("title") == null){

            blogList = blogDao.listByCategory(request.getParameter("category"));

        }else if(request.getParameter("title") != null && request.getParameter("category") == null){

            blogList = blogDao.queryByTitle(request.getParameter("title"));


        }

        request.setAttribute("blogList",blogList);

        request.setAttribute("pageIndex", Long.parseLong(pageIndex));
        request.setAttribute("pageSize", Long.parseLong(pageSize));
        request.setAttribute("totalPage",totalPage);

        RequestDispatcher rd = null;
        rd = request.getRequestDispatcher("/pages/blog/index.jsp");
        rd.forward(request,response);

    }

    private void toAddOrUpdate(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{

        BlogDao blogDao = new BlogDaoImpl();

        Blog blog = blogDao.selectByTitle(request.getParameter("title"));


        request.setAttribute("blog",blog);
        RequestDispatcher rd = null;
        rd = request.getRequestDispatcher("/pages/blog/add.jsp");
        rd.forward(request,response);
    }

}
