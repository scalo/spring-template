package com.scalosoft.template.data;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.scalosoft.template.model.Person;

@Repository
@Transactional
public class HomeData extends BaseData {
	
	@SuppressWarnings("unchecked")
	@Transactional(readOnly = true)
	public List<Person> listPerson(){
		String queryStr = "FROM "+Person.class.getName()+" p";
		List<Person> listaEntity = getEntityManager().createQuery(queryStr).getResultList();
		return listaEntity;
	}
	
	@Transactional(readOnly = true)
	public Person loadPerson(Integer id){
		Person person = getEntityManager().find(Person.class,id);
		return person;
	}
	
	@Transactional
	public void insertPerson(Person person){
		person.setModTimestamp(new Date());
		getEntityManager().persist(person);
	}
	
}
