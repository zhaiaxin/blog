/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : db_blog

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-07-03 15:46:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_blog
-- ----------------------------
DROP TABLE IF EXISTS `t_blog`;
CREATE TABLE `t_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `title` varchar(20) DEFAULT NULL COMMENT '博客名称',
  `abstracts` varchar(255) DEFAULT NULL COMMENT '博客摘要',
  `html_content` text COMMENT '博客内容html形式',
  `content` text COMMENT '博客内容',
  `category` varchar(10) DEFAULT NULL COMMENT '博客分类',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_blog
-- ----------------------------
INSERT INTO `t_blog` VALUES ('25', '数据库多表连接查询', '数据库多表查询', '<h3 id=\"h3--strong-strong-\"><a name=\"<strong>感觉写的太好了，一没忍住就转了</strong>\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span><strong>感觉写的太好了，一没忍住就转了</strong></h3><blockquote>\r\n<p>原文地址<br><a href=\"http://www.cnblogs.com/devilmsg/archive/2009/03/24/1420543.html\">http://www.cnblogs.com/devilmsg/archive/2009/03/24/1420543.html</a></p>\r\n</blockquote>\r\n<p>学习<strong>数据库查询</strong>的时候对<strong>多表连接查询</strong>的有些概念还比较模糊。而连接查询是在数据库查询操作的时候肯定要用到的。对于此概念<br>我用通俗一些的语言和例子来进行讲解。这个例子是我讲课的时候经常采用的例子。<br><code>首先我们做两张表：员工信息表和部门信息表，在此，表的建立只为讲述连接的概念，所以字段非常的简单javascript</code></p>\r\n<hr>\r\n<p><strong>EmployeeTB（员工信息表）：</strong> </p>\r\n<table>\r\n<thead>\r\n<tr>\r\n<th>employeeid</th>\r\n<th style=\"text-align:center\">employeename</th>\r\n<th style=\"text-align:right\">deptid</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<td>0001</td>\r\n<td style=\"text-align:center\">张三</td>\r\n<td style=\"text-align:right\">01</td>\r\n</tr>\r\n<tr>\r\n<td>0002</td>\r\n<td style=\"text-align:center\">李四</td>\r\n<td style=\"text-align:right\">01</td>\r\n</tr>\r\n<tr>\r\n<td>0003</td>\r\n<td style=\"text-align:center\">王五</td>\r\n<td style=\"text-align:right\">02</td>\r\n</tr>\r\n<tr>\r\n<td>0004</td>\r\n<td style=\"text-align:center\">赵六</td>\r\n<td style=\"text-align:right\">02</td>\r\n</tr>\r\n<tr>\r\n<td>0005</td>\r\n<td style=\"text-align:center\">郑七</td>\r\n<td style=\"text-align:right\">NULL</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><strong>DeptTB（部门信息表）</strong> </p>\r\n<table>\r\n<thead>\r\n<tr>\r\n<th>deptid</th>\r\n<th style=\"text-align:center\">deptname</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<td>01</td>\r\n<td style=\"text-align:center\">技术部</td>\r\n</tr>\r\n<tr>\r\n<td>02</td>\r\n<td style=\"text-align:center\">市场部</td>\r\n</tr>\r\n<tr>\r\n<td>03</td>\r\n<td style=\"text-align:center\">工程部</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>我们现在需要进行连接查询，连接两张表检索数据。分别检索<strong>员工信息表</strong>的<strong>员工编号</strong>、<strong>员工姓名</strong>和<strong>部门信息表中的部门名称</strong>。<br>显然，两个表的连接条件是 <strong>员工表的部门编号=部门表的部门编号</strong><br><strong>注意：</strong>郑七不属于任何部门（新来的员工，还没有分配到任何的部门），而工程部不存在任何的员工（比如是一个新成立的部门，还没有员工） </p>\r\n<h3 id=\"h3--strong-1-strong-\"><a name=\"<strong>1、内连接查询</strong>\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span><strong>1、内连接查询</strong></h3><p>我们可以有两种方式，这两种是等效的<br>一种是：<strong>SELECT e.employeeid,e.employeename,d.deptname FROM EmployeeTB AS e,DeptTB AS d WHERE e.deptid=d.deptid</strong><br>另外一个是：<strong>SELECT e.employeeid,e.employeename,d.deptname FROM EmployeeTB AS e INNER JOIN DeptTB AS d ON e.deptid=d.deptid</strong><br>检索的结果都是： </p>\r\n<table>\r\n<thead>\r\n<tr>\r\n<th>employeeid</th>\r\n<th style=\"text-align:center\">employeename</th>\r\n<th style=\"text-align:center\">deptname</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<td>0001</td>\r\n<td style=\"text-align:center\">张三</td>\r\n<td style=\"text-align:center\">技术部</td>\r\n</tr>\r\n<tr>\r\n<td>0002</td>\r\n<td style=\"text-align:center\">李四</td>\r\n<td style=\"text-align:center\">技术部</td>\r\n</tr>\r\n<tr>\r\n<td>0003</td>\r\n<td style=\"text-align:center\">王五</td>\r\n<td style=\"text-align:center\">市场部</td>\r\n</tr>\r\n<tr>\r\n<td>0004</td>\r\n<td style=\"text-align:center\">赵六</td>\r\n<td style=\"text-align:center\">市场部</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>而“郑七”和“工程部”的信息是不会检索出来。因为采用内连接计算的时候必须要保证连接的条件<strong>e.deptid=d.deptid</strong>匹配，结果才会被检索出来。当我们连接两张检索数据的时候，检索的方式是<strong>首先逐行扫描“员工信息表”中的记录，然后根据连接条件来决定此记录是否被检索</strong>。比如对于张三，这条记录的deptid是01（部门编号），它在部门表中能找到和它匹配的编号01，而编号01的部门名称（deptname）是“技术部”所以张三这条记录会被检索，最终的结果肯定是： </p>\r\n<table>\r\n<thead>\r\n<tr>\r\n<th>employeeid</th>\r\n<th style=\"text-align:center\">employeename</th>\r\n<th style=\"text-align:center\">deptname</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<td>0001</td>\r\n<td style=\"text-align:center\">张三</td>\r\n<td style=\"text-align:center\">技术部</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>同样，李四、王五、赵六也能。但是郑七的部门编号是NULL，它在部门信息表中找不到匹配的项（因为部门信息表中不存在部门编号为NULL的部门），所以郑七不会被检索。<br>同理，没有任何人员的部门编号为03，所以工程部的记录也不会被检索 </p>\r\n<h3 id=\"h3--strong-2-strong-\"><a name=\"<strong>2、左外联结</strong>\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span><strong>2、左外联结</strong></h3><p>但是有些情况下，我们需要知道所有员工的信息，即使他不属于任何部门。这样我们就可以采用外连接，在这里为左外连接，也就是连接中的左表的表中的记录，<strong>无论能不能在右表中找到匹配的项</strong>，都要检索，如果没有匹配的项目，那么右表中的字段值为NULL（空），在这里就代表，此员工不属于任何部门。<br>检索语句为：<br><strong>SELECT e.employeeid,e.employeename,d.deptname FROM EmployeeTB AS e LEFT OUTER JOIN DeptTB AS d ON e.deptid=d.deptid</strong><br>检索的结果都是： </p>\r\n<table>\r\n<thead>\r\n<tr>\r\n<th>employeeid</th>\r\n<th style=\"text-align:center\">employeename</th>\r\n<th style=\"text-align:center\">deptname</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<td>0001</td>\r\n<td style=\"text-align:center\">张三</td>\r\n<td style=\"text-align:center\">技术部</td>\r\n</tr>\r\n<tr>\r\n<td>0002</td>\r\n<td style=\"text-align:center\">李四</td>\r\n<td style=\"text-align:center\">技术部</td>\r\n</tr>\r\n<tr>\r\n<td>0003</td>\r\n<td style=\"text-align:center\">王五</td>\r\n<td style=\"text-align:center\">市场部</td>\r\n</tr>\r\n<tr>\r\n<td>0004</td>\r\n<td style=\"text-align:center\">赵六</td>\r\n<td style=\"text-align:center\">市场部</td>\r\n</tr>\r\n<tr>\r\n<td>0005</td>\r\n<td style=\"text-align:center\">郑七</td>\r\n<td style=\"text-align:center\">NULL</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>但是在这里，<strong>工程部同样不会被检索</strong>，因为，deptname是在连接的右边的表中，“工程部”在左表中不存在任何的记录，所以不会被检索。这里关注的是<strong>“连接中的左边的表”.</strong> </p>\r\n<h3 id=\"h3--strong-3-strong-\"><a name=\"<strong>3、右外连接</strong>\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span><strong>3、右外连接</strong></h3><p>有时，我们需要知道，全部部门的信息，即使它没有任何的员工。在我们的查询中部门表在连接的右边，如果我们想知道右边表中的所有记录信息，那么就可以采用右外连接，<strong>如果此记录在左边的表中找不到匹配项，则相应字段（employeeid,employeename)为NULL</strong><br>检索语句为：<br><strong>SELECT e.employeeid,e.employeename,d.deptname FROM EmployeeTB AS e RIGHT OUTER JOIN DeptTB AS d ON e.deptid=d.deptid</strong><br>检索的结果都是： </p>\r\n<table>\r\n<thead>\r\n<tr>\r\n<th>employeeid</th>\r\n<th style=\"text-align:center\">employeename</th>\r\n<th style=\"text-align:center\">deptname</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<td>0001</td>\r\n<td style=\"text-align:center\">张三</td>\r\n<td style=\"text-align:center\">技术部</td>\r\n</tr>\r\n<tr>\r\n<td>0002</td>\r\n<td style=\"text-align:center\">李四</td>\r\n<td style=\"text-align:center\">技术部</td>\r\n</tr>\r\n<tr>\r\n<td>0003</td>\r\n<td style=\"text-align:center\">王五</td>\r\n<td style=\"text-align:center\">市场部</td>\r\n</tr>\r\n<tr>\r\n<td>0004</td>\r\n<td style=\"text-align:center\">赵六</td>\r\n<td style=\"text-align:center\">市场部</td>\r\n</tr>\r\n<tr>\r\n<td>NULL</td>\r\n<td style=\"text-align:center\">NULL</td>\r\n<td style=\"text-align:center\">工程部</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>但在这里，郑七是不会被检索了，因为它在右表中找不到匹配项，这里关注的是<strong>“连接中的右边的表”</strong> </p>\r\n<h3 id=\"h3--strong-4-strong-\"><a name=\"<strong>4、完全外连接</strong>\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span><strong>4、完全外连接</strong></h3><p><strong>如果我们想知道所有的记录呢？</strong>无论员工有没有部门，部门有没有员工，我们都需要检索。这里就可以使用完全外连接。关注连接中的两部分。<strong>如果没有部门，部门为空，没有员工，员工信息为空。</strong><br>检索语句为：<br><strong>SELECT e.employeeid,e.employeename,d.deptname FROM EmployeeTB AS e FULL OUTER JOIN DeptTB AS d ON e.deptid=d.deptid</strong><br>检索的结果都是： </p>\r\n<table>\r\n<thead>\r\n<tr>\r\n<th>employeeid</th>\r\n<th style=\"text-align:center\">employeename</th>\r\n<th style=\"text-align:center\">deptname</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<td>0001</td>\r\n<td style=\"text-align:center\">张三</td>\r\n<td style=\"text-align:center\">技术部</td>\r\n</tr>\r\n<tr>\r\n<td>0002</td>\r\n<td style=\"text-align:center\">李四</td>\r\n<td style=\"text-align:center\">技术部</td>\r\n</tr>\r\n<tr>\r\n<td>0003</td>\r\n<td style=\"text-align:center\">王五</td>\r\n<td style=\"text-align:center\">市场部</td>\r\n</tr>\r\n<tr>\r\n<td>0004</td>\r\n<td style=\"text-align:center\">赵六</td>\r\n<td style=\"text-align:center\">市场部</td>\r\n</tr>\r\n<tr>\r\n<td>0005</td>\r\n<td style=\"text-align:center\">郑七</td>\r\n<td style=\"text-align:center\">NULL</td>\r\n</tr>\r\n<tr>\r\n<td>NULL</td>\r\n<td style=\"text-align:center\">NULL</td>\r\n<td style=\"text-align:center\">工程部</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n', '###**感觉写的太好了，一没忍住就转了**\r\n>原文地址\r\nhttp://www.cnblogs.com/devilmsg/archive/2009/03/24/1420543.html\r\n\r\n学习**数据库查询**的时候对**多表连接查询**的有些概念还比较模糊。而连接查询是在数据库查询操作的时候肯定要用到的。对于此概念 \r\n我用通俗一些的语言和例子来进行讲解。这个例子是我讲课的时候经常采用的例子。 \r\n`首先我们做两张表：员工信息表和部门信息表，在此，表的建立只为讲述连接的概念，所以字段非常的简单javascript`\r\n\r\n\r\n----------\r\n\r\n\r\n \r\n**EmployeeTB（员工信息表）：** \r\n\r\n| employeeid| employeename| deptid  |\r\n | ------------- |:-------------:| -----:|\r\n | 0001  | 张三  |01  |\r\n | 0002   |李四 |01  |\r\n | 0003| 王五| 02 |\r\n|0004  |赵六|02  |\r\n | 0005| 郑七| NULL|  \r\n\r\n\r\n**DeptTB（部门信息表）** \r\n\r\n|deptid | deptname |\r\n| ------ | :-------: |\r\n|01  |技术部 |\r\n|02 | 市场部 |\r\n|03  |工程部 |\r\n\r\n我们现在需要进行连接查询，连接两张表检索数据。分别检索**员工信息表**的**员工编号**、**员工姓名**和**部门信息表中的部门名称**。 \r\n显然，两个表的连接条件是 **员工表的部门编号=部门表的部门编号** \r\n**注意：**郑七不属于任何部门（新来的员工，还没有分配到任何的部门），而工程部不存在任何的员工（比如是一个新成立的部门，还没有员工） \r\n###**1、内连接查询** \r\n我们可以有两种方式，这两种是等效的 \r\n一种是：**SELECT e.employeeid,e.employeename,d.deptname FROM EmployeeTB AS e,DeptTB AS d WHERE e.deptid=d.deptid** \r\n另外一个是：**SELECT e.employeeid,e.employeename,d.deptname FROM EmployeeTB AS e INNER JOIN DeptTB AS d ON e.deptid=d.deptid** \r\n检索的结果都是： \r\n\r\n|employeeid| employeename| deptname |\r\n| -----| :--------:|:-------:|\r\n|0001 | 张三  |技术部 |\r\n|0002 | 李四 | 技术部 |\r\n|0003 | 王五  |市场部 |\r\n|0004 | 赵六  |市场部 |\r\n\r\n而“郑七”和“工程部”的信息是不会检索出来。因为采用内连接计算的时候必须要保证连接的条件**e.deptid=d.deptid**匹配，结果才会被检索出来。当我们连接两张检索数据的时候，检索的方式是**首先逐行扫描“员工信息表”中的记录，然后根据连接条件来决定此记录是否被检索**。比如对于张三，这条记录的deptid是01（部门编号），它在部门表中能找到和它匹配的编号01，而编号01的部门名称（deptname）是“技术部”所以张三这条记录会被检索，最终的结果肯定是： \r\n\r\n|employeeid| employeename| deptname |\r\n| -----| :--------:|:-------:|\r\n|0001 | 张三  |技术部 |\r\n\r\n同样，李四、王五、赵六也能。但是郑七的部门编号是NULL，它在部门信息表中找不到匹配的项（因为部门信息表中不存在部门编号为NULL的部门），所以郑七不会被检索。 \r\n同理，没有任何人员的部门编号为03，所以工程部的记录也不会被检索 \r\n\r\n###**2、左外联结** \r\n但是有些情况下，我们需要知道所有员工的信息，即使他不属于任何部门。这样我们就可以采用外连接，在这里为左外连接，也就是连接中的左表的表中的记录，**无论能不能在右表中找到匹配的项**，都要检索，如果没有匹配的项目，那么右表中的字段值为NULL（空），在这里就代表，此员工不属于任何部门。 \r\n检索语句为： \r\n**SELECT e.employeeid,e.employeename,d.deptname FROM EmployeeTB AS e LEFT OUTER JOIN DeptTB AS d ON e.deptid=d.deptid** \r\n检索的结果都是： \r\n\r\n|employeeid| employeename| deptname |\r\n| -----| :--------:|:-------:|\r\n|0001 | 张三  |技术部 |\r\n|0002 | 李四 | 技术部 |\r\n|0003 | 王五  |市场部 |\r\n|0004 | 赵六  |市场部 |\r\n|0005 | 郑七 | NULL| \r\n\r\n但是在这里，**工程部同样不会被检索**，因为，deptname是在连接的右边的表中，“工程部”在左表中不存在任何的记录，所以不会被检索。这里关注的是**“连接中的左边的表”.** \r\n\r\n\r\n###**3、右外连接** \r\n有时，我们需要知道，全部部门的信息，即使它没有任何的员工。在我们的查询中部门表在连接的右边，如果我们想知道右边表中的所有记录信息，那么就可以采用右外连接，**如果此记录在左边的表中找不到匹配项，则相应字段（employeeid,employeename)为NULL** \r\n检索语句为： \r\n**SELECT e.employeeid,e.employeename,d.deptname FROM EmployeeTB AS e RIGHT OUTER JOIN DeptTB AS d ON e.deptid=d.deptid** \r\n检索的结果都是： \r\n\r\n|employeeid| employeename| deptname |\r\n| -----| :--------:|:-------:|\r\n|0001 | 张三  |技术部 |\r\n|0002 | 李四 | 技术部 |\r\n|0003 | 王五  |市场部 |\r\n|0004 | 赵六  |市场部 |\r\n|NULL|  NULL | 工程部| \r\n\r\n但在这里，郑七是不会被检索了，因为它在右表中找不到匹配项，这里关注的是**“连接中的右边的表”** \r\n\r\n###**4、完全外连接** \r\n**如果我们想知道所有的记录呢？**无论员工有没有部门，部门有没有员工，我们都需要检索。这里就可以使用完全外连接。关注连接中的两部分。**如果没有部门，部门为空，没有员工，员工信息为空。** \r\n检索语句为： \r\n**SELECT e.employeeid,e.employeename,d.deptname FROM EmployeeTB AS e FULL OUTER JOIN DeptTB AS d ON e.deptid=d.deptid** \r\n检索的结果都是： \r\n\r\n|employeeid| employeename| deptname |\r\n| -----| :--------:|:-------:|\r\n|0001 | 张三  |技术部 |\r\n|0002 | 李四 | 技术部 |\r\n|0003 | 王五  |市场部 |\r\n|0004 | 赵六  |市场部 |\r\n|0005|  郑七 | NULL| \r\n|NULL  |NULL  |工程部 |', '1', '2017-07-03 09:14:15', '2017-07-03 10:33:22');
INSERT INTO `t_blog` VALUES ('26', '阿鑫', 'sb', '<h1 id=\"h1-u50BBu5E3D\"><a name=\"傻帽\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>傻帽</h1><h1 id=\"h1-u50BBu53C9\"><a name=\"傻叉\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>傻叉</h1><pre><code class=\"lang-java\">system.out.println(&quot;shabi&quot;)\r\n</code></pre>\r\n', '#傻帽\r\n#傻叉\r\n```java\r\nsystem.out.println(\"shabi\")\r\n```', 'sb', '2017-07-03 10:30:01', '2017-07-03 10:44:00');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `username` varchar(20) DEFAULT NULL COMMENT '用户名',
  `password` varchar(20) DEFAULT NULL COMMENT '密码',
  `introduction` varchar(100) DEFAULT NULL COMMENT '个人介绍',
  `photo` varchar(50) DEFAULT NULL COMMENT '头像',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'axin', '87654321', '胆大心细', 'axin.jpg', '2017-06-18 20:19:40', '2017-06-18 20:19:40');
