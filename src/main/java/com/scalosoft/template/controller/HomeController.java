package com.scalosoft.template.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.scalosoft.template.data.HomeData;
import com.scalosoft.template.entity.Person;

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
		logger.info("Welcome home! The client locale is {}.");
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG);
		
		String formattedDate = dateFormat.format(date);
		
		List<Person> listPersons = data.listPerson();
		model.addAttribute("person", new Person());
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("listPerson", listPersons );
		
		return "home";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public ModelAndView insert(Person form) {
		System.out.println("Insert");
		data.insertPerson(form);
		ModelAndView mv = new ModelAndView("redirect:/");
		return mv;
	}
	
}
