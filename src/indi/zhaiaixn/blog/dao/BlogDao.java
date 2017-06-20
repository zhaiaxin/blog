package indi.zhaiaixn.blog.dao;

import indi.zhaiaixn.blog.entity.Blog;

import java.util.List;

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

    /**
     * 列出所有的博客
     * @return
     */
    public List<Blog> listAll();

    /**
     * 根据分类查找博客
     * @param category
     * @return
     */
    public List<Blog> listByCategory(String category);


}
