package cn.mtx.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.mtx.hziee.model.*;
import cn.mtx.util.Page;
import com.alibaba.fastjson.JSON;

import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller         //controller控制层
public class CoreServlet {

    ToolBeans dob=new ToolBeans();

    @RequestMapping("/login")
    public void login(@RequestParam("username")String username, @RequestParam("password")String password, HttpSession session,HttpServletResponse response){
        debug("登录");
        String user[]={username,password};
        String message;
        if(dob.checkLogin(user)){
            User nowuser=dob.getUser(username);
            session.setAttribute("nowUser",nowuser);
            message="1";
        }else{
            message="0";
        }
        ajaxReturn(response,message);
    }

    @RequestMapping("/pingfen")
    public void pingfen(@RequestParam("username")String username, @RequestParam("score")String score, @RequestParam("movieId")String movieId,HttpServletResponse response){
        debug("评分");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.CHINESE);
        Date date = new Date();
        String dateStr = sdf.format(date);

        int mscore=Integer.parseInt(score);
        int mmovieId=Integer.parseInt(movieId);
        Moviescore moviescore=new Moviescore();
        moviescore.setMovieId(mmovieId);
        moviescore.setUser(username);
        moviescore.setScore(mscore);
        moviescore.setAddTime(dateStr);
        dob.insertMovieScore(moviescore);
        ajaxReturn(response,"");
    }

    @RequestMapping("/liuyan")
    public void liuyan(@RequestParam("username")String username, @RequestParam("message")String message, @RequestParam("movieId")String movieId,@RequestParam("userTouxiang")String userTouxiang,HttpServletResponse response){
        debug("评分");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.CHINESE);
        Date date = new Date();
        String dateStr = sdf.format(date);

        int mmovieId=Integer.parseInt(movieId);
        Context context=new Context();
        context.setContext(message);
        context.setMovieId(mmovieId);
        context.setUsername(username);
        context.setPublishTime(dateStr);
        context.setUserTouxiang(userTouxiang);
        dob.insertMessageBoard(context);
        ajaxReturn(response,"");
    }

    @RequestMapping("/zhuxiao")
    public String zhuxiao(HttpSession session){
        debug("注销");
        session.removeAttribute("nowUser");
        return "/index";
    }

    @RequestMapping("/singlemovie")
    public String singlemovie(@RequestParam("movieId")int movieId, Model model,HttpServletRequest request){
        int pageNum=Integer.parseInt(request.getParameter("pageNum")==null?"1":request.getParameter("pageNum"));
        //获取电影分数
        String score=dob.getMoviescore(movieId);
        //获取电影信息
        Movie movie=dob.getMoviePage(movieId);
        //获取页面信息
        Page page=dob.getPageMessage(pageNum,movieId,4);
        //获取留言信息
        List<Context> contextList=(List<Context>)page.getData();
        //获取剧场信息
        List<Moviejuchangting> moviejuchangtingList=dob.getMovieSeatMessage(movieId);
        //将所有信息传到前端
        model.addAttribute("movieMessage",movie);
        model.addAttribute("movieScore",score);
        model.addAttribute("contextList",contextList);
        model.addAttribute("page",page);
        model.addAttribute("moviejuchangtingList",moviejuchangtingList);
        return "/singlemovie";
    }

    @RequestMapping("/changeTouxiang")
    public void changeTouxiang(@RequestParam("imgId")String imgId,@RequestParam("username")String username,HttpServletResponse response,HttpSession session){
        debug("改头像");
        String img=imgId.substring(imgId.indexOf('(')+2,imgId.indexOf(')')-1);
        User user=dob.getUser(username);
        user.setTouxiang(img);
        dob.changeMessage(user);
        session.removeAttribute("nowUser");
        User nowuser=dob.getUser(username);
        session.setAttribute("nowUser",nowuser);
        ajaxReturn(response,"1");
    }

    @RequestMapping("/jiarugouwuche")
    public void jiarugouwuche(@RequestParam("seatIds")String seatIds,@RequestParam("username")String username,@RequestParam("movieTingmuId")String movieTingmuId,HttpServletResponse response){
        String seatIdsArray=seatIds.trim();
        String seatIdsArrays[]=seatIdsArray.split(" ");
        dob.jiarugouwuche(seatIdsArrays,username,movieTingmuId);
    }

    @RequestMapping("/changeUserMessage")
    public void surechange(
            @RequestParam("username")String username,
            @RequestParam("password")String password,
            @RequestParam("sex")String sex,
            @RequestParam("phone")String phone,
            @RequestParam("email")String email,
            @RequestParam("userOwnMessage")String message,
            HttpServletResponse response,
            HttpSession session){
        debug("改信息");
        User user=dob.getUser(username);
        user.setPassword(password);
        user.setEmail(email);
        user.setSex(sex);
        user.setPhone(phone);
        user.setMessage(message);
        dob.changeMessage(user);
        session.removeAttribute("nowUser");
        User nowuser=dob.getUser(username);
        session.setAttribute("nowUser",nowuser);
        ajaxReturn(response,"1");
    }

    @RequestMapping("/register")
    public void register(
            @RequestParam("username")String username,
            @RequestParam("password")String password,
            @RequestParam("realname")String realname,
            @RequestParam("realId")String realId,
            @RequestParam("sex")String sex,
            @RequestParam("phonenumber")String phonenumber,
            @RequestParam("email")String email,
            @RequestParam("touxiang")String touxiang,
            HttpServletResponse response
    ){
        debug("注册用户");
        String User[]={username,password};
        String message;
        if(dob.checkLogin(User)){
            message="用户名已存在,创建失败,请更改用户名";
        }else{
            debug("register");

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.CHINESE);
            Date date = new Date();
            String dateStr = sdf.format(date);

            User user=new User();
            user.setUsername(username);
            user.setPassword(password);
            user.setRealName(realname);
            user.setRealId(realId);
            user.setSex(sex);
            user.setPhone(phonenumber);
            user.setEmail(email);
            user.setAddTime(dateStr);
            user.setTouxiang(touxiang);

            dob.register(user);
            message="创建成功";
        }
        ajaxReturn(response,message);
    }

    @RequestMapping("/gouwuche")
    public void gouwuche(@RequestParam("username")String username,HttpServletResponse response){
        Ticket ticket=dob.getTickets(username);
        ajaxReturn(response,ticket);
    }

    @RequestMapping("/removeticket")
    public void removeticket(@RequestParam("ticketId")String ticketId,HttpServletResponse response){
        dob.removeTicket(ticketId);
        ajaxReturn(response,"1");
    }

    @RequestMapping("/removeAllticket")
    public void removeAllticket(@RequestParam("username")String username,HttpServletResponse response){
        dob.removeAllTicket(username);
        ajaxReturn(response,"1");
    }

    @RequestMapping("/zuoweixinxi")
    public void zuoweixinxi(HttpServletResponse response,@RequestParam("movieTingmuId")String movieTingmuId){
        String seatMessage=dob.getSeatMessage(Integer.parseInt(movieTingmuId));
        ajaxReturn(response,seatMessage);
    }

    @RequestMapping("/searchmovie")
    public String searchmovie(@RequestParam("movielikelyname")String movielikelyname,Model model){
        List<Movie> movies=dob.getMovieListBylikelyname(movielikelyname);
        model.addAttribute("movielist",movies);
        model.addAttribute("searchKye",movielikelyname);
        return "/findResult";
    }

    @RequestMapping("/index")
    public String index(Model model){
        List<Movie> showingMovie=dob.showingmivie(5);
        List<Movie> niceMovie=dob.nicemivie(6);
        List<score> top10movie=dob.getTop10Movie();
        model.addAttribute("showingMovie",showingMovie);
        model.addAttribute("niceMovie",niceMovie);
        model.addAttribute("top10movie",top10movie);
        return "/index";
    }

    @RequestMapping("/movie")
    public String movie(HttpServletRequest request,Model model){
        int pageNum=Integer.parseInt(request.getParameter("pageNum")==null?"1":request.getParameter("pageNum"));
        String movieType=request.getParameter("movietype");
        if(movieType==null)movieType="0";
        Page page=dob.getMovielists(movieType,pageNum);
        List<Movie> movies=(List<Movie>)page.getData();
        model.addAttribute("movies",movies);
        model.addAttribute("movietypeId",movieType);
        model.addAttribute("page",page);
        return "/movie";
    }

    private void gotoPage(HttpServletRequest arg0, HttpServletResponse arg1, String path)
            throws ServletException, IOException {

        RequestDispatcher rd = arg0.getRequestDispatcher(path);
        rd.forward(arg0, arg1);
    }

    private void ajaxReturn(HttpServletResponse response, Object obj) {
        String jsonStr = JSON.toJSONString(obj);
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Cache-Contral", "no-cache");
        response.setDateHeader("Expires", 0);
        PrintWriter pw = null;
        try {
            pw = response.getWriter();
            pw.print(jsonStr);
            pw.flush();
            pw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void debug(String str) {
        System.out.println(str);
    }
}
