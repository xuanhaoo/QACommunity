package com.qa.service;

import com.qa.entity.QaBackUser;

import java.util.List;

public interface BackInfoService {
    public List<QaBackUser> findByname(String username);
     void updateInfo(QaBackUser qaBackUser);
    void updatePsInfo(QaBackUser qaBackUser);
}
