package com.qa.service.Impl;

import com.qa.dao.BackInfoDao;
import com.qa.entity.QaBackUser;
import com.qa.service.BackInfoService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service("BackInfoService")
@Transactional
public class BackInfoServiceImpl implements BackInfoService {
    @Resource
    private BackInfoDao BackInfoDao;
    @Override
    public List<QaBackUser> findByname(String username){
    QaBackUser QabackUser =new QaBackUser();
    List<QaBackUser> list=BackInfoDao.findAll(username);


    return list;

    }
    @Override
    public void updateInfo(QaBackUser qaBackUser){
        System.out.println("dsadsadasd");
        System.out.println(qaBackUser.getAccount());
        BackInfoDao.updateInfo(qaBackUser);
    }
    public void updatePsInfo(QaBackUser qaBackUser){
        System.out.println("7788nihaoa"+qaBackUser.getAccount());
        System.out.println(qaBackUser.getPassword());
        BackInfoDao.updatePsInfo(qaBackUser);

    }






}
