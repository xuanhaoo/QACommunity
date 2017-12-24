package com.qa.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.util.ValueStack;
import com.qa.entity.BaTopicToLabel;
import com.qa.entity.QaLabel;
import com.qa.service.QaBackLabelService;
import net.sf.json.JSONObject;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.*;

import static com.opensymphony.xwork2.Action.SUCCESS;

/**
 * Create by xuanhao on 2017/12/10
 */
@Controller("QaBackLabelAction")
@Scope("prototype")
public class QaBackLabelAction extends BaseAction implements ModelDriven<QaLabel> {
    @Resource
    private QaBackLabelService qaBackLabelService;
    private QaLabel qaLabel = new QaLabel();
    private List<BaTopicToLabel> qaLabelsList = null; //设置值栈，标签列表
    public List<BaTopicToLabel> getQaLabelsList() {
        return qaLabelsList;
    }
    private List qaTopicList = null;   //话题值栈，值栈需要实现get方法，后同
    private List qaTheLabel = null;   //标签值栈
    public List getQaTopicList() {
        return qaTopicList;
    }

    public List getQaTheLabel() {
        return qaTheLabel;
    }
    private String resultJson;  //返回的json：增删改状态

    public String getResultJson() {
        return resultJson;
    }

    public void setResultJson(String resultJson) {
        this.resultJson = resultJson;
    }



    @Override
    public QaLabel getModel() {
        return this.qaLabel;
    }
    //get  set方法
    public QaLabel getQaLabel() {
        return qaLabel;
    }

    public void setQaLabel(QaLabel qaLabel) {
        this.qaLabel = qaLabel;
    }

    /**
     * 作者：lxh，下同
     * 获取所有标签列表
     * @return
     */
    public String getAllLabel() {
        qaLabelsList = qaBackLabelService.getQaLabelList(); //放入值栈
        return "label_list";

    }

    /**
     * 添加标签获取话题列表并渲染添加视图
     * @return
     */
    public String topicSelect() {
        qaTopicList = qaBackLabelService.getTopicList();  //接受放入值栈
        return "addLabel";
    }

    /**
     * 添加标签入库
     * @return
     */
    public String addLabel() {
        //定义map集合存取返回信息信息
        Map<String, Object> map = new HashMap<String, Object>();
        String status = null;       //map  --key
//        System.out.println(qaLabel.getLabelName());
        Date date = new Date();
        java.sql.Date  date1=new java.sql.Date(date.getTime());
        qaLabel.setCreateDate(date1);
        if(qaBackLabelService.addQaLabel(qaLabel)) {
            status = "0";   //添加成功代码标识
        }else {
            status = "1";      //添加失败标识
        }
        map.put("status", status);
        //初始化json变量
        if(resultJson != null) {
            resultJson = null;
        }
        //转化为json
        resultJson = JSONObject.fromObject(map).toString();
        return SUCCESS;
    }

    /**
     * 通过传入id来获取标签信息
     * 编辑标签数据获取
     * @return
     */
    public String updateView() {
        String lId_temp = request.getParameter("lId");
        int lId = Integer.parseInt(lId_temp);       //转化int类型
        qaTheLabel = qaBackLabelService.getQaLabelByid(lId); //指定的标签
        qaTopicList = qaBackLabelService.getTopicList();     //话题列表
        return "updateLabelView";
    }

    /**
     * 更新标签信息的提交控制
     * @return
     */
    public String updateLabel() {
        //定义map集合存取返回信息信息
        Map<String, Object> map = new HashMap<String, Object>();
        String status = null;
        if(qaBackLabelService.updateQaLabelById(qaLabel)) {
            status = "0";       //成功
        }else {
            status = "1";       //失败
        }
        //放入map集合
        map.put("status", status);
        if(resultJson != null) {
            resultJson = null;
        }
        //转化json
        resultJson = JSONObject.fromObject(map).toString();
        return SUCCESS;
    }

    /**
     * 删除标签，根据传入id参数
     * @return
     */
    public String deleteLabel() {
        Map<String, Object> map = new HashMap<String, Object>();
        String lId_temp = request.getParameter("lId");
        int lId = Integer.parseInt(lId_temp);
        String status = null;
        if(qaBackLabelService.deleteQaLabel(lId)) {
            status = "0";
        }else {
            status = "1";
        }
        map.put("status", status);
        if(resultJson != null) {
            resultJson = null;
        }
        resultJson = JSONObject.fromObject(map).toString();
        return SUCCESS;
    }



}
