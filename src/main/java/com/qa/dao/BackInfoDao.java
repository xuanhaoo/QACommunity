package com.qa.dao;

import com.qa.entity.QaBackUser;
import java.util.List;
public interface BackInfoDao {

    public List<QaBackUser> findAll(String username);
    void updateInfo(QaBackUser qaBackUser);
    void updatePsInfo(QaBackUser qaBackUser);
}
