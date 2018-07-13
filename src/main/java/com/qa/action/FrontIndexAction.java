package com.qa.action;

import com.qa.service.FrontIndexService;
import com.qa.service.QaBackQuesService;
import net.sf.json.JSONObject;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * function: 社区首页，面向浏览问答社区的所有人
 */
@Controller("FrontIndexAction")
@Scope("prototype")
public class FrontIndexAction extends BaseAction{

    @Resource
    private FrontIndexService frontIndexService;

    @Resource
    private QaBackQuesService qaBackQuesService;

    private Map quesList  = null;       //问题列表

    private Map theQues = null;         //单个问题


    private JSONObject quesComment;         //问题回复的JSON数据

    private Map qaTwoComment = null;        //二级回复
    private Map topicList = null;           //话题列表


    /**
     * 首页获取，即获取问题页
     * @return
     */
    public String getQuestionIndex() {

        Map<String, Object> map = new HashMap<>();

        String page = request.getParameter("page");     //页码
        String orderType = request.getParameter("orderType");   //排序方式

        quesList = frontIndexService.getQuesIndex(page,orderType);


        return "front_index";
    }


    /**
     * 单个问题的详情页面
     * @return
     */
    public String getTheQuestion() {
        Map<String, Object> map = new HashMap<>();
        String quesId_temp = request.getParameter("quesId");        //问题ID
        int quesid = Integer.parseInt(quesId_temp);
        theQues = frontIndexService.getTheQuesInfo(quesid);

        return "detail_ques";
    }


    /**
     *获取一级评论：即该问题下的直接评论
     * @return
     */
    public String getTheOneComment() {
        String quesId_temp = request.getParameter("quesId");
        int quesId = Integer.parseInt(quesId_temp);
        Map map = qaBackQuesService.getTheComment(quesId);  //接受返回map集合
        map.put("status","0");
        quesComment = JSONObject.fromObject(map);
        return "one_comment";
    }

    /**
     * 获取某个评论下的二级评论
     * @return
     */
    public String getTheTwoComment() {
        String pqId_temp = request.getParameter("pqId");
        int pqId = Integer.parseInt(pqId_temp);
        qaTwoComment = qaBackQuesService.getTheComment_two(pqId);  //接受返回map集合

        return "two_comment";
    }

    /**
     * 所有的话题查看
     * @return
     */
    public String topicIndex() {
        topicList = frontIndexService.getTopicIndex();
        return "topic_index";
    }



















    public Map getQuesList() {
        return quesList;
    }

    public void setQuesList(Map quesList) {
        this.quesList = quesList;
    }
    public Map getTheQues() {
        return theQues;
    }

    public void setTheQues(Map theQues) {
        this.theQues = theQues;
    }
    public JSONObject getQuesComment() {
        return quesComment;
    }

    public void setQuesComment(JSONObject quesComment) {
        this.quesComment = quesComment;
    }

    public Map getQaTwoComment() {
        return qaTwoComment;
    }

    public void setQaTwoComment(Map qaTwoComment) {
        this.qaTwoComment = qaTwoComment;
    }

    public Map getTopicList() {
        return topicList;
    }

    public void setTopicList(Map topicList) {
        this.topicList = topicList;
    }

}
