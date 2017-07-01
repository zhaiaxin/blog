<%@ page import="indi.zhaiaixn.blog.util.WebContents" %><%--
  Created by IntelliJ IDEA.
  User: Joiner-Axin
  Date: 2017/7/1
  Time: 19:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
</head>
<body>
<form action="<%=WebContents.login%>" method="post">
    <div>
        用户名:<input type="text" name="username">
    </div>
    <div>
        密码:<input type="password" name="password">
    </div>
    <div>
        <input type="submit" name="登录">
    </div>
    <h2>${msg}</h2>
</form>
</body>
</html>
