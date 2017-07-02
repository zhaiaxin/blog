package indi.zhaiaixn.blog.servlet;

import indi.zhaiaixn.blog.dao.UserDao;
import indi.zhaiaixn.blog.dao.impl.UserDaoImpl;
import indi.zhaiaixn.blog.entity.User;
import indi.zhaiaixn.blog.util.WebContents;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 职责
 *
 * @author zhaiaxin
 * @time: 2017/7/1 19:12.
 */
@WebServlet(name = "UserServlet",urlPatterns = "/UserServlet")
public class UserServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doPost(request,response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //使客户端浏览器，区分不同种类的数据，并根据不同的MIME调用浏览器内不同的程序嵌入模块来处理相应的数据。
        response.setContentType("text/html");
        //设置对客户端请求进行重新编码的编码为utf-8
        request.setCharacterEncoding("utf-8");
        //指定对服务器响应进行重新编码的编码为utf-8
        response.setCharacterEncoding("utf-8");

        String state = request.getParameter("state");
        switch (state){
            case "login":
                login(request,response);
                break;

        }

    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDao userDao = new UserDaoImpl();
        User user = userDao.queryByUsername(username);
        RequestDispatcher rd = null;

        if(username.equals("")|| password.equals("")){
            rd = request.getRequestDispatcher(WebContents.toLogin);
            request.setAttribute("msg","用户名或密码为空");
            rd.forward(request,response);

        }else if(user.getPassword().equals(password)){
            HttpSession session = request.getSession();
            session.setAttribute("user",user);
            rd = request.getRequestDispatcher(WebContents.listBlogPaging);
            rd.forward(request,response);

        }else {
            rd = request.getRequestDispatcher(WebContents.toLogin);
            request.setAttribute("msg","用户名或密码错误");
            rd.forward(request,response);
        }

    }

}
