package com.qa.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.util.ValueStack;
import com.qa.entity.QaFrontUser;
import com.qa.entity.QaQuestion;
import com.qa.service.FrontUserService;
import javafx.scene.input.DataFormat;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;
import org.aspectj.util.FileUtil;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by InterlliJ IDEA.
 * User:3to
 * Date:17-12-30
 * Time:下午9:03
 */

@Controller("FrontUserAction")
@Scope("prototype")
public class FrontUserAction extends BaseAction {

    @Resource
    private FrontUserService frontUserService;
    private String status;      // 返回的json
    private QaFrontUser user;   // 添加的用户
    private File file;          // 上传的图片
    private String fileFileName;              //得到文件的名称，写法是固定的
    private String fileContentType;           // 上传文件的类型

    // 注册页面
    public String registerUser(){
        return "register";
    }

    /**
     * 创建时间：17-12-30 下午10:07
     * 作者：3to
     * 描述： 注册用户动作
    */
    public void registerFrontUser(){

    }

    /**
     * 创建时间：17-12-30 下午11:38
     * 作者：3to
     * 描述： 检验用户账户是否已经存在
    */
    public String checkAccount(){
        Map<String, Object> map = new HashMap<String, Object>();    // 定义map集合存如入返回json的集合
        boolean b;
        String name = request.getParameter("name");
        if(!name.equals("")){
            b = frontUserService.checkAccount(name);
            if (b){
                status = "1";
            }else{
                status = "0";
            }
        }else{
            status = "0";
        }
        map.put("status",status);
        JSONObject.fromObject(map);
        return "checkAccount";

    }
    /**
     * 创建时间：17-12-31 下午2:35
     * 作者：3to
     * 描述：添加新用户
    */
    public String addUser() throws UnsupportedEncodingException, NoSuchAlgorithmException {
        Map<String, Object> map = new HashMap<String, Object>();    // 定义map集合存如入返回json的集合
        String defaultPhoto = "static/images/default-avatar.png";

        // 添加创建时间
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date currentTime = new Date();
        Timestamp timestamp = new Timestamp(currentTime.getTime());
        user.setCreateDate(timestamp);
        user.setStatus(1);
        user.setPhoto(defaultPhoto);

        // 密码加密
        user.setPassword(super.EncoderByMd5(user.getPassword()));
        boolean b = frontUserService.addUser(user);

        if(b){
            status = "1";
        }else{
            status = "0";
        }
        map.put("status",status);
        JSONObject.fromObject(map);
        return "addUser";
    }



    // 登录页面
    public String UserLogin(){
        return "login";
    }

    /**
     * 创建时间：17-12-31 下午4:25
     * 作者：3to
     * 描述： 检查用户登录事件
    */
    public String checkLogin() throws UnsupportedEncodingException, NoSuchAlgorithmException {
        Map<String, Object> map = new HashMap<String, Object>();    // 定义map集合存如入返回json的集合

        String account = request.getParameter("account");
        String password = request.getParameter("password");


        password = super.EncoderByMd5(password);
        Map Qauser = frontUserService.checkLogin(account,password);
        // 如果验证成功,则将用户保存到session中
        if(Qauser.containsKey("id")){
            Map session = ActionContext.getContext().getSession();
            session.put("frontUser", Qauser);//存入session
            status = "1";
        }else{
            status = "0";
        }
        map.put("status",status);
        JSONObject.fromObject(map);
        return "checkLogin";
    }


    /** <input type="file" name="headImg"/>
     * 创建时间：18-1-1 下午1:20
     * 作者：3to
     * 描述： 用户登出事件
    */
    public String userLogout(){
        Map<String, Object> map = new HashMap<String, Object>();    // 定义map集合存如入返回json的集合
        Map session = ActionContext.getContext().getSession();
        Map user = (Map) session.get("frontUser");
        if(user != null){
            session.remove("frontUser");
            status = "1";
        }else{
            status = "0";
        }
        map.put("status",status);
        JSONObject.fromObject(map);
        return "logout";
    }


    /**
     * 创建时间：17-12-31 下午4:55
     * 作者：3to
     * 描述： 根据相关参数获得用户首页信息
    */
    // 用户首页
    public String userIndex(){
        // session
        Map session = ActionContext.getContext().getSession();
        Map user = (Map) session.get("frontUser");//获取session
        String pages =request.getParameter("page");
        if(pages == null){
            pages = "1";
        }
        // 获得页数
        Integer page = Integer.valueOf(pages);

        Map result = frontUserService.getQuestionByUser((Integer) user.get("id"),page);
        int count = (Integer) result.get("count");
        ArrayList list = (ArrayList) result.get("list");

        // 获取值栈对象
        ValueStack valueStack = ServletActionContext.getContext().getValueStack();
        valueStack.set("count",count);
        valueStack.set("list",list);
        return "userIndex";
    }

    /**
     * 创建时间：18-1-1 上午12:30z
     * 作者：3to
     * 描述： 用户基本设置
    */
    public String userSet(){
        return "userSet";
    }

