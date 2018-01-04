package com.qa.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.util.ValueStack;
import com.qa.entity.QaComment;
import com.qa.entity.QaQuestion;
import com.qa.service.FrontQuestionService;
import com.qa.service.FrontUserService;
import com.qa.service.QaBackLabelService;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by InterlliJ IDEA.
 * User:3to
 * Date:18-1-2
 * Time:下午9:32
 */

@Controller("FrontQuestionAction")
@Scope("prototype")
public class FrontQuestionAction extends BaseAction {

    @Resource
    private FrontQuestionService frontQuestionService;
    @Resource
    private QaBackLabelService qaBackLabelService;
    private QaComment qaComment;
    private QaQuestion qaQuestion;
    private String status;      // 返回的json
    private List topicList;  //二级评论中转

    private JSONObject labelList;


    /**
     * 创建时间：18-1-2 下午9:39
     * 作者：3to
     * 描述： 问题详情
    */
    public String questionDetail(){

        int id = 0;
        Object question = null;
        Object comment = null;


        // 获取问题id
        String ids = request.getParameter("id");
        if(ids != null){
            id = Integer.valueOf(ids);

            // 获取问题详情
            question = frontQuestionService.getQuestionById(id);

            // 获取问题回复信息
            comment = frontQuestionService.getCommentById(id);
        }

        ValueStack valueStack = ServletActionContext.getContext().getValueStack();
        valueStack.set("question",question);
        valueStack.set("comment",comment);
        valueStack.set("id",id);

        // 如果没有该问题，返回错误index
        if(question == null){
            return "error";
        }
        return "questionDetail";
    }

    /**
     * 发布二级评论视图
     * @return
     */
    public String addTwoCommentView() {
        String commId = request.getParameter("cPid");
        String quesId = request.getParameter("quesId");
        ValueStack valueStack = ServletActionContext.getContext().getValueStack();
        valueStack.set("cPid",commId);
        valueStack.set("quesId",quesId);
        return "addTwoCommentView";
    }

    /**
     * 创建时间：18-1-3 下午5:08
     * 作者：3to
     * 描述： 回复问题
    */
    public String questionReply(){

        Map<String, Object> map = new HashMap<String, Object>();    // 定义map集合存如入返回json的集合

        status = "0";

        // 添加创建时间
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date currentTime = new Date();
        Timestamp timestamp = new Timestamp(currentTime.getTime());

        // 获取用户信息
        Map session = ActionContext.getContext().getSession();
        Map user = (Map) session.get("frontUser");//获取session
        int id = (int) user.get("id");

        if(qaComment !=null){
            qaComment.setCreateDate(timestamp);
            qaComment.setCreateUser(id);

//            System.out.println(qaComment.getPid());

            boolean b = frontQuestionService.addReply(qaComment);
            if(b){
                status = "1";
            }

        }

        map.put("status",status);
        JSONObject.fromObject(map);

        return "questionReply";
    }

    /**
     *发布问题视图
     * @return
     */
    public String addQuestion() {
        topicList = qaBackLabelService.getTopicList();
        return "addQuestionView";
    }

    /**
     * ajax获取话题下的标签
     * @return
     */
    public String ajaxForLabel() {
        String topicId= request.getParameter("topicId");
        int topicIdInt = Integer.parseInt(topicId);
        Map map = qaBackLabelService.getLabelToTopic(topicIdInt);
        map.put("status",0);
        labelList = JSONObject.fromObject(map);
        return "ajaxLabel";
    }

    /**
     * 添加问题的提交
     * @return
     */
    public String addQuesHandle() {

        Map<String, Object> map = new HashMap<String, Object>();    // 定义map集合存如入返回json的集合

        status = "0";

        // 添加创建时间
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date currentTime = new Date();
        Timestamp timestamp = new Timestamp(currentTime.getTime());

        // 获取用户信息
        Map session = ActionContext.getContext().getSession();
        Map user = (Map) session.get("frontUser");//获取session
        int id = (int) user.get("id");

        if(qaQuestion !=null){
            qaQuestion.setCreateDate(timestamp);
            qaQuestion.setCreateUser(id);

            boolean b = frontQuestionService.addQues(qaQuestion);
            if(b){
                status = "1";
            }

        }

        map.put("status",status);
        JSONObject.fromObject(map);
        return "addQuesResult";
    }




    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public QaComment getQaComment() {
        return qaComment;
    }

    public void setQaComment(QaComment qaComment) {
        this.qaComment = qaComment;
    }

    public List getTopicList() {
        return topicList;
    }

    public void setTopicList(List topicList) {
        this.topicList = topicList;
    }
    public QaQuestion getQaQuestion() {
        return qaQuestion;
    }

    public void setQaQuestion(QaQuestion qaQuestion) {
        this.qaQuestion = qaQuestion;
    }

    public JSONObject getLabelList() {
        return labelList;
    }

    public void setLabelList(JSONObject labelList) {
        this.labelList = labelList;
    }

}
