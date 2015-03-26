package com.tqe.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tqe.dao.AdminDao;
import com.tqe.dao.BatchesDao;
import com.tqe.dao.CourseDao;
import com.tqe.dao.EvalDao;
import com.tqe.dao.EvalTableDao;
import com.tqe.dao.StudentDao;
import com.tqe.dao.TeacherDao;

@Component
public abstract class BaseService<E> {
	@Resource(name="adminDao")
	public AdminDao adminDao;
	
	@Autowired
	public TeacherDao teacherDao;
	
	@Autowired
	public BatchesDao batchesDao;
	
	@Autowired
	public CourseDao courseDao;
	
	@Autowired
	public EvalTableDao evalTableDao;
	
	@Autowired
	public StudentDao studentDao;
	
	@Autowired
	public EvalDao evalDao;
	
	public  E getById(Integer id){
		return null;
	}
	public  void save(E e){
		
	}
	
	public  List<E> findAll(){
		return null;
	}
}
