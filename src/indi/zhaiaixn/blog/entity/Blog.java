package indi.zhaiaixn.blog.entity;

public class Blog {

  private Long id;
  private String title;
  private String content;
  private String category;
  private java.sql.Timestamp created_time;
  private java.sql.Timestamp last_modified_time;

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String name) {
    this.title = name;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public String getCategory() {
    return category;
  }

  public void setCategory(String category) {
    this.category = category;
  }

  public java.sql.Timestamp getCreated_time() {
    return created_time;
  }

  public void setCreated_time(java.sql.Timestamp created_time) {
    this.created_time = created_time;
  }

  public java.sql.Timestamp getLast_modified_time() {
    return last_modified_time;
  }

  public void setLast_modified_time(java.sql.Timestamp last_modified_time) {
    this.last_modified_time = last_modified_time;
  }

  @Override
  public String toString() {
    return "Blog{" +
            "id=" + id +
            ", title='" + title + '\'' +
            ", content='" + content + '\'' +
            ", category='" + category + '\'' +
            ", created_time=" + created_time +
            ", last_modified_time=" + last_modified_time +
            '}';
  }
}