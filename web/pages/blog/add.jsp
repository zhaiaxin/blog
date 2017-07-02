<%@ page import="indi.zhaiaixn.blog.util.WebContents" %>
<%@ page import="indi.zhaiaixn.blog.entity.Blog" %>
<%@ page import="indi.zhaiaixn.blog.dao.BlogDao" %>
<%@ page import="indi.zhaiaixn.blog.dao.impl.BlogDaoImpl" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Joiner-Axin
  Date: 2017/7/1
  Time: 9:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>写博客</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/editormd/examples/css/style.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/editormd/css/editormd.css" />
    <style>
        .title{
            display: inline-block;
            width: 80%;
            vertical-align: middle;
            border: none;
            text-align: left;
            padding: 15px 0 15px 90px;
            height: 100px;
            overflow: hidden;
            white-space: nowrap;
            font-size: 46px;
            margin-right: 4.5%;
        }
        .sub{
            display: inline-block;
            width: 10%;
            height: 50px;
            font-size: 24px;
            color: #ffffff;
            background-color: #be1a21;
            text-align: center;
            line-height: 50px;
            border: none;
        }
    </style>
</head>
<body>
    <%
        String title = request.getParameter("title");
        BlogDao blogDao = new BlogDaoImpl();
        List<Blog> blogList = blogDao.queryByTitle(title);
    %>
<div id="layout">
<form action="<%=WebContents.newOrUpdateBlog%>" method="post">
    <input type="hidden" name="id" value="0">
    <input type="hidden" name="abstracts" value="0">
    <input type="hidden" name="category" value="0">
    <header>
        <h1>
            <input type="text" name="title" value="${blogList.title}" placeholder="请填入标题" class="title">
            <input type="submit" value="发表博客" class="sub">
        </h1>
    </header>

    <div id="test-editormd">

        <textarea style="display:none;" name="content">${blogList.content}
        </textarea>

    </div>

</form>


</div>
<script src="<%=request.getContextPath()%>/resources/editormd/examples/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/editormd/editormd.min.js"></script>
<script type="text/javascript">
    var testEditor;

    $(function() {
        testEditor = editormd("test-editormd", {
            width   : "90%",
            height  : 640,
            syncScrolling : "single",
            path    : "<%=request.getContextPath()%>/resources/editormd/lib/",
            saveHTMLToTextarea : true
        });

        /*
         // or
         testEditor = editormd({
         id      : "test-editormd",
         width   : "90%",
         height  : 640,
         path    : "../lib/"
         });
         */
    });
</script>
</body>
</html>
