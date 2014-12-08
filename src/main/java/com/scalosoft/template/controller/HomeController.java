package com.scalosoft.template.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.scalosoft.template.data.HomeData;
import com.scalosoft.template.model.Person;

/**
 * Handles requests for the application home page.
 */

@Controller
public class HomeController {
	
	@Autowired
	private HomeData data ;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		logger.debug("Welcome home! The client locale is {}.");
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG);
		
		String formattedDate = dateFormat.format(date);
		
		List<Person> listPersons = data.listPerson();
		model.addAttribute("person", new Person());
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("listPerson", listPersons );
		
		return "home";
	}
	
	@RequestMapping(value = "/load/{id}", method = RequestMethod.GET)
	public ModelAndView load(@PathVariable("id")  Integer id) {
		logger.debug("Load");
		logger.debug("Id:"+id);
		Person person = data.loadPerson(id);
		List<Person> listPersons = data.listPerson();
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("person",person);
		mv.addObject("listPerson", listPersons );
		return mv;
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public ModelAndView insert(Person person) {
		logger.debug("Insert");
		logger.debug("Person:"+person);
		data.insertPerson(person);
		ModelAndView mv = new ModelAndView("redirect:/");
		return mv;
	}
	
}
