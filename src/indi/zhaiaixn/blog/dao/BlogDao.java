package indi.zhaiaixn.blog.dao;

import indi.zhaiaixn.blog.entity.Blog;

/**
 * BlogDao
 *
 * @author zhaiaxin
 * @time: 2017/6/18 20:26.
 */
public interface BlogDao {

    /**
     * 新增一篇博客
     * @param blog
     * @return
     */
    public boolean newOrUpdateBlog(Blog blog);

    /**
     * 删除一篇博客
     * @param id
     * @return
     */
    public boolean delBlog(long id);

    /**
     * 根据标题查找博客
     * @param title
     * @return
     */
    public Blog queryByTitle(String title);


}
