package indi.zhaiaixn.blog.entity;

public class Category {

  private Long id;
  private String name;
  private java.sql.Timestamp created_time;
  private java.sql.Timestamp last_modified_time;

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
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
}
