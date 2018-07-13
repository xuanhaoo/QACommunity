package com.qa.dao;

import com.qa.entity.QaFrontUser;

import java.util.List;
import java.util.Map;

/**
 *
 */
public interface QaCommunityUserDao {

    public Map getCommunityUserList(String pages, String limit, String name, String[] rangeDate);

    boolean deleteComUser(List<Integer> ids);

    boolean updateUser(QaFrontUser user);

    QaFrontUser findById(int id);
}
