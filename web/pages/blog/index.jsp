<%@ page import="indi.zhaiaixn.blog.util.WebContents" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="test"%><%--uri属性确定标签库的位置，prefix属性指定标签库的前缀--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>首页</title>
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700|Archivo+Narrow:400,700" rel="stylesheet" type="text/css">
    <link href="../../resources/css/style.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="../../resources/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">
    <style>
        .pager{
            float: right;
            width: 60%;
            text-align: center;
        }
        .box{
            position: relative;
            top: 24px;
            float: right;
            font-size: 14px;
            color: #999;
            vertical-align: bottom;
        }
        .box i{
            margin-right: 5px;
        }
        .box a{
            display: inline-block;
            margin-right: 15px;
            text-decoration: none;
            color: #999;
        }
        .box a:hover{
            text-decoration: none;
            color: #999;
        }
    </style>
</head>
<body>
<div id="menu-wrapper">
    <div id="menu">
        <ul>
            <li class="current_page_item"><a href="/BlogServlet?state=listBlog">Blog</a></li>
            <li><a href="#">About</a></li>
            <li><a href="https://github.com/zhaiaxin">GitHub</a></li>
        </ul>
    </div>
    <!-- end #menu -->
</div>
<div id="banner-wrapper">
    <div id="banner"><a href="#"><img src="../../resources/images/img01.jpg" width="1200" height="300" alt="" /></a></div>
</div>
<div id="header-wrapper">
    <div id="header">
        <div id="logo">
            <h1><a href="#">Zhai <span>Axin</span></a></h1>
        </div>
    </div>
</div>
<div id="wrapper">
    <!-- end #header -->
    <div id="page">
        <div id="page-bgtop">
            <div id="page-bgbtm">
                <div id="sidebar">
                    <ul>
                        <li>
                            <h2>Search Here:</h2>
                            <div id="search" >
                                <form action="<%=WebContents.queryBlog%>" method="post">
                                    <div>
                                        <input type="text" name="title" id="search-text" placeholder="请输入博客标题" />
                                        <input type="submit" id="search-submit" value="" />
                                    </div>
                                </form>
                            </div>
                            <div style="clear: both;">&nbsp;</div>
                        </li>


                        <li>
                            <h2>Categories</h2>
                            <ul>
                                <c:forEach items="${categoryList}" var="category">
                                <li><a href="<%=WebContents.listByCategory%>&category=${category}">${category}</a></li>
                                </c:forEach>
                            </ul>
                        </li>

                    </ul>
                </div>

                <!-- end #sidebar -->
            <c:forEach items="${blogList}" var="blog">
                <div class="content">
                    <div class="post" style="width: 762px">
                        <h2 class="title">
                            <a href="<%=WebContents.toDetail%>&title=${blog.title}">${blog.title}</a>
                            <div class="box">
                                <i class="fa fa-bell-o"></i><a href="javascript:;">2017-01-01 13：30</a>
                                <i class="fa fa-pencil"></i><a href="javascript:;">编辑</a>
                                <i class="fa fa-close"></i><a href="<%=WebContents.delBlog%>&id=${blog.id}">删除</a>
                            </div>

                        </h2>
                        <p class="meta"><span class="date">${blog.last_modified_time}</span>

                        <div class="entry">
                            ${blog.abstracts}
                        </div>
                    </div>

                </div>
            </c:forEach>
                <!-- end #content -->
                <test:page pagerRange="2" pageSize="${pageSize}" totalPage="${totalPage}" curIndex="${pageIndex}" formId="queryForm"></test:page>

                <div style="clear: both;">&nbsp;</div>
            </div>
        </div>
    </div>
    <!-- end #page -->
</div>
<div id="footer">
    <p>&copy; 2013 Sitename.com. | Photos by <a href="http://fotogrph.com/">Fotogrph</a> | Design by <a href="http://www.freecsstemplates.org/" rel="nofollow">FreeCSSTemplates.org</a>.</p>
</div>
<!-- end #footer -->
</body>
</html>
