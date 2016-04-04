package com.tqe.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.tqe.base.enums.ImportType;
import com.tqe.base.vo.PageVO;
import com.tqe.po.Department;
import com.tqe.po.ImportResult;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;

import com.tqe.dao.TeacherDao;
import com.tqe.po.Teacher;
import com.tqe.po.User;

@Service
public class TeacherServiceImpl extends BaseService<Teacher>{

    private static final Log logger = LogFactory.getLog(TeacherServiceImpl.class);


	
	public Teacher getById(String id) {
		return  teacherDao.getById(id);
	}
	
	@Override
	public void save(Teacher e) {
		teacherDao.save(e);
	}
	
	public ImportResult saveAll(List<Teacher> list){
		boolean f = false;
        ImportResult result = null;
		Map<String,Integer> dMap = convertDepListToMap(departmentDao.findAll());
		try {
			if(list!=null){
                result  = new ImportResult(list.size(), ImportType.TEACHER.getName());
				for(Teacher t:list){
					if(t.getId()!=null){ 
						boolean reload = processTeaData(dMap, t);   //教师数据预处理
						if(reload){	//如果插入教师过程中 添加了学院信息 那么重新加载Map
							dMap = convertDepListToMap(departmentDao.findAll());
						}
                        try {
                            save(t);					//保存教师到数据库
                            result.addSuccessCnt();
                        } catch (DuplicateKeyException e1){
                            result.addExitCnt();
                        } catch (Exception e) {
                            logger.info(e.getMessage());
                            result.addFailCnt();
                            result.getFailMegs().add(e.getMessage());
                        }

					}
					
				}
				f= true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	@Override
	public List<Teacher> findAll() {
		
		return teacherDao.findAll();
	}
	
	public Teacher login(User user) {
		return teacherDao.login(user);
	}

	public List<Teacher> findByPage(int start, int length) {
		return teacherDao.findByPage(start ,length);
	}

	public List<Teacher> findByPageVO(PageVO pageVO) {
		List<Teacher> teacherList = teacherDao.findByPageVO(pageVO);
		for(Teacher t : teacherList){
			t.setIdNumber(null);
		}
		return teacherList;
	}
	
	/**
	 * 处理教师数据
	 *  如果教师对应的学院不存在 那么就插入该学院
	 * @param dMap 学院信息
	 */
	private boolean processTeaData(Map<String, Integer> dMap, Teacher tea) {
		boolean reload = false;
		if(StringUtils.isNoneBlank(tea.getDepartment()) && !dMap.containsKey(tea.getDepartment()) ) {
			departmentDao.save(new Department(tea.getDepartment()));
			dMap = convertDepListToMap(departmentDao.findAll());	//重新加载
			reload = true;

		}
		tea.setDepartmentId(dMap.get(tea.getDepartment()));
		return reload;
	}
}
