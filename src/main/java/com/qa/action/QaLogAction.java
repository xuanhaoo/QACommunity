package com.qa.action;

import com.opensymphony.xwork2.ActionContext;
import com.qa.service.QaLogRecordService;
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
 * Date:17-12-12
 * Time:下午1:26
 */

@Controller("LogAction")
@Scope("prototype")
public class QaLogAction extends BaseAction {

    @Autowired
    private QaLogRecordService qaLogRecordService;  // 自动装配
    private ArrayList qaLogList;    // 日志对象列表
    private JSONObject info;            // 返回json类型info
    private JSONObject status;            // 返回json类型status


    /**
     * 创建时间：17-12-12 下午1:39
     * 作者：3to
     * 描述： 返回日志列表
    */
    public String logList(){
        return "logList";
    }

    /**
     * 创建时间：17-12-12 下午3:34
     * 作者：3to
     * 描述： 通过ajax请求,返回json数据
    */
    public String getList(){
        Map<String, Object> map = new HashMap<String, Object>();    // 定义map集合存如入返回json的集合
        Map receiveMap = new HashMap<String, Object>();             // 定义map集合接受返回的数据
        String pages;                                               // 请求页数
        String limit;                                               // 请求每页数量
        String[] rangeDate = new String[4];                         // 请求时间范围

        // 获得请求参数
        Map<String, Object> params = (Map) ActionContext.getContext().getParameters();
        pages = ((String []) params.get("page"))[0];
        limit = ((String[]) params.get("limit"))[0];
        rangeDate[0] = ((String[]) params.get("startDate"))[0];       // 请求时间范围

        // 如果包含结尾时间
        if(params.containsKey("endDate")){
            rangeDate[1] = ((String[]) params.get("endDate"))[0];
        }

        System.out.println(rangeDate[0]);

        // 如果参数错误,则返回
        if (pages.equals("") || limit.equals("") || rangeDate.length== 0){
            map.put("code","1");
            map.put("msg","参数返回错误!");
        }else{
            receiveMap = qaLogRecordService.queryLog(pages, limit, rangeDate);
            map.put("code","0");
            map.put("msg","");
            map.put("count",receiveMap.get("count"));
            map.put("data",receiveMap.get("list"));
        }


        info = JSONObject.fromObject(map);
        return "list";
    }


    /**
     * 创建时间：17-12-14 下午3:52
     * 作者：3to
     * 描述： 通过ajax请求,进行数据删除
    */
    public String deleteList(){
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
        istrue = qaLogRecordService.deleteLog(ids);

        if(istrue){
            map.put("status","1");
        }else{
            map.put("status","0");
        }
        status = JSONObject.fromObject(map);
        return "delete";
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
}
