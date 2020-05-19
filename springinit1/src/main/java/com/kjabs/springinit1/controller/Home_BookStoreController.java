package com.kjabs.springinit1.controller;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kjabs.springinit1.DAO.HashGenerator;
import com.kjabs.springinit1.entity.Book;
import com.kjabs.springinit1.entity.BookOrder;
import com.kjabs.springinit1.entity.Category;
import com.kjabs.springinit1.entity.Customer;
import com.kjabs.springinit1.entity.OrderDetail;
import com.kjabs.springinit1.entity.Review;
import com.kjabs.springinit1.entity.ShoppingCart;
import com.kjabs.springinit1.service.BookOrderService;
import com.kjabs.springinit1.service.BookService;
import com.kjabs.springinit1.service.CategoryService;
import com.kjabs.springinit1.service.CustomerService;
import com.kjabs.springinit1.service.ReviewService;





@Controller
@RequestMapping("/kjabs")
public class Home_BookStoreController {
	
	private CategoryService categoryService;
	private BookService bookService;
	private CustomerService customerService;
	private ReviewService reviewService;
	private BookOrderService bookOrderService;
	@Autowired
	public Home_BookStoreController(CategoryService theCategoryService,
			BookService theBookService,
			CustomerService theCustomerService,
			ReviewService theReviewService,
			BookOrderService theBookOrderService)
	{
	
		categoryService=theCategoryService;
		bookService=theBookService;
		customerService=theCustomerService;
		 reviewService=theReviewService;
		 bookOrderService=theBookOrderService;
		
	}
	
    @RequestMapping("/home")
	public String home(Model theModel)
	
	{  
        List<Category> categories=categoryService.getAllCategories();
	    theModel.addAttribute("categories", categories);
    	List<Book> booksList=bookService.findTopN();
   	    theModel.addAttribute("booksList", booksList);
   	    List<Book> bestSelling=bookService.findMostSellingBooks();
	    theModel.addAttribute("bestSelling", bestSelling);
		return "customer/index";
		
	}
	
    @RequestMapping("/view_category")
 	public String bookByCategory(Model theModel, @RequestParam("id") Category id)
 	
 	{   
    	
    	 
    	 int CatId=id.getId();
    	 List<Book> booksList=bookService.findByCategory(id);
    	
    	 theModel.addAttribute("booksList", booksList);
    	 List<Category> categories=categoryService.getAllCategories();
 	    theModel.addAttribute("categories", categories);
 	     Category category=categoryService.getCategoryById(CatId);
        theModel.addAttribute("category", category);
    	return "customer/category/booksByCategory";
 		
 	}
    
    @RequestMapping("/view_book")
 	public String viewBook(Model theModel, @RequestParam("id") int bookId)
 	
 	{   
    	Book book=bookService.getBookById(bookId);
    	theModel.addAttribute("book",book);
    	 List<Category> categories=categoryService.getAllCategories();
  	    theModel.addAttribute("categories", categories);
    	
    	return "customer/book/bookDetails";
 		
 	}
    
    @RequestMapping("/search")
 	public String searchBook(@RequestParam("keyword") String theName,Model theModel)
 	
 	{  
    	//List<Book> theBooks = bookService.searchBy(theName);
     	List<Book> theBooks = bookService.searchByDesc(theName);
    	theModel.addAttribute("books", theBooks);
    	theModel.addAttribute("keyword", theName);
    	return "customer/book/Search_Result";
 		
 	}
    
    @RequestMapping("/register")
    public String registerCustomer(Model theModel)
    {
    	Customer customer=new Customer();
    	theModel.addAttribute("customer",customer);
    	return "customer/login/register_customer";
    	
    }
    
