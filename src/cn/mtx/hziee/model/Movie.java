package cn.mtx.hziee.model;

public class Movie {
    private Integer id;

    private String movieName;

    private String movieEnglishName;

    private String movieType;

    private String movieCountry;

    private String movieHowlong;

    private String movieContext;

    private String movieHaibao;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName == null ? null : movieName.trim();
    }

    public String getMovieEnglishName() {
        return movieEnglishName;
    }

    public void setMovieEnglishName(String movieEnglishName) {
        this.movieEnglishName = movieEnglishName == null ? null : movieEnglishName.trim();
    }

    public String getMovieType() {
        return movieType;
    }

    public void setMovieType(String movieType) {
        this.movieType = movieType == null ? null : movieType.trim();
    }

    public String getMovieCountry() {
        return movieCountry;
    }

    public void setMovieCountry(String movieCountry) {
        this.movieCountry = movieCountry == null ? null : movieCountry.trim();
    }

    public String getMovieHowlong() {
        return movieHowlong;
    }

    public void setMovieHowlong(String movieHowlong) {
        this.movieHowlong = movieHowlong == null ? null : movieHowlong.trim();
    }

    public String getMovieContext() {
        return movieContext;
    }

    public void setMovieContext(String movieContext) {
        this.movieContext = movieContext == null ? null : movieContext.trim();
    }

    public String getMovieHaibao() {
        return movieHaibao;
    }

    public void setMovieHaibao(String movieHaibao) {
        this.movieHaibao = movieHaibao == null ? null : movieHaibao.trim();
    }
}