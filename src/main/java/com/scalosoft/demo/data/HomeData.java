package com.scalosoft.demo.data;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.scalosoft.demo.entity.Person;

@Repository
public class HomeData extends BaseData {
	
	@SuppressWarnings("unchecked")
	@Transactional(readOnly = true)
	public List<Person> listPerson(){
		String queryStr = "FROM "+Person.class.getName()+" p";
		List<Person> listaEntity = getEntityManager().createQuery(queryStr).getResultList();
		return listaEntity;
	}
}
