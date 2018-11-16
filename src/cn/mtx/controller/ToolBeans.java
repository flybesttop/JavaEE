package cn.mtx.controller;

import java.text.SimpleDateFormat;
import java.util.*;

import cn.mtx.hziee.mapper.*;
import cn.mtx.hziee.model.*;
import cn.mtx.util.Page;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;


public class ToolBeans {
    static ApplicationContext act = new ClassPathXmlApplicationContext("applicationContext.xml");
    static UserMapper userMapper = act.getBean(UserMapper.class);
    static MovieMapper movieMapper = act.getBean(MovieMapper.class);
    static MoviescoreMapper moviescoreMapper = act.getBean(MoviescoreMapper.class);
    static MoviejuchangtingMapper moviejuchangtingMapper = act.getBean(MoviejuchangtingMapper.class);
    static ContextMapper contextMapper = act.getBean(ContextMapper.class);
    static SeatMapper seatMapper = act.getBean(SeatMapper.class);
    static GouwucheMapper gouwucheMapper = act.getBean(GouwucheMapper.class);
    static MovietypeMapper movietypeMapper = act.getBean(MovietypeMapper.class);

    public void register(User user) {
        userMapper.insertSelective(user);
    }

    public void changeMessage(User user) {
        userMapper.updateByPrimaryKeySelective(user);
    }

    public void insertMovieScore(Moviescore moviescore) {
        Map map = new HashMap();
        map.put("movieId", moviescore.getMovieId());
        map.put("username", moviescore.getUser());

        Moviescore moviescore1 = moviescoreMapper.selectByMovieIdAndUsername(map);
        if (moviescore1 == null) {
            moviescoreMapper.insertSelective(moviescore);
        } else {
            moviescore1.setScore(moviescore.getScore());
            moviescoreMapper.updateByPrimaryKeySelective(moviescore1);
        }
    }

    public Movie getMoviePage(Integer movieId) {
        Movie movie = (Movie) movieMapper.selectByPrimaryKey(movieId);
        return movie;
    }

    public boolean checkLogin(String[] value) {
        Boolean flag = false;
        User user = (User) userMapper.selectByPrimaryKey(value[0]);
        if (user != null && user.getPassword().equals(value[1]) && user.getIsEnabled() == 1) {
            flag = true;
        }
        return flag;
    }

    public User getUser(String username) {
        User user = (User) userMapper.selectByPrimaryKey(username);
        return user;
    }

    public String getMoviescore(Integer movieId) {
        double avgScore = 1;
        int sum = 0;
        List<Moviescore> moviescore = moviescoreMapper.selectByMovieId(movieId);
        for (int i = 0; i < moviescore.size(); i++) {
            sum += moviescore.get(i).getScore();
        }
        avgScore = ((int) (sum * 1.0 / moviescore.size() * 10 + 0.5)) / 10.0;
        String score = String.valueOf(avgScore);
        return score;
    }

    public void insertMessageBoard(Context context) {
        contextMapper.insertSelective(context);
    }

    public List<Context> getMessageBoard(Integer movieId) {
        List<Context> contextList = contextMapper.selectByPrimaryKey(movieId);
        return contextList;
    }

    public List<Moviejuchangting> getMovieSeatMessage(Integer movieId) {
        List<Moviejuchangting> moviejuchangtingList = moviejuchangtingMapper.selectByPrimaryKey(movieId);
        return moviejuchangtingList;
    }

    public Page getPageMessage(int pagenum, int movieId, int rows) {
        Map map = new HashMap();
        map.put("pageNum", 4 * (pagenum - 1));
        map.put("movieId", movieId);
        map.put("rows", rows);
        List<Context> contextList1 = contextMapper.selectByPrimaryKeyMAP(map);
        List<Context> contextList2 = contextMapper.selectByPrimaryKey(movieId);
        Page page = new Page(pagenum, 4, contextList2.size(), contextList1);
        return page;
    }

    public String getSeatMessage(int movieTingmuId) {
        List<Seat> seats = seatMapper.selectByMovieTingmuId(movieTingmuId);
        int seatIds[] = new int[seats.size() + 1];
        for (int j = 0; j < seats.size(); j++) {
            seatIds[j] = seats.get(j).getSeatId();
        }
        seatIds[seats.size()] = 73;
        Arrays.sort(seatIds);
        String seatMessage = "";
        int mm = 0;
        for (int i = 1; i <= 72; i++) {
            if (i == seatIds[mm]) {
                seatMessage += "<div style=\"width: 42px;height: 42px;padding:6px;float: left;\"><img src=\"/static/img/seat/seat3.png\" class=\"juchangzuowei\" style=\"height: 100%;width: 100%\" seatNum=\"" + i + "\" IsClicked='0'></div>";
                mm++;
            } else {
                seatMessage += "<div style=\"width: 42px;height: 42px;padding:6px;float: left;\"><img src=\"/static/img/seat/seat1.png\" class=\"juchangzuowei juchangzuowei" + movieTingmuId + "\" onclick=\"juchangzuowei(this)\" style=\"height: 100%;width: 100%\" seatNum=\"" + i + "\" IsClicked='0' moviejuchangtingmu=" + movieTingmuId + "></div>";
            }
        }
        return seatMessage;
    }

