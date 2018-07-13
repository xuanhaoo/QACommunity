package com.qa.dao;

import com.qa.entity.QaLogRecord;

import java.util.List;
import java.util.Map;

/**
 *
 */
public interface QaLogRecordDao {

    /**
     * 添加日志信息
     */
    public void addLog(QaLogRecord logRecord);

    public Boolean deleteLog(List<Integer> logRecords);

    public Map queryLog(String pages, String limit, String[] time);

}
