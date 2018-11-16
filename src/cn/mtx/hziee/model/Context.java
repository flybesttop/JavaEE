package cn.mtx.hziee.model;

public class Context {
    private Integer id;

    private Integer movieId;

    private String username;

    private String context;

    private String publishTime;

    private String userTouxiang;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMovieId() {
        return movieId;
    }

    public void setMovieId(Integer movieId) {
        this.movieId = movieId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context == null ? null : context.trim();
    }

    public String getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(String publishTime) {
        this.publishTime = publishTime == null ? null : publishTime.trim();
    }

    public String getUserTouxiang() {
        return userTouxiang;
    }

    public void setUserTouxiang(String userTouxiang) {
        this.userTouxiang = userTouxiang == null ? null : userTouxiang.trim();
    }
}