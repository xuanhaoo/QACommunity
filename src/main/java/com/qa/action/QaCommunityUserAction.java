package com.qa.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.util.ValueStack;
import com.qa.entity.QaBackUser;
import com.qa.entity.QaFrontUser;
import com.qa.service.QaCommunityUserService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by InterlliJ IDEA.
 * User:3to
 * Date:17-12-19
 * Time:下午5:16
 */

@Controller("CommunityUserAction")
@Scope("prototype")
public class QaCommunityUserAction extends BaseAction {

    @Autowired
    private QaCommunityUserService qaCommunityUserService;
    private QaFrontUser user;
    private JSONObject info;            // 返回json类型info
    private JSONObject status;            // 返回json类型info


    public String communityList(){
        return "communityList";
    }

    /**
     * 创建时间：17-12-26 下午2:17
     * 作者：3to
     * 描述： 根据id获得用户信息
    */
    public String editUser() throws Exception{
        int id;
        Map<String, Object> params = (Map) ActionContext.getContext().getParameters();
        // 获得id
        id = Integer.parseInt(((String []) params.get("id"))[0]);
        user = qaCommunityUserService.findById(id);
        return "editUser";
    }


    /**
     * 创建时间：17-12-23 下午1:44
     * 作者：3to
     * 描述： 获取社区用户列表
    */
    public String getCommunityList(){

        Map<String, Object> map = new HashMap<String, Object>();    // 定义map集合存如入返回json的集合
        String pages;     // 当前页数
        String limit;     // 分页数量
        String name = "";     // 用户名称
        String[] rangeDate = new String[2];     // 获取日期
        Map userMap;

        // 获取值栈对象
        ActionContext context = ActionContext.getContext();
        ValueStack valueStack = context.getValueStack();


        Map<String, Object> params = (Map) ActionContext.getContext().getParameters();
        pages = ((String []) params.get("page"))[0];
        limit = ((String[]) params.get("limit"))[0];

        // 如果包含名字
        if(params.containsKey("name")){
            name = ((String[]) params.get("name"))[0];
        }

        // 如果包含结尾时间
        if(params.containsKey("startDate") && params.containsKey("endDate")){
            String start = ((String[]) params.get("startDate"))[0];
            String end = ((String[]) params.get("endDate"))[0];
            if(!start.equals("") && !end.equals("")){
                rangeDate[0] = start;
                rangeDate[1] = end;
            }
        }


        // 如果参数错误,则返回
        if (pages.equals("") || limit.equals("")){
            map.put("code","1");
            map.put("msg","参数传入错误!");
        }else{
            userMap = qaCommunityUserService.getComUserList(pages, limit, name, rangeDate);
            map.put("code","0");
            map.put("msg","");
            map.put("count",userMap.get("count"));
            map.put("data",userMap.get("list"));
        }

        info = JSONObject.fromObject(map);
        return "list";
    }



    /**
     * 创建时间：17-12-26 上午11:38
     * 作者：3to
     * 描述： 删除用户集合
    */
    public String delComUser(){
        Map<String, Object> map = new HashMap<String, Object>();    // 定义map集合存如入返回json的集合
        String[] list;                 // 请求的id集合
        boolean istrue;

        // 获得请求参数
        Map<String, Object> params = (Map) ActionContext.getContext().getParameters();
        list = ((String []) params.get("id"));

        // 转换为List集合
        List<Integer> ids = new ArrayList<Integer>();
        for (int j = 0; j < list.length; j++) {
            ids.add(Integer.parseInt(list[j]));
        }

        // 得到返回的数字
        istrue = qaCommunityUserService.deleteLog(ids);

        if(istrue){
            map.put("status","1");
        }else{
            map.put("status","0");
        }
        status = JSONObject.fromObject(map);
        return "delete";
    }



    /**updateUser
     * 创建时间：17-12-26 下午1:54
     * 作者：3to
     * 描述： 更新用户信息
    */
    public String updateComUser(){
        boolean istrue;
        Map<String, Object> map = new HashMap<String, Object>();    // 定义map集合存如入返回json的集合
        istrue = qaCommunityUserService.updateUser(user);
        map.put("status",istrue);
        status = JSONObject.fromObject(map);
        return "update";
    }



    public JSONObject getInfo() {
        return info;
    }

    public void setInfo(JSONObject info) {
        this.info = info;
    }

    public JSONObject getStatus() {
        return status;
    }

    public void setStatus(JSONObject status) {
        this.status = status;
    }

    public QaFrontUser getUser() {
        return user;
    }

    public void setUser(QaFrontUser user) {
        this.user = user;
    }
}
