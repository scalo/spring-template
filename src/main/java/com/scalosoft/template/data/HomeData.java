package com.scalosoft.template.data;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.scalosoft.template.entity.Person;

@Repository
public class HomeData extends BaseData {
	
	@SuppressWarnings("unchecked")
	@Transactional(readOnly = true)
	public List<Person> listPerson(){
		String queryStr = "FROM "+Person.class.getName()+" p ORDER BY p.id";
		List<Person> listaEntity = getEntityManager().createQuery(queryStr).getResultList();
		return listaEntity;
	}
}
