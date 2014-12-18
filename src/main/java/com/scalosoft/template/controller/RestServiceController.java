package com.scalosoft.template.controller;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.scalosoft.template.data.HomeData;
import com.scalosoft.template.model.Person;

@RestController
@RequestMapping(value = "/rest")
public class RestServiceController {
	
	private static final Logger logger = LoggerFactory.getLogger(RestServiceController.class);
	
	@Autowired
	private HomeData data ;
	
	@RequestMapping(value = "/load/{id}", method = RequestMethod.GET )
	public Person load(@PathVariable("id")  Integer id ,  HttpServletResponse response) {
		logger.debug("Load");
		logger.debug("Id:"+id);
		Person person = data.loadPerson(id);
		logger.debug("person:"+person);
		if(person==null){
			response.setStatus(404);
		}
		return person;
	}
}