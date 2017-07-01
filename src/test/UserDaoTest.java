package test;

import indi.zhaiaixn.blog.dao.impl.UserDaoImpl;
import indi.zhaiaixn.blog.entity.User;
import org.junit.Test;

/**
 * 测试userDao的一些方法
 *
 * @author zhaiaxin
 * @time: 2017/6/18 20:12.
 */
public class UserDaoTest {

    UserDaoImpl userDao = new UserDaoImpl();

    @Test
     public void TestNewUser() throws Exception{
         User user = new User();
         user.setUsername("axin");
         user.setPassword("87654321");
//         user.setIntroduction("胆大心细");
//         user.setPhoto("axin.jpg");
         System.out.println(userDao.newUser(user));
     }

     @Test
    public void TestQueryByUsername() throws Exception{
         System.out.println(userDao.queryByUsername("axin"));
     }
}