    @RequestMapping("/registerCustomer")
	public String registerCustomer(@ModelAttribute ("customer") Customer theCustomer,Model theModel)
	{   String message="";
	    String email=theCustomer.getEmail();
	    String email1=customerService.checkemail(email);
	    String password=theCustomer.getPassword();
	    if(email.equals(email1))
	    {    
	    	List<Category> categories=categoryService.getAllCategories();
 			theModel.addAttribute("categories", categories);
	    	message="The email " +email+ " is already registered !!!" ;	
	    	
	    	
	    }
	    else
	    {
            theCustomer.setRegister_date(new Date());
            if (password != null & !password.isEmpty()) {
    			String encryptedPassword = HashGenerator.generateMD5(password);
    			theCustomer.setPassword(encryptedPassword);				
    		}
	    	customerService.addCustomer(theCustomer);
// 	    List<Category> categories=categoryService.getAllCategories();
// 		theModel.addAttribute("categories", categories);
 		message="Welcome!!! you have registered successsfully <br/>"
 				+ "<a href='/kjabs/CustomerLogin_Form'> Click here </a> to login";
	    	
	    }
	    List<Customer> customers=customerService.getAllCustomers();
		theModel.addAttribute("customers", customers);
	    
		theModel.addAttribute("msg", message);
		List<Category> categories=categoryService.getAllCategories();
	  	theModel.addAttribute("categories", categories);
		
		return "customer/login/message";
	}
    
    
    @RequestMapping("/CustomerLogin_Form")
    public String CustomerLogin_Form(Model theModel)
    {
    	Customer customer=new Customer();
    	theModel.addAttribute("customer",customer);
    	return "customer/login/login";
    	
    }
    
    @RequestMapping("/CustomerLogin")
    public String CustomerLogin(@ModelAttribute("customer") Customer theCustomer,Model theModel, HttpSession session)
    {   String message="";
    	String email=theCustomer.getEmail();
    	String password=theCustomer.getPassword();
    	
    	Customer customer=customerService.checkLogin(email, password);
      
    	
    	if(customer==null)
    	{
    		message="Login failed. Please check your email and password.";
    		theModel.addAttribute("message", message);
    		return "customer/login/login";
    		
    		
    		
    	}
    	else
    	{   session.setAttribute("LoggedCustomer",customer);
   	        Object objRedirectURL=session.getAttribute("redirectURL");
   	        
   	        if (objRedirectURL !=null)
   	        {
   	        	String redirectURL= (String) objRedirectURL;
   	        	session.removeAttribute("redirectURL");
   	        	
   	        	return "redirect:/"+redirectURL;
   	        	
   	        	
   	        }
   	        else
   	        {
   	        	return "redirect:/kjabs/profile";
    		//return "customer/customer/profile";
   	        }
    	}
    	
    	
    
    	
    	
    	
    	
    	
    }
	
    
    @RequestMapping("/profile")
    public String profile(Model theModel)
    {
    	
    	return "customer/customer/profile";
    	
    }
    
    @RequestMapping("/logout")
    public String logout(Model theModel,HttpSession session)
    {   
    	
    	session.removeAttribute("LoggedCustomer");
    	
    	return "redirect:/kjabs/home";
    	
    }
    
	@GetMapping("/showFormForUpdate")
	public String showFormForCustomerUpdate(@RequestParam("customerId")int customerId,Model theModel) {
	
		Customer customer=customerService.getCustomerById(customerId);
		customer.setPassword(null);

		theModel.addAttribute("customer",customer);
		
		return "customer/customer/EditProfile";	
	}
	
	@RequestMapping("/editProfile")
	public String editProfile(@ModelAttribute ("customer") Customer theCustomer,Model theModel,HttpSession session)
	{   String message="Details has been updated";
	
	    String password=theCustomer.getPassword();
		
		
		theCustomer.setRegister_date(new Date());
		  if (password != null & !password.isEmpty()) {
  			String encryptedPassword = HashGenerator.generateMD5(password);
  			theCustomer.setPassword(encryptedPassword);				
  		} 
		customerService.addCustomer(theCustomer);;
	    
		theModel.addAttribute("msg", message);
		
		session.setAttribute("LoggedCustomer",theCustomer);
		
		return "customer/customer/profile";
	}
    
	 @RequestMapping("/Review_Form")
	 public String Review_Form(Model theModel,@RequestParam("book_id") int bookId )
	    {   
	        Book book=bookService.getBookById(bookId);
	        theModel.addAttribute("book", book);
	    	Review review=new Review();
	    	theModel.addAttribute("review",review);
	    	return "customer/review/review_form";
	    	
	    }
    
