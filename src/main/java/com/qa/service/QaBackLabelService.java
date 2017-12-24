package com.qa.service;

import com.qa.entity.QaLabel;

import java.util.List;

/**
 * Create by xuanhao on 2017/12/10
 */
public interface QaBackLabelService {

    public boolean addQaLabel(QaLabel qaLabel);

    public boolean updateQaLabelById(QaLabel qaLabel);

    public boolean deleteQaLabel(int l_id);

    public List getQaLabelByid(int l_id);

    public List getQaLabelList();

    public List getTopicList();


}
