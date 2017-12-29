package com.qa.action;

import com.qa.service.FrontIndexService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * Create by xuanhao on 2017/12/28
 * function: 社区首页，面向浏览问答社区的所有人
 */
@Controller("FrontIndexAction")
@Scope("prototype")
public class FrontIndexAction extends BaseAction{

    @Resource
    private FrontIndexService frontIndexService;

    private Map quesList  = null;

    private Map theQues = null;



    public String getQuestionIndex() {

        //session.setAttribute("frontUser","梁大大");
        Map<String, Object> map = new HashMap<>();

        String page = request.getParameter("page");
        String orderType = request.getParameter("orderType");

        quesList = frontIndexService.getQuesIndex(page,orderType);


        return "front_index";
    }


    /**
     * 单个问题的详情页面
     * @return
     */
    public String getTheQuestion() {
        Map<String, Object> map = new HashMap<>();
        String quesId_temp = request.getParameter("quesId");
        int quesid = Integer.parseInt(quesId_temp);
        theQues = frontIndexService.getTheQuesInfo(quesid);

        return "detail_ques";
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

}
