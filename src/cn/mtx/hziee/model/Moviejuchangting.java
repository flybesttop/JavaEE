package cn.mtx.hziee.model;

public class Moviejuchangting {
    private Integer id;

    private Integer movieId;

    private String juchang;

    private String showtime;

    private Integer price;

    private String type;

    private String tingmu;

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

    public String getJuchang() {
        return juchang;
    }

    public void setJuchang(String juchang) {
        this.juchang = juchang == null ? null : juchang.trim();
    }

    public String getShowtime() {
        return showtime;
    }

    public void setShowtime(String showtime) {
        this.showtime = showtime == null ? null : showtime.trim();
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getTingmu() {
        return tingmu;
    }

    public void setTingmu(String tingmu) {
        this.tingmu = tingmu == null ? null : tingmu.trim();
    }
}