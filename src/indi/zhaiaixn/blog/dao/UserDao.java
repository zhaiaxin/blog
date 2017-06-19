package indi.zhaiaixn.blog.dao;

import indi.zhaiaixn.blog.entity.User;

/**
 * UserDao
 *
 * @author zhaiaxin
 * @time: 2017/6/17 20:26.
 */
public interface UserDao {

    /**
     * 添加一个用户
     * @param user
     * @return
     */
    public boolean newUser(User user);


    /**
     * 通过用户名查找用户
     * @param username
     * @return
     */
    public User queryByUsername(String username);


}
