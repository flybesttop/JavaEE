package cn.mtx.hziee.model;

public class Seat {
    private Integer id;

    private Integer seatId;

    private Integer rowNum;

    private Integer columnNum;

    private Integer movieJuchangTing;

    private String username;

    private String addTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSeatId() {
        return seatId;
    }

    public void setSeatId(Integer seatId) {
        this.seatId = seatId;
    }

    public Integer getRowNum() {
        return rowNum;
    }

    public void setRowNum(Integer rowNum) {
        this.rowNum = rowNum;
    }

    public Integer getColumnNum() {
        return columnNum;
    }

    public void setColumnNum(Integer columnNum) {
        this.columnNum = columnNum;
    }

    public Integer getMovieJuchangTing() {
        return movieJuchangTing;
    }

    public void setMovieJuchangTing(Integer movieJuchangTing) {
        this.movieJuchangTing = movieJuchangTing;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getAddTime() {
        return addTime;
    }

    public void setAddTime(String addTime) {
        this.addTime = addTime == null ? null : addTime.trim();
    }
}