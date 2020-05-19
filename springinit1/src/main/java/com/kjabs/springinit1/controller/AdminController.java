package com.kjabs.springinit1.controller;



import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kjabs.springinit1.entity.Book;
import com.kjabs.springinit1.entity.BookOrder;
import com.kjabs.springinit1.entity.Category;
import com.kjabs.springinit1.entity.Customer;
import com.kjabs.springinit1.entity.OrderDetail;
import com.kjabs.springinit1.entity.Review;
import com.kjabs.springinit1.entity.Test;
import com.kjabs.springinit1.entity.Users;
import com.kjabs.springinit1.service.BookOrderService;
import com.kjabs.springinit1.service.BookService;
import com.kjabs.springinit1.service.CategoryService;
import com.kjabs.springinit1.service.CustomerService;
import com.kjabs.springinit1.service.ReviewService;
import com.kjabs.springinit1.service.TestService;
import com.kjabs.springinit1.service.UsersService;

@Controller
@RequestMapping("/Admin")
public class AdminController {
	

	 public static String uploadDirectory = System.getProperty("user.dir")+"/uploads";
	
	private UsersService usersService;
	private CategoryService categoryService;
	private BookService bookService;
	private TestService testService;
	private CustomerService customerService;
	private ReviewService reviewService;
	private BookOrderService bookOrderService;
	@Autowired
	public AdminController(UsersService theUserService,
			CategoryService theCategoryService,
			BookService theBookService,
			TestService theTestService,
			CustomerService theCustomerService,
			ReviewService theReviewService,
			BookOrderService theBookOrderService)
	{
		usersService=theUserService;
		categoryService=theCategoryService;
		bookService=theBookService;
		testService=theTestService;
		customerService=theCustomerService;
		reviewService=theReviewService;
		bookOrderService=theBookOrderService;
		
	}
	
	@RequestMapping("/home")
	public String Home(Model theModel)
	{
		
        return "admin/index1";
	}
	
	//users//
	
	
	@RequestMapping("/users")
	public String AdminHome(Model theModel)
	{
		List<Users> users= usersService.getAllUsers();
		theModel.addAttribute("users", users);
        return "admin/users/users_list";
	}
	
	@RequestMapping("/userform")
	public String userForm(Model theModel)
	{
	   Users user=new Users();
	   theModel.addAttribute("users", user);
	
       return "admin/users/user_form";
	}
	
	@RequestMapping("/addUser")
	public String addUser(@ModelAttribute ("users") Users theUser)
	{
		usersService.saveOrUpdate(theUser);
		return "redirect:/Admin/users";
	}
	
	@GetMapping("/showFormForUpdate")
	public String showFormForUpdate(@RequestParam("userId")int userId,Model theModel) {
	
		Users user=usersService.getUserById(userId);
		theModel.addAttribute("users",user);
	
	return "user_form";	
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("userId")int userId)
	{
		usersService.delete(userId);
		return "redirect:/Admin/users";
	}
	
	
	//categories//
	
	@RequestMapping("/categories")
	public String categories(Model theModel)
	{
		List<Category> categories=categoryService.getAllCategories();
		theModel.addAttribute("categories", categories);
        return "admin/category/categories_list";
	}
	
	@RequestMapping("/categoryForm")
	public String categoryForm(Model theModel)
	{
	   Category category=new Category();
	   theModel.addAttribute("category", category);
	
       return "admin/category/category_form";
	}
	
	@RequestMapping("/addCategory")
	public String addCategory(@ModelAttribute ("category") Category theCategory,Model theModel)
	{   String message="New Category created";
	    
	    categoryService.SaveOrUpdate(theCategory);
	    List<Category> categories=categoryService.getAllCategories();
		theModel.addAttribute("categories", categories);
		theModel.addAttribute("message", message);
		
		return "admin/category/categories_list";
	}
	
	@GetMapping("/showCategoryFormForUpdate")
	public String showCategoryFormForUpdate(@RequestParam("categoryId")int categoryId,Model theModel) {
	
		Category category=categoryService.getCategoryById(categoryId);
		theModel.addAttribute("category",category);
		return "admin/category/category_form1";	
	}
	
