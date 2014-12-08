package com.scalosoft.template.data;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.scalosoft.template.entity.Person;

@Repository
@Transactional
public class HomeData extends BaseData {
	
	@SuppressWarnings("unchecked")
	@Transactional(readOnly = true)
	public List<Person> listPerson(){
		String queryStr = "FROM "+Person.class.getName()+" p ORDER BY p.id";
		List<Person> listaEntity = getEntityManager().createQuery(queryStr).getResultList();
		return listaEntity;
	}
	
	@Transactional
	public void insertPerson(Person form){
		Person person = new Person();
		person.setName(form.getName());
		person.setEmail(form.getEmail());
		getEntityManager().persist(person);
	}
	
}
