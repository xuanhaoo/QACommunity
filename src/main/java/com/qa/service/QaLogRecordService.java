package com.qa.service;

import com.qa.entity.QaLogRecord;

import java.util.List;
import java.util.Map;

/**
 * Created by InterlliJ IDEA.
 * User:3to
 * Date:17-12-11
 * Time:上午10:46
 */
public interface QaLogRecordService {

    public void addLog(QaLogRecord logRecord);

    public Boolean deleteLog(List<Integer> logRecords);

    Map queryLog(String pages, String limit, String[] time);
}
