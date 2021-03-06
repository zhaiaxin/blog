package test;

import indi.zhaiaixn.blog.dao.BlogDao;
import indi.zhaiaixn.blog.dao.impl.BlogDaoImpl;
import indi.zhaiaixn.blog.entity.Blog;
import org.junit.Test;

/**
 * BlogDao方法测试
 *
 * @author zhaiaxin
 * @time: 2017/6/19 10:57.
 */
public class BlogDaoTest {

    BlogDao blogDao = new BlogDaoImpl();

    @Test
    public void testNewOrUpdateBlog(){
        Blog blog = new Blog();
        blog.setId(0);
        blog.setTitle("java从入门到放弃");
        blog.setAbstracts("这个有点难哈");
        blog.setHtml_content("<h1>hh</h1>");
        blog.setContent("Java是一门面向对象编程语言，不仅吸收了C++语言的各种优点，还摒弃了C++里难以理解的多继承、指针等概念，因此Java语言具有功能强大和简单易用两个特征。Java语言作为静态面向对象编程语言的代表，极好地实现了面向对象理论，允许程序员以优雅的思维方式进行复杂的编程[1]  。\n" +
                "Java具有简单性、面向对象、分布式、健壮性、安全性、平台独立与可移植性、多线程、动态性等特点[2]  。Java可以编写桌面应用程序、Web应用程序、分布式系统和嵌入式系统应用程序等[3]  。");
        blog.setCategory("java");
        System.out.println(blogDao.newOrUpdateBlog(blog));
    }

    @Test
    public void testDelBlog(){
        System.out.println(blogDao.delBlog(3));
    }

//    @Test
//    public void testQueryByTitle(){
//        System.out.println(blogDao.queryByTitle("java"));
//    }

    @Test
    public void testSelectByTitle(){
        System.out.println(blogDao.selectByTitle("java从入门到放弃"));
    }

//    @Test
//    public void testListAll(){
//        System.out.println(blogDao.listAll());
//    }

//    @Test
//    public void testListByCategory(){
//        System.out.println(blogDao.listByCategory("java"));
//    }

    @Test
    public void testListCategory(){
        System.out.println(blogDao.listCategory());
    }
}
