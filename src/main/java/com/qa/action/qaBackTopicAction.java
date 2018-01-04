package com.qa.action;

import com.opensymphony.xwork2.ModelDriven;
import com.qa.entity.QaBackUser;
import com.qa.entity.QaTopic;
import com.qa.service.QaTopicService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller("qaBackTopicAction")
@Scope("prototype")
public class qaBackTopicAction implements ModelDriven<QaTopic> {

    @Resource
    private QaTopicService QaTopicService;
    private QaTopic qaTopic;
    Date date = new Date();
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");





    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public List getList() {
        return list;
    }

    public void setList(List list) {
        this.list = list;
    }

    private List list=null;
    @Override
    public QaTopic getModel() {
        this.qaTopic=new QaTopic();
        return  qaTopic;
    }
    public String FindAllTopic(){
        List<QaTopic> qaTopic = QaTopicService.findAllTopic();
        list = qaTopic;

        return "FindAllTopic";
    }
    public String DeleteTopic(){
        System.out.println("sdsadasdsadas"+id);

        QaTopicService.DeleteTopic(id);
        return "DeleteSuccess";
    }
    public String UpdateTopic(){
        System.out.println(qaTopic.getTopicName());
        System.out.println(qaTopic.getRemarks());
        System.out.println(qaTopic.getToId());
        System.out.println(id);

        QaTopicService.UpdateTopic(qaTopic);
        return "UpdateSuccess";
    }
    public String AddTopic(){
        QaTopicService.AddTopic(qaTopic);
        return "AddSuccess";
    }
}