	  @RequestMapping("/saveReview")
	  public String saveReview(@ModelAttribute ("review") Review theReview,Model theModel,@RequestParam("bookId") int bookId1,@RequestParam("rating")int rating,HttpSession session )
	  { 
		  Book book=new Book();
		
		  book.setBookId(bookId1);
		  theReview.setBook(book);
		  Customer customer=(Customer)session.getAttribute("LoggedCustomer");
		  theReview.setCustomer(customer);
		  theReview.setReviewTime(new Date());
		  reviewService.SaveReview(theReview);
	      return "redirect:/kjabs/view_book?id="+bookId1;
	  }
	  
	  @RequestMapping("/cart")
	  public String cart(HttpSession session)
	  {
		  Object cartObject=session.getAttribute("cart");
		  
		  if(cartObject==null)
		  {
			  ShoppingCart shoppingCart=new ShoppingCart();
			  session.setAttribute("cart", shoppingCart);
		  }
		  
		 // ShoppingCart shoppingCart=(ShoppingCart) session.getAttribute("cart");
		 // shoppingCart.addItem(book1);
		  return "customer/cart/cart";
	  }
	  
	  @RequestMapping("/addToCart")
	  public String addToCart(Model theModel,@RequestParam("book_id") Integer bookId,HttpSession session)
	  {
		  Object cartObject=session.getAttribute("cart");
		  ShoppingCart shoppingCart=null;
		  if(cartObject!=null && cartObject instanceof ShoppingCart)
		  {
			  shoppingCart=(ShoppingCart) cartObject;
		  }
		  else
		  {
			  shoppingCart=new ShoppingCart();
			  session.setAttribute("cart",shoppingCart);
		  }
		  
		  Book book=bookService.getBookById(bookId);
		
		  shoppingCart.addItem(book);
		
		  //return "redirect:/kjabs/cart";
		  return "customer/cart/cart";
	  }
	  
	  @RequestMapping("/removeFromCart")
	  public String removeFromCart(Model theModel,@RequestParam("book_id") Integer bookId,HttpSession session)
	  {  
		  Object cartObject=session.getAttribute("cart");
		  ShoppingCart shoppingCart=(ShoppingCart) cartObject;
		  Book book=bookService.getBookById(bookId);
		  shoppingCart.removeItem(new Book(bookId));
	      return "customer/cart/cart";
	  }
	  
	  @RequestMapping("/updateCart")
	  public String updateCart(@RequestParam("bookId") String[] arrayBookIds,@RequestParam("quantity") String[] quantities,HttpSession session)
	  {   
		  
		  String[] arrayQuantities=new String[arrayBookIds.length];
		  
		  for(int i=1;i<=arrayQuantities.length;i++)
		  {
			  String qty=quantities[i-1];
			  arrayQuantities[i-1]=qty;
		  }
	     int[] bookIds= Arrays.stream(arrayBookIds).mapToInt(Integer::parseInt).toArray();
	     int[] quantities1= Arrays.stream(arrayQuantities).mapToInt(Integer::parseInt).toArray();
	  
	     ShoppingCart cart=(ShoppingCart) session.getAttribute("cart");
	     cart.updateCart(bookIds, quantities1);
	     
	     return "customer/cart/cart";
	  
	  
	  }
	  
//	  @RequestMapping("/updateCart")
//	  public String updateCart(@RequestParam("bookId") int[] arrayBookIds,@RequestParam("quantity") int[] quantities )
//	  {   
//		  
//		  int[] arrayQuantities=new int[arrayBookIds.length];
//		 
//		  
//		  for(int i=1;i<=arrayQuantities.length;i++)
//		  {
//			  int qty=quantities[i-1];
//			  arrayQuantities[i-1]=qty;
//		  }
//		  
//		  return "arrayQuantities=";
//	  }
    
