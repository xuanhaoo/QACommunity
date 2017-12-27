package com.qa.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.qa.entity.BackQuestion;
import com.qa.entity.QaQuestion;
import com.qa.service.QaBackQuesService;
import net.sf.json.JSON;
import net.sf.json.JSONObject;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Create by xuanhao on 2017/12/13
 */
@Controller("QaBackQuesAction")
@Scope("prototype")
public class QaBackQuesAction extends BaseAction implements ModelDriven<QaQuestion>{
    @Resource
    private QaBackQuesService qaBackQuesService;
    private QaQuestion qaQuestion = new QaQuestion();
    private List qaQuesList = null;  //设置问题列表值栈
    private JSONObject quesList = null;   //设置返回的json类型的问题列表
    private JSONObject status = null;    //设置返回的json类型的标识
    private JSONObject singleQuesInfo = null;  //单个问题的信息json
    private JSONObject quesComment = null;      //问题评论json
    private Map singleInfo = null;          //map型值栈




    /**
     * 问题列表值栈的get方法
     * @return
     */
    public List getQaQuesList() {
        return qaQuesList;
    }


    /**
     * 实现ModelDriven需要实现的方法
     * @return
     */
    @Override
    public QaQuestion getModel() {
        return this.qaQuestion;
    }


    /**
     * 作者：xunahao ，下同
     * 获取问题列表
     */
    public String allQuestionView() {
        return "ques_list_view";
    }
    public String getAllQuestion() {
        //初始化map集合
        Map<String, Object> map = new HashMap<String, Object>();
        Map receiveMap = new HashMap<String, Object>();
        String pages;                     // 请求页数
        String limit;                     //每页限制
        // 获得请求参数
        Map<String, Object> params = (Map) ActionContext.getContext().getParameters();
        pages = ((String []) params.get("page"))[0];
        limit = ((String[]) params.get("limit"))[0];
        if(pages.equals("") || limit.equals("")) {
            map.put("code","1");
            map.put("msg","参数返回错误!");
        }else {
            receiveMap = qaBackQuesService.getQuestionList(pages,limit);
            map.put("code","0");  //成功
            map.put("msg","");
            map.put("count",receiveMap.get("count"));
            map.put("data",receiveMap.get("quesLists"));
        }
//        List ll = (List) map.get("data");
//        for(Object bt: ll) {
//            System.out.println(bt);
//        }
        //转化json形式数据
        quesList = JSONObject.fromObject(map);
        return "question_list";

    }

    /**
     * 根据问题id获取某个问题详细信息，返回值栈形式
     * @return  值栈
     */
    public String getTheQues() {

        // 获得请求参数:问题id
        String qIdTemp = request.getParameter("qId");
        int qId = Integer.parseInt(qIdTemp);        //转化为int形
        singleInfo = qaBackQuesService.getTheQuestion(qId);
        return "single_question";
    }


    /**
     * 根据日期来获取浏览信息，ajax返回接口
     * @return  json形式数据
     */
    public String getBrowForDate() {
        //获取时间段
        String qId_temp = request.getParameter("qId");
        int qId = Integer.parseInt(qId_temp);
        String time_temp = request.getParameter("browdate");
        String[] time;
        //判断时间是否为空，为空则在到层中默认赋值
        if(time_temp == null || time_temp.length() <= 0) {
            time = null;
        }else {
            //将开始时间和结束时间分隔到数组中，时间格式化如：2017-12-19 00:00:00
            time = time_temp.split(" - ");
            time[0] = time[0]+" 00:00:00";
            time[1] = time[1]+" 00:00:00";
        }

        Map map = qaBackQuesService.getBrowseForDate(qId,time);
        map.put("status", "0");
        singleQuesInfo = JSONObject.fromObject(map);
        return "brow_date";
    }

    /**
     *获取一级评论：即该问题下的直接评论
     * @return
     */
    public String getComment() {
        String qId_temp = request.getParameter("qId");
        int qId = Integer.parseInt(qId_temp);
        Map map = qaBackQuesService.getTheComment(qId);  //接受返回map集合
        map.put("status","0");
        quesComment = JSONObject.fromObject(map);
        return "comment_one";
    }


    /**
     * 以下是一些变量的实现方法：如值栈或json数据
     * @return
     */
    public JSONObject getQuesList() {
        return quesList;
    }

    public void setQuesList(JSONObject quesList) {
        this.quesList = quesList;
    }
    public JSONObject getStatus() {
        return status;
    }

    public void setStatus(JSONObject status) {
        this.status = status;
    }
    public JSONObject getSingleQuesInfo() {
        return singleQuesInfo;
    }

    public void setSingleQuesInfo(JSONObject singleQuesInfo) {

        this.singleQuesInfo = singleQuesInfo;
    }
    public Map getSingleInfo() {
        return singleInfo;
    }

    public void setSingleInfo(Map singleInfo) {
        this.singleInfo = singleInfo;
    }
    public JSONObject getQuesComment() {
        return quesComment;
    }

    public void setQuesComment(JSONObject quesComment) {
        this.quesComment = quesComment;
    }
}