    public void jiarugouwuche(String seats[], String username, String movieTingmuId) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.CHINESE);
        Date date = new Date();
        String dateStr = sdf.format(date);
        Moviejuchangting moviejuchangting = moviejuchangtingMapper.selectById(Integer.parseInt(movieTingmuId));
        Movie movie = movieMapper.selectByPrimaryKey(moviejuchangting.getMovieId());
        for (int i = 0; i < seats.length; i++) {
            Seat seat = new Seat();
            seat.setAddTime(dateStr);
            seat.setSeatId(Integer.parseInt(seats[i]));
            seat.setMovieJuchangTing(Integer.parseInt(movieTingmuId));
            seat.setUsername(username);
            seatMapper.insertSelective(seat);
            Gouwuche gouwuche = new Gouwuche();
            gouwuche.setUsername(username);
            gouwuche.setSeatId(Integer.parseInt(seats[i]));
            gouwuche.setMovieName(movie.getMovieName());
            gouwuche.setMovieEName(movie.getMovieEnglishName());
            gouwuche.setJuchang(moviejuchangting.getJuchang());
            gouwuche.setTingmu(moviejuchangting.getTingmu());
            gouwuche.setPublishTime(dateStr);
            gouwuche.setShowTime(moviejuchangting.getShowtime());
            gouwuche.setJuchangId(Integer.parseInt(movieTingmuId));
            int column = Integer.parseInt(seats[i]) % 12;
            if (column == 0) {
                gouwuche.setRow(Integer.parseInt(seats[i]) / 12);
                gouwuche.setCol(12);
            } else {
                gouwuche.setRow(Integer.parseInt(seats[i]) / 12 + 1);
                gouwuche.setCol(column);
            }
            gouwuche.setMovietype(moviejuchangting.getType());
            gouwuche.setPrice(moviejuchangting.getPrice());
            gouwucheMapper.insertSelective(gouwuche);
        }
    }

    public Ticket getTickets(String username) {
        List<Gouwuche> gouwucheList = gouwucheMapper.selectByUsername(username);
        int finalPay = 0;
        String tickets = "";
        for (int i = 0; i < gouwucheList.size(); i++) {
//            if (gouwucheList.get(i).getIsPay() == 0) {
                finalPay += gouwucheList.get(i).getPrice();
                tickets += "<div style=\"width: 650px;height: 100px;background-color: white;margin-top: 5px;border-radius: 5px 20px;border: double;\" id=\"ticketNum" + gouwucheList.get(i).getId() + "\"><div style=\"width:200px;height: 100px;float: left;margin-left: 20px;padding-top: 15px\"><font style=\"font-size: 1.5em;\">" + gouwucheList.get(i).getJuchang() + "</font><br><font style=\"color: #5e5e5e\">时间：" + gouwucheList.get(i).getShowTime() + "<br>厅目：" + gouwucheList.get(i).getTingmu() + "&nbsp;&nbsp;&nbsp;&nbsp;类型：" + gouwucheList.get(i).getMovietype() + "</font></div><div style=\"width:320px;height: 100px;float: left;margin-left: 40px;padding-top: 15px\"><font style=\"font-size: 1.5em;\">" + gouwucheList.get(i).getMovieName() + "</font><br><font style=\"color: #5e5e5e\">" + gouwucheList.get(i).getMovieEName() + "</font><br><font style=\"color: #5e5e5e\">" + gouwucheList.get(i).getRow() + "</font><font style=\"color: #5e5e5e\">排</font><font style=\"color: #5e5e5e\">" + gouwucheList.get(i).getCol() + "</font><font style=\"color: #5e5e5e\">座</font><font style=\"float: right;font-size: 1.3em;margin-top: -5px;\">￥" + gouwucheList.get(i).getPrice() + "已付款</font></div><div style=\"width:40px;height: 100px;float: right;\"><span style=\"line-height: 100px;font-size: 1.5em;color: red;\" class=\"glyphicon glyphicon-remove-sign handtype\" onclick=\"removieTicket(this)\" ticketId=" + gouwucheList.get(i).getId() + " price=" + gouwucheList.get(i).getPrice() + "></span></div></div>";
//            } else {
//                tickets += "<div style=\"width: 650px;height: 100px;background-color: white;margin-top: 5px;border-radius: 5px 20px;border: double;\" id=\"ticketNum" + gouwucheList.get(i).getId() + "\"><div style=\"width:200px;height: 100px;float: left;margin-left: 20px;padding-top: 15px\"><font style=\"font-size: 1.5em;\">" + gouwucheList.get(i).getJuchang() + "</font><br><font style=\"color: #5e5e5e\">时间：" + gouwucheList.get(i).getShowTime() + "<br>厅目：" + gouwucheList.get(i).getTingmu() + "&nbsp;&nbsp;&nbsp;&nbsp;类型：" + gouwucheList.get(i).getMovietype() + "</font></div><div style=\"width:320px;height: 100px;float: left;margin-left: 40px;padding-top: 15px\"><font style=\"font-size: 1.5em;\">" + gouwucheList.get(i).getMovieName() + "</font><br><font style=\"color: #5e5e5e\">" + gouwucheList.get(i).getMovieEName() + "</font><br><font style=\"color: #5e5e5e\">" + gouwucheList.get(i).getRow() + "</font><font style=\"color: #5e5e5e\">排</font><font style=\"color: #5e5e5e\">" + gouwucheList.get(i).getCol() + "</font><font style=\"color: #5e5e5e\">座</font><font style=\"float: right;font-size: 1.3em;margin-top: -5px;\">￥" + gouwucheList.get(i).getPrice() + " 已付款</font></div><div style=\"width:40px;height: 100px;float: right;\"><span style=\"line-height: 100px;font-size: 1.5em;color: green;\" class=\"glyphicon glyphicon-ok-sign handtype\"ticketId=" + gouwucheList.get(i).getId() + " price=\"0\"></span></div></div>";
//            }
        }
        Ticket ticket = new Ticket();
        ticket.setFinalPay(finalPay);
        ticket.setTickets(tickets);
        return ticket;
    }

    public void removeTicket(String ticketId) {
        Gouwuche gouwuche = gouwucheMapper.selectByPrimaryKey(Integer.parseInt(ticketId));
        Map map = new HashMap();
        map.put("seatid", gouwuche.getSeatId());
        map.put("juchang", gouwuche.getJuchangId());
        seatMapper.deleteBySeatId(map);
        gouwucheMapper.deleteByPrimaryKey(gouwuche.getId());
    }

    public void removeAllTicket(String username) {
        seatMapper.deleteByUsername(username);
        gouwucheMapper.updateByIsPay(username);
    }

    public Page getMovielists(String movieType, int page) {
        Map map = new HashMap();
        map.put("page", 20 * (page - 1));
        map.put("rows", 20);
        List<Movie> movieList = new ArrayList<>();
        List<Movie> movieList2 = new ArrayList<>();
        if (movieType.equals("0")) {
            movieList = movieMapper.selectAllmovie(map);
            movieList2 = movieMapper.selectAll();
        } else {
            List<Movietype> movietypeList = movietypeMapper.selectByType(Integer.parseInt(movieType));
            for (Movietype x : movietypeList) {
                movieList2.add(movieMapper.selectByPrimaryKey(x.getMovieId()));
            }
            for (int i = 20 * (page - 1); i < (movieList2.size() - 20 * (page - 1) > 20 ? 20 : movieList2.size() - 20 * (page - 1)); i++) {
                movieList.add(movieList2.get(i));
            }
        }
        Page page1 = new Page(page, 20, movieList2.size(), movieList);
        return page1;
    }

    public List<Movie> showingmivie(int num) {
        List<Movie> movies = movieMapper.selectShowingMovie(num);
        return movies;
    }

    public List<Movie> nicemivie(int num) {
        List<Movie> movies = movieMapper.selectnicemovie(num);
        return movies;
    }

    public List<Movie> getMovieListBylikelyname(String movieLikelyname) {
        String moviename = "%" + movieLikelyname + "%";
        List<Movie> movies = movieMapper.selectBylikelyname(moviename);
        return movies;
    }

    public List<score> getTop10Movie() {
        List<Movie> moviesTop = new ArrayList<>();
        List<score> scoreList = new ArrayList<>();
        List<Moviescore> moviescores = moviescoreMapper.selectAll();
        if (moviescores != null) {
            List<score> scores = new ArrayList<>();
            int m, n = 0, sum = 0, count = 1, count2 = 0;
            scores.add(new score());
            scores.get(0).setMovieId(moviescores.get(0).getMovieId());
            for (int i = 0; i < moviescores.size(); i++) {
                m = moviescores.get(n).getMovieId();
                if (moviescores.get(i).getMovieId() != m) {
                    scores.get(count - 1).setAvg(sum / count2);
                    scores.add(new score());
                    scores.get(count).setMovieId(moviescores.get(i).getMovieId());
                    count++;
                    n = i;
                    sum = 0;
                    count2 = 0;
                    i--;
                } else {
                    sum += moviescores.get(i).getScore();
                    count2++;
                }
                if (i == moviescores.size() - 1) {
                    scores.get(count - 1).setAvg(sum / count2);
                }
            }

            int maxindex;
            for (int i = 0; i < scores.size() - 1; i++) {
                maxindex = i;
                for (int j = i + 1; j < scores.size(); j++) {
                    if (scores.get(j).getAvg() > scores.get(maxindex).getAvg()) {
                        maxindex = j;
                    }
                }
                if (maxindex != i) {
                    score score1 = scores.get(i);
                    scores.set(i, scores.get(maxindex));
                    scores.set(maxindex, score1);
                }
            }
            for (int i = 0; i < (scores.size() > 10 ? 10 : scores.size()); i++) {
                scoreList.add(scores.get(i));
                scoreList.get(i).setMoviename(movieMapper.selectByPrimaryKey(scores.get(i).getMovieId()).getMovieName());
            }
        }
        return scoreList;
    }

    public static void main(String[] args) {
    }
}
