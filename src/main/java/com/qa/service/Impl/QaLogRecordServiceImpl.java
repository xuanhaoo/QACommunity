package com.qa.service.Impl;

import com.qa.dao.QaLogRecordDao;
import com.qa.entity.QaLogRecord;
import com.qa.service.QaLogRecordService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;


/**
 * Created by InterlliJ IDEA.
 * User:3to
 * Date:17-12-11
 * Time:上午10:47
 */

// 注入服务
@Service("LogRecordService")
@Transactional
public class QaLogRecordServiceImpl implements QaLogRecordService {

    @Resource
    private QaLogRecordDao logRecordDao;

    /**
     * 创建时间：17-12-11 下午4:44
     * 作者：3to
     * 描述：调用dao层添加日志
    */
    @Override
    public void addLog(QaLogRecord logRecord) {
        this.logRecordDao.addLog(logRecord);
    }

    /**
     * 创建时间：17-12-11 下午4:44
     * 作者：3to
     * 描述：传入日志id集合进行日志删除
     * @param logRecords
     */
    @Override
    public Boolean deleteLog(List<Integer> logRecords) {
        return this.logRecordDao.deleteLog(logRecords);
    }

    /**
     * 创建时间：17-12-11 下午4:52
     * 作者：3to
     * 描述：根据传入的条件集合,进行日志查找并返回
    */
    @Override
    public Map queryLog(String pages, String limit, String[] time) {
        return this.logRecordDao.queryLog(pages, limit, time);
    }
}