	@RequestMapping("/editCategory")
	public String editCategory(@ModelAttribute ("category") Category theCategory,Model theModel)
	{   String message="Category has been updated";
	    
	    categoryService.SaveOrUpdate(theCategory);
	    List<Category> categories=categoryService.getAllCategories();
		theModel.addAttribute("categories", categories);
		theModel.addAttribute("message", message);
		
		return "admin/category/categories_list";
	}
	
	@GetMapping("/deleteCategory")
	public String deleteCategory(@RequestParam("categoryId")int categoryId,Model theModel)
	{  // String message="Category with id " +categoryId+ " has been deleted";
		String message=null;
	    int numofBooks=bookService.CountBook(categoryId);
	    if (numofBooks>0)
	    {
	    	 message="Books detected in this category!!!!!Category with id " +categoryId+ " cannot  be deleted";
	    	 List<Category> categories=categoryService.getAllCategories();
		     theModel.addAttribute("categories", categories);
	    }
	    else
	    {
	    	categoryService.delete(categoryId);
			 List<Category> categories=categoryService.getAllCategories();
		     theModel.addAttribute("categories", categories);	
		     message="Category with id " +categoryId+ " has been deleted";
	    }
		
	     theModel.addAttribute("message", message);
		return "admin/category/categories_list";
	}
	
	//Books//
	
	@RequestMapping("/books")
	public String books(Model theModel)
	{   
		List<Book> books=bookService.getAllBooks();
		theModel.addAttribute("books", books);
        return "admin/book/books_list";
	}
	
	@RequestMapping("/bookform")
	public String bookForm(Model theModel)
	{
		List<Category> categories=categoryService.getAllCategories();
		theModel.addAttribute("categories", categories);
		Book book=new Book();
		theModel.addAttribute("book", book);
		theModel.addAttribute("value",0);
        return "admin/book/book_form";
	}
	
	@RequestMapping("/addBook")
	