	  @RequestMapping("/ClearCart")
	  public String ClearCart(HttpSession session)
	  {
		 ShoppingCart cart= (ShoppingCart) session.getAttribute("cart");
		 cart.clear();
		  return "customer/cart/cart";
	  }
	  
	  @RequestMapping("/checkout")
	  public String checkout(HttpSession session,Model theModel)
	  {
		 BookOrder bookOrder=new BookOrder();
		 theModel.addAttribute("bookOrder",bookOrder);
		 Map<String,String> paymentOption =new LinkedHashMap<String,String>();
		 paymentOption.put("Cash on Delivery","cash on Delivery");
		 paymentOption.put("Paypal or Credit Card","Paypal or Credit Card");
		 theModel.addAttribute("paymentOption",paymentOption);
		  return "customer/cart/checkout";
	  }
	  
	  @RequestMapping("/placeOrder")
	  public String placeOrder(HttpSession session, @ModelAttribute("bookOrder") BookOrder theBookOrder,Model theModel,
			  @RequestParam("city") String theCity,  @RequestParam("country") String theCountry,  @RequestParam("zipcode") String theZipcode,
			  @RequestParam("StreetAddress") String streetAddress)
	  {   theBookOrder.setOrderDate(new Date());
	      Customer customer=(Customer)session.getAttribute("LoggedCustomer");
	      theBookOrder.setCustomer(customer);
	      theBookOrder.setStatus("processing");
	     
	      String shippingAddress=streetAddress+","+ theCity+","+theZipcode+","+theCountry;
	      theBookOrder.setShippingAddress(shippingAddress);
	      //theBookOrder.setPaymentMethod("cash on Delivery");
	      
	      ShoppingCart shoppingcart=(ShoppingCart) session.getAttribute("cart");
	      Map<Book,Integer> items=shoppingcart.getItems();
	      Iterator<Book> iterator=items.keySet().iterator();
	      
	     // List<OrderDetail> orderDetails=new ArrayList<>();
	      Set<OrderDetail> orderDetails=new HashSet<>();
	      while(iterator.hasNext())
	      {
	    	  Book book=iterator.next();
	    	  Integer quantity=items.get(book);
	    	  float subtotal=quantity * book.getPrice();
	    	  
	    	  OrderDetail orderDetail=new OrderDetail();
	    	  orderDetail.setBook(book);
	    	  orderDetail.setBookOrder(theBookOrder);
	    	  orderDetail.setQuantity(quantity);
	    	  orderDetail.setSubtotal(subtotal);
	    	  
	    	  orderDetails.add(orderDetail);
	    	  
	      }
	      
	      theBookOrder.setOrderDetails(orderDetails);
	      theBookOrder.setTotal(shoppingcart.getTotalAmount());
		  bookOrderService.save(theBookOrder);
		  shoppingcart.clear();
		  String message="order has been placed";
		  theModel.addAttribute("msg", message);
		  return "customer/login/message";
		  
	  }

	  @RequestMapping("/Orders")
	  public String orders(HttpSession session,Model theModel)
	  {  
		  Customer customer=(Customer)session.getAttribute("LoggedCustomer");
		  List<BookOrder> orders=bookOrderService.findByCustomer(customer);
		  theModel.addAttribute("orders",orders);
		  return "customer/customer/orders";
	  }
	  
	  @RequestMapping("/showOrderDetailsForCustomer")
	  public String showOrderDetailsForCustomer(HttpSession session,Model theModel,@RequestParam("orderId")Integer orderId)
	  {
		  Customer customer=(Customer)session.getAttribute("LoggedCustomer");  
		 // BookOrder OrderDetails=bookOrderService.bookOrderDetails(orderId);
		  BookOrder OrderDetails=bookOrderService.findByIdAndCustomerId(orderId,customer.getCustomerId());
	      String message=null;
			if(OrderDetails!=null)
			{
			message="view the details";
			theModel.addAttribute("message", message);
			theModel.addAttribute("orderDetails", OrderDetails);
			return "customer/customer/orderDetails";
			}
			else
			{   message="Details for this order not available";
			    theModel.addAttribute("message", message);
				return "customer/customer/orderDetails";
			}
		  

	  }
	  
	  


}