    /**
     * 创建时间：18-1-1 下午5:04
     * 作者：3to
     * 描述： 更新用户基本信息
    */
    public String userUpdate(){
        Map<String, Object> map = new HashMap<String, Object>();    // 定义map集合存如入返回json的集合
        int sex = 0;
        int id;

        Map session = ActionContext.getContext().getSession();
        Map user = (Map) session.get("frontUser");//获取session
        id = (Integer) user.get("id");


        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String Ssex = request.getParameter("sex");
        // 如果传过来空
        if(!Ssex.equals("")){
            sex = Integer.valueOf(Ssex);
        }
        if(name!=null && email!=null && phone!=null){
            boolean b = frontUserService.userUpdate(id,name,email,phone,sex);
            if(b){
                status = "1";
            }else{
                status = "0";
            }
        }else{
            status = "0";
        }
        map.put("status",status);
        JSONObject.fromObject(map);
        return "userUpdate";
    }



    /**
     * 创建时间：18-1-1 下午5:47
     * 作者：3to
     * 描述： 检查用户密码是否正确
    */
    public String checkPass() throws UnsupportedEncodingException, NoSuchAlgorithmException {
        Map<String, Object> map = new HashMap<String, Object>();    // 定义map集合存如入返回json的集合
        String password;
        int id;
        boolean b;

        Map session = ActionContext.getContext().getSession();
        Map user = (Map) session.get("frontUser");//获取session
        id = (Integer) user.get("id");
        password = request.getParameter("password");
        if(password != null){
            password = super.EncoderByMd5(password);
            b = frontUserService.checkPass(id, password);
            if(b){
                status = "1";
            }else{
                status = "0";
            }
        }
        map.put("status",status);
        JSONObject.fromObject(map);
        return "checkPass";
    }


    /**
     * 创建时间：18-1-1 下午5:41
     * 作者：3to
     * 描述： 更新用户密码
    */
    public String userPass() throws UnsupportedEncodingException, NoSuchAlgorithmException {
        Map<String, Object> map = new HashMap<String, Object>();    // 定义map集合存如入返回json的集合
        String password;
        int id;
        boolean b;

        // 获取id及密码
        Map session = ActionContext.getContext().getSession();
        Map user = (Map) session.get("frontUser");//获取session
        id = (Integer) user.get("id");
        password = request.getParameter("password");

        // 进行密码更新操作
        if(password!=null){
            password = super.EncoderByMd5(password);
            b = frontUserService.userPassUpdate(id,password);
            if(b){
                status = "1";
            }else{
                status = "0";
            }
        }else {
            status = "0";
        }

        map.put("status",status);
        JSONObject.fromObject(map);
        return "userPass";
    }


    /**
     * 创建时间：18-1-2 上午12:28
     * 作者：3to
     * 描述： 上传用户图片
    */
    public String uploadPhoto() throws IOException {
        Map<String, Object> map = new HashMap<String, Object>();    // 定义map集合存如入返回json的集合
        int id;

        // 获取id
        Map session = ActionContext.getContext().getSession();
        Map user = (Map) session.get("frontUser");//获取session
        id = (Integer) user.get("id");

        String[] str = { ".jpg", ".gif","png" }; // 限制图片后缀
        if(file == null || file.length()>51200){        // 图片大小不能超过50kb
            status = "0";
        }

        // 遍历后缀
        for(String s:str){
            if(fileFileName.endsWith(s)){
                String realPath = ServletActionContext.getServletContext().getRealPath("/static/images");   // 图片存储路径

                // 随机生成图片文件名
                Random random = new Random(99999);
                int tempInt = random.nextInt();
                Date datenew = new Date();
                SimpleDateFormat sd = new SimpleDateFormat("yyyyMMddhhmmss");
                int last = fileFileName.lastIndexOf(".");
                String head = fileFileName.substring(0,last);
                String type = fileFileName.substring(last);
                fileFileName = head+sd.format(datenew)+tempInt+type;

                // 创建父文件夹
                if(file != null){
                    File saveFile = new File(realPath, fileFileName);
                    if(!saveFile.getParentFile().exists()){     // 如果图片文件夹不存在则创建新的多级文件夹
                        saveFile.getParentFile().mkdir();
                    }

                    System.out.println(fileFileName);

                    // 保存文件
                    FileUtil.copyFile(file, saveFile);
                    boolean b = frontUserService.saveUserPhoto(id,"/static/images/"+fileFileName);
                    if(b){
                        status = "1";
                    }else{
                        status = "0";
                    }
                }
            }else{
                status = "0";
            }
        }

        map.put("status",status);
        JSONObject.fromObject(map);
        return "uploadPhoto";
    }



    /**
     * 创建时间：18-1-2 下午2:53
     * 作者：3to
     * 描述： 用户主页信息
    */
    public String userHome(){
        int id;

        // 获得用户id
        Map session = ActionContext.getContext().getSession();
        Map user = (Map) session.get("frontUser");//获取session
        id = (Integer) user.get("id");

        // 只获取该用户的10个最新问题
        Map result = frontUserService.getQuestionByUser(id,1);
        ArrayList list = (ArrayList) result.get("list");

        // 只获取该用户的2个最新回答
        ArrayList comment = frontUserService.getCommentByUser(id);

        // 获取值栈对象
        ValueStack valueStack = ServletActionContext.getContext().getValueStack();
        valueStack.set("list",list);
        valueStack.set("comment",comment);
        System.out.println(comment);

        return "userHome";
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public QaFrontUser getUser() {
        return user;
    }

    public void setUser(QaFrontUser user) {
        this.user = user;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public String getFileFileName() {
        return fileFileName;
    }

    public void setFileFileName(String fileFileName) {
        this.fileFileName = fileFileName;
    }

    public String getFileContentType() {
        return fileContentType;
    }

    public void setFileContentType(String fileContentType) {
        this.fileContentType = fileContentType;
    }
}
