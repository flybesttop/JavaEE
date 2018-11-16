package cn.mtx.hziee.model;

public class Gouwuche {
    private Integer id;

    private String username;

    private Integer seatId;

    private String publishTime;

    private String juchang;

    private String showTime;

    private Integer price;

    private String tingmu;

    private String movietype;

    private Integer row;

    private Integer col;

    private String movieName;

    private String movieEName;

    public Integer getIsPay() {
        return isPay;
    }

    public void setIsPay(Integer isPay) {
        this.isPay = isPay;
    }

    private Integer isPay;

    public Integer getJuchangId() {
        return juchangId;
    }

    public void setJuchangId(Integer juchangId) {
        this.juchangId = juchangId;
    }

    private Integer juchangId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public Integer getSeatId() {
        return seatId;
    }

    public void setSeatId(Integer seatId) {
        this.seatId = seatId;
    }

    public String getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(String publishTime) {
        this.publishTime = publishTime == null ? null : publishTime.trim();
    }

    public String getJuchang() {
        return juchang;
    }

    public void setJuchang(String juchang) {
        this.juchang = juchang == null ? null : juchang.trim();
    }

    public String getShowTime() {
        return showTime;
    }

    public void setShowTime(String showTime) {
        this.showTime = showTime == null ? null : showTime.trim();
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getTingmu() {
        return tingmu;
    }

    public void setTingmu(String tingmu) {
        this.tingmu = tingmu == null ? null : tingmu.trim();
    }

    public String getMovietype() {
        return movietype;
    }

    public void setMovietype(String movietype) {
        this.movietype = movietype == null ? null : movietype.trim();
    }

    public Integer getRow() {
        return row;
    }

    public void setRow(Integer row) {
        this.row = row;
    }

    public Integer getCol() {
        return col;
    }

    public void setCol(Integer col) {
        this.col = col;
    }

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName == null ? null : movieName.trim();
    }

    public String getMovieEName() {
        return movieEName;
    }

    public void setMovieEName(String movieEName) {
        this.movieEName = movieEName == null ? null : movieEName.trim();
    }
}