	public String addBook(@ModelAttribute ("book") Book theBook,Model theModel,@RequestParam("image") MultipartFile image)
	{  
	
		String message="New Book added";
	   // String fileName=null;
		StringBuilder fileNames = new StringBuilder();
		try {
			
			String filename=image.getOriginalFilename();
			  //fileName=image.getOriginalFilename();
			theBook.setFile_name(filename);
			  Path fileNameAndPath = Paths.get(uploadDirectory, image.getOriginalFilename());
			  fileNames.append(image.getOriginalFilename()+" ");
			  
			  
			  
				Files.write(fileNameAndPath, image.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			
		  }
		//theModel.addAttribute("fileName", fileName) ;
	    theModel.addAttribute("msg", "Successfully uploaded files "+fileNames.toString());
	    
	    
		    
	    bookService.SaveOrUpdate(theBook);
	    List<Book> books=bookService.getAllBooks();
		theModel.addAttribute("books", books);
		theModel.addAttribute("message", message);
		
		return "admin/book/books_list";
	}
	
	@GetMapping("/showFormForBookUpdate")
	public String showFormForBookUpdate(@RequestParam("bookId")int bookId,Model theModel) {
		List<Category> categories=categoryService.getAllCategories();
		theModel.addAttribute("categories", categories);
	    
		Book book=bookService.getBookById(bookId);
		
		theModel.addAttribute("book",book);
	    theModel.addAttribute("value",1);
	    return "admin/book/book_form";	
	}
	
	@GetMapping("/deleteBook")
	public String deleteBook(@RequestParam("bookId")int bookId)
	{
		bookService.delete(bookId);
		return "redirect:/Admin/books";
	}
	
	//Test
	@RequestMapping("/test")
	public String test(Model theModel)
	{   
		List<Test> testbooks=testService.getAllBooks();
		theModel.addAttribute("books", testbooks);
        return "admin/book/test_list";
	}
	
	@RequestMapping("/testform")
	public String testForm(Model theModel)
	{
		List<Category> categories=categoryService.getAllCategories();
		theModel.addAttribute("categories", categories);
		Test test=new Test();
		theModel.addAttribute("testbook", test);
        return "admin/book/test_form";
	}
	
//	@RequestMapping("/saveTest")
//	public @ResponseBody ResponseEntity<?> createTest(@Valid Test theTest,Model theModel,@RequestParam("name") final String name,final @RequestParam("image") MultipartFile file ) throws FileNotFoundException
//	{   
		
//		String filename=file.getOriginalFilename();
//		String filepath=Paths.get(uploadDirectory, filename).toString();
//		String fileType=file.getContentType();
//		long size=file.getSize();
//		String filesize=String.valueOf(size);
//		
//		BufferedOutputStream stream=new BufferedOutputStream(new FileOutputStream(new File(filepath)));
//		try {
//			stream.write(file.getBytes());
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		try {
//			stream.close();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		theTest.setName(name);
//		theTest.setFile_name(filename);
//		theTest.setFile_path(filepath);
//		theTest.setFile_size(filesize);
//		theTest.setFile_type(fileType);
//		
//		boolean status=testService.save(theTest);
//		
//		if(status)
//		{
//			return new ResponseEntity<>(HttpStatus.OK);
//		}
		
//		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
//	}
	
    @RequestMapping("/saveTest")
	
	public String saveTest(@ModelAttribute ("testbook") Test theTest,@RequestParam("name") final String name,Model theModel,@RequestParam("image") MultipartFile image) {
	
    	

		String message="New Book added";
	   // String fileName=null;
		StringBuilder fileNames = new StringBuilder();
		  try { 
			  
			  String filename=image.getOriginalFilename();
				String filepath=Paths.get(uploadDirectory, filename).toString();
				String fileType=image.getContentType();
				long size=image.getSize();
				String filesize=String.valueOf(size);
				
				theTest.setName(name);
				theTest.setFile_name(filename);
				theTest.setFile_path(filepath);
				theTest.setFile_size(filesize);
				theTest.setFile_type(fileType);
				
			  //fileName=image.getOriginalFilename();
			  Path fileNameAndPath = Paths.get(uploadDirectory, image.getOriginalFilename());
			  fileNames.append(image.getOriginalFilename()+" ");
			
				Files.write(fileNameAndPath, image.getBytes());
				
				
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		  
		//theModel.addAttribute("fileName", fileName) ;
	    theModel.addAttribute("msg", "Successfully uploaded files "+fileNames.toString());
		
	    testService.save(theTest);
		return "redirect:/Admin/test";
		
	}
    
    //Customer
    
    
    @RequestMapping("/customer")
	public String customer(Model theModel)
	{   
		List<Customer> customers=customerService.getAllCustomers();
		theModel.addAttribute("customers", customers);
        return "admin/customer/customer_list";
	}
    
	@RequestMapping("/customerform")
	public String customerForm(Model theModel)
	{
		List<Category> categories=categoryService.getAllCategories();
		theModel.addAttribute("categories", categories);
		Customer customer=new Customer();
		theModel.addAttribute("customer", customer);
		theModel.addAttribute("value",0);
        return "admin/customer/customer_form";
        
	}
	
	@RequestMapping("/addCustomer")
	public String addCustomer(@ModelAttribute ("customer") Customer theCustomer,Model theModel)
	{   String message="";
	    String email=theCustomer.getEmail();
	    String email1=customerService.checkemail(email);
	    if(email.equals(email1))
	    {    
	    	List<Category> categories=categoryService.getAllCategories();
 			theModel.addAttribute("categories", categories);
	    	message="Customer with email " +email+ " already exists !!! Please choose different one" ;	
	    	
	    	
	    }
	    else
	    {
	    	 theCustomer.setRegister_date(new Date());
	    	customerService.addCustomer(theCustomer);
// 	    List<Category> categories=categoryService.getAllCategories();
// 		theModel.addAttribute("categories", categories);
 		message="New Customer Added";
	    	
	    }
	    List<Customer> customers=customerService.getAllCustomers();
		theModel.addAttribute("customers", customers);
	    
		theModel.addAttribute("msg", message);
		
		return "admin/customer/customer_list";
	}
	
	@GetMapping("/showFormForCustomerUpdate")
	public String showFormForCustomerUpdate(@RequestParam("customerId")int customerId,Model theModel) {
	
		Customer customer=customerService.getCustomerById(customerId);
		customer.setPassword(null);

		theModel.addAttribute("customer",customer);
		theModel.addAttribute("value",1);
		return "admin/customer/customer_form";	
	}
	
	@RequestMapping("/updateCustomer")
	public String updateCustomer(@ModelAttribute ("customer") Customer theCustomer,Model theModel)
	{   
		int id=theCustomer.getCustomerId();
		String message="Detail of Customer with id "+id+" has been updated";
		
		theCustomer.setRegister_date(new Date());
		
	    customerService.addCustomer(theCustomer);;
	    
		theModel.addAttribute("msg", message);
		List<Customer> customers=customerService.getAllCustomers();
		theModel.addAttribute("customers", customers);
		return "admin/customer/customer_list";
	}
	
	@GetMapping("/deleteCustomer")
	public String deleteCustomer(@RequestParam("customerId")int customerId,Model theModel)
	{
		customerService.delete(customerId);
		String message="Customer with id " +customerId+ " has been deleted";
		List<Customer> customers=customerService.getAllCustomers();
		theModel.addAttribute("customers", customers);
		theModel.addAttribute("msg", message);
		return "admin/customer/customer_list";
	
	}
	
	//Review //
	
	
	  @RequestMapping("/reviews")
		public String review(Model theModel)
		{   
			List<Review> reviews=reviewService.getAllReviews();
			theModel.addAttribute("reviews", reviews);
	        return "admin/review/reviews";
		}
	
	
	
	//BookOrder//
	  @RequestMapping("/bookOrders")
	  public String bookOrders(Model theModel)
	  {
		  List<BookOrder> bookOrders=bookOrderService.getAllBookOrders();
		  theModel.addAttribute("bookOrders", bookOrders);
		  return "admin/order/bookOrders";
		  
	  }
	
	  @RequestMapping("/showOrderDetails")
	  public String showOrderDetails(Model theModel,@RequestParam("orderId")int orderId,HttpSession session)
	  {
		BookOrder OrderDetails=bookOrderService.bookOrderDetails(orderId);
		String message=null;
		if(OrderDetails!=null)
		{
		message="view the details";
		theModel.addAttribute("message", message);
		//theModel.addAttribute("orderDetails", OrderDetails);
		session.setAttribute("orderDetails",OrderDetails);
		return "admin/order/orderDetails";
		}
		else
		{   message="Details for this order not available";
		    theModel.addAttribute("message", message);
			return "admin/order/orderDetails";
		}
		  
	  }
	
	
		@RequestMapping("/EditForBookOrder")
		public String EditForBookOrder(@RequestParam("orderId")int orderId,Model theModel, HttpSession session) {
		
			
			Object isPendingBook=session.getAttribute("NewBookPending");
			if (isPendingBook==null)
			{
				BookOrder OrderDetails=bookOrderService.bookOrderDetails(orderId);
				session.setAttribute("orderDetails", OrderDetails);
				//theModel.addAttribute("orderDetails",OrderDetails);
			}
			
			else
			{
				session.removeAttribute("NewBookPending");
			}
			
		    
		    return "admin/order/order_form";	
		}
		
		@GetMapping("/addBookForm")
		public String addBookForm(Model theModel)
		{   
          
			List<Book> books=bookService.getAllBooks();
			theModel.addAttribute("books", books);
			return "admin/order/addBookForm";
			
		}
		
		@RequestMapping("/addBookToOrder")
		public String addBookToOrder(Model theModel,HttpSession session,@RequestParam("bookId")int bookId,@RequestParam("quantity")int quantity)
		{
			Book book=bookService.getBookById(bookId);
			BookOrder OrderDetails=(BookOrder) session.getAttribute("orderDetails");
			
			float subTotal=quantity * book.getPrice();
			
			OrderDetail OrderDetails1=new OrderDetail();
			OrderDetails1.setBook(book);
			OrderDetails1.setSubtotal(subTotal);
			OrderDetails1.setQuantity(quantity);
			
			float total=OrderDetails.getTotal()+subTotal;
			
			OrderDetails.setTotal(total);
			
			OrderDetails.getOrderDetails().add(OrderDetails1);
			
			theModel.addAttribute("book",book);
			theModel.addAttribute("OrderDetails",OrderDetails);
			session.setAttribute("NewBookPending",true);
			
			return "admin/message";
		}
		
		@RequestMapping("/RemoveBookFromOrder")
		public String RemoveBookFromOrder(Model theModel,HttpSession session,@RequestParam("id")int bookId)
		{
			BookOrder orderDetails=(BookOrder) session.getAttribute("orderDetails");
			
			//List<OrderDetail> details=  orderDetails.getOrderDetails();
			Set<OrderDetail> details=  orderDetails.getOrderDetails();
			System.out.println("Order details for book order are"+details.toString());
			
			Iterator<OrderDetail> iterator = details.iterator();
			
		      while(iterator.hasNext()) {
		    	  
		    	  OrderDetail det=iterator.next();
		    	  
		    	  if(det.getBook().getBookId()==bookId)
		    	  {   
		    		  float newTotal=orderDetails.getTotal()-det.getSubtotal();
		    		  orderDetails.setTotal(newTotal);
		    		  iterator.remove();
		    		  
		    	  }
		    	  
		    	  
		      }
			orderDetails.setOrderDetails(details);
		    System.out.println("Order details after deleting from book order are"+details.toString());
			return "admin/order/order_form";
		}
		
		@RequestMapping("/update_order")	
		public String update_order(HttpSession session,@RequestParam("bookId") String[] arrayBookIds,
				@RequestParam("price") String[] price,@RequestParam("RecipientName")String RecipientName,@RequestParam("RecipientPhone")String RecipientPhone,
				@RequestParam("ShippingAddress")String ShippingAddress,@RequestParam("paymentMethod")String paymentMethod,
				@RequestParam("orderStatus")String orderStatus,Model theModel,HttpServletRequest request)
		{
			BookOrder orderDetails=(BookOrder) session.getAttribute("orderDetails");
			orderDetails.setRecipientName(RecipientName);
			orderDetails.setRecipientPhone(RecipientPhone);
			orderDetails.setShippingAddress(ShippingAddress);
			orderDetails.setStatus(orderStatus);
			orderDetails.setPaymentMethod(paymentMethod);
			
			
			String[] arrayQuantities=new String[arrayBookIds.length];
			
			  for(int i=1;i<=arrayQuantities.length;i++)
			  {
				 arrayQuantities[i-1]=request.getParameter("quantity"+i);
						// quantities[i-1];
			  }
			//List<OrderDetail> details= orderDetails.getOrderDetails();
		    Set<OrderDetail> details= orderDetails.getOrderDetails();
		    System.out.println("Details before clear are:"+details);
		    details.clear();
		    System.out.println("Details after clear order are:"+details);
		    float totalAmount=0.0f;
		    
		    for(int i=0;i<arrayBookIds.length;i++)
		    {
		    	int bookId=Integer.parseInt(arrayBookIds[i]);
		    	int quantity=Integer.parseInt(arrayQuantities[i]);
		    	float price1=Float.parseFloat(price[i]);
		    	
		    	float subtotal=price1 * quantity;
		    	
		    	OrderDetail orderDetail=new OrderDetail();
		    	orderDetail.setBook(new Book(bookId));
		    	orderDetail.setQuantity(quantity);
		    	orderDetail.setSubtotal(subtotal);
		    	orderDetail.setBookOrder(orderDetails);
		    	
		    	details.add(orderDetail);
		    	totalAmount+=subtotal;
		    
		    }
			orderDetails.setTotal(totalAmount);
			orderDetails.setOrderDetails(details);
			
			System.out.println("orderDetails for bookId are :"+orderDetails);
		//	System.out.println("Details for order are:"+details.toString());
			bookOrderService.save(orderDetails);
		
			List<BookOrder> bookOrders=bookOrderService.getAllBookOrders();
			  theModel.addAttribute("bookOrders", bookOrders);
			return "admin/order/bookOrders";
		}
		
		@GetMapping("/deleteOrder")
		public String deleteOrder(@RequestParam("orderId")int orderId,Model theModel)
		{
			bookOrderService.delete(orderId);
			String message="An order with id " +orderId+ " has been deleted";
			
			theModel.addAttribute("msg", message);
			List<BookOrder> bookOrders=bookOrderService.getAllBookOrders();
			  theModel.addAttribute("bookOrders", bookOrders);
			return "admin/order/bookOrders";
			
		}

}
