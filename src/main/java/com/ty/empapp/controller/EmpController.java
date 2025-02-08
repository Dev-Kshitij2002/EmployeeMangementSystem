package com.ty.empapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ty.empapp.entity.Employee;
import com.ty.empapp.service.EmailService;
import com.ty.empapp.service.EmpService;

import jakarta.servlet.http.HttpServletRequest;


@Controller
public class EmpController {

	private EmpService empService;

	public EmpController(EmpService empService) {
		this.empService = empService;
	}
	
	@Autowired
	private EmailService emailService;

	@GetMapping("/")
	public ModelAndView getRegister() {
		ModelAndView mv = new ModelAndView("register.jsp");
		mv.addObject("employee", new Employee());
		return mv;
	}

	@GetMapping("/add")
	public ModelAndView addEmployee() {
		ModelAndView mv = new ModelAndView("register.jsp");
		mv.addObject("employee", new Employee());
		return mv;
	}

	@GetMapping("/login")
	public String getLoginPage() {
		return "login.jsp";
	}

	@PostMapping("/save")
	public ModelAndView saveEmployee(Employee employee) {

		String msg = empService.save(employee);

		ModelAndView mv = new ModelAndView("login.jsp");
		mv.addObject("msg", msg);

		return mv;
	}

	@PostMapping("/login")
	public ModelAndView login(@RequestParam String email, 
            @RequestParam String password,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "5") int size) {

		boolean login = empService.login(email, password);

		ModelAndView mv = new ModelAndView();

		if (login) {
			mv.setViewName("home.jsp");

			Page<Employee> employeePage = empService.getPaginatedEmployees(page, size);

			mv.addObject("emps", employeePage.getContent());
			mv.addObject("currentPage", page);
	        mv.addObject("totalPages", employeePage.getTotalPages());
			mv.addObject("msg", "Login Successful");
		} else {
			mv.setViewName("login.jsp");
			mv.addObject("msg", "Invalid Credentials");
		}
		return mv;
	}

	@GetMapping("/home")
	public ModelAndView homePage(@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "5") int size) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("home.jsp");

		Page<Employee> employeePage = empService.getPaginatedEmployees(page, size);
	    
	    mv.addObject("emps", employeePage.getContent()); // List of employees for current page
	    mv.addObject("currentPage", page);
	    mv.addObject("totalPages", employeePage.getTotalPages());

	    return mv;
	}

	@PostMapping("/add")
	public ModelAndView addEmployee(Employee employee) {

		String msg = empService.update(employee);

		ModelAndView mv = new ModelAndView("add.jsp");
		mv.addObject("msg", msg);

		return mv;
	}

	@GetMapping("/edit")
	public ModelAndView editEmployee(@RequestParam Integer eid, @RequestParam String password, RedirectAttributes redirectAttributes) {
		Employee employee = empService.findById(eid);
		if (employee == null) {
	        redirectAttributes.addFlashAttribute("msg", "Employee not found.");
	        return new ModelAndView("redirect:/home");
	    }

	    if (!employee.getPassword().equals(password)) {
	        redirectAttributes.addFlashAttribute("msg", "Incorrect password! Update denied.");
	        return new ModelAndView("redirect:/home");
	    }

	    return new ModelAndView("update.jsp", "employee", employee);
	}

	@GetMapping("/delete")
	public ModelAndView getMethodName(@RequestParam Integer eid,  @RequestParam String password, RedirectAttributes redirectAttributes) {

	    Employee employee = empService.findById(eid);

	    if (employee == null) {
	        redirectAttributes.addFlashAttribute("msg", "Employee not found.");
	        return new ModelAndView("redirect:/home");
	    }

	    if (!employee.getPassword().equals(password)) {
	        redirectAttributes.addFlashAttribute("msg", "Incorrect password! Deletion denied.");
	        return new ModelAndView("redirect:/home");
	    }

	    // Call the service layer to delete the employee and get the message
	    String msg = empService.deleteByEid(eid);
	    redirectAttributes.addFlashAttribute("msg", "Employee deleted successfully.");  // Overwrite returned "Deleted" message

	    return new ModelAndView("redirect:/home");
	}

	@PostMapping("/send")
	public ModelAndView sendEmail(
	        @RequestParam String to,
	        @RequestParam String subject,
	        @RequestParam String body,
	        @RequestParam(required = false) MultipartFile attachment) {

	    try {
	        // Call EmailService to send email
	        emailService.sendEmailWithAttachment(to, subject, body, attachment);
	        
	        String msg = "Email sent successfully to " + to;
	        List<Employee> employees = empService.getAll(); 

	        ModelAndView mv = new ModelAndView("home.jsp");
	        mv.addObject("msg", msg);
	        mv.addObject("emps", employees); 
	        return mv;
	    } catch (Exception e) {
	        return new ModelAndView("email.jsp", "msg", "Failed to send email: " + e.getMessage());
	    }
	}

	@GetMapping("/email")
	public ModelAndView sendEmailPage(@RequestParam Integer eid) {
	    Employee employee = empService.findById(eid); // Fetch employee by ID
	    ModelAndView mv = new ModelAndView("email.jsp");
	    mv.addObject("toEmail", employee.getEmail()); // Pass employee email to the JSP
	    return mv;
	}
	
}