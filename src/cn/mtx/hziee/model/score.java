package cn.mtx.hziee.model;

public class score {
    private int movieId;

    public String getMoviename() {
        return moviename;
    }

    public void setMoviename(String moviename) {
        this.moviename = moviename;
    }

    private String moviename;

    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }

    public double getAvg() {
        return Avg;
    }

    public void setAvg(double avg) {
        Avg = avg;
    }

    private double Avg;

    public int getRank() {
        return rank;
    }

    public void setRank(int rank) {
        this.rank = rank;
    }

    private int rank;
}
