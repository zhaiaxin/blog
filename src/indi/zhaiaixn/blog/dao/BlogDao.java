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
    public boolean delBlog(int id);

    /**
     * 根据标题查找博客
     * @param title
     * @return List<Blog>
     */
    public List<Blog> queryByTitle(String title);

    /**
     * 根据标题查找博客
     * @param title
     * @return Blog
     */
    public Blog selectByTitle(String title);

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

    /**
     * 列出所有的目录
     * @return
     */
    public List listCategory();

    /**
     * 总的页数
     * @return
     */
    public Long totalPage(String pageSize);

    /**
     * 分页展示博客
     * @return
     */
    public List<Blog> listAllPageing(String pageIndex,String pageSize);




}
