一、Dom4j读取xml文件
		1、读取xml文件的技术常用的有两种：sax和dom，Dom4j是两种技术的结合
	//创建解析器
	SAXReader saxReader = new SAXReader();
	//创建Document对象
	Document document = saxReader.read("src/p1.xml");
	//创建根节点对象
	Element root = document.getRootElement();
	//获取p1节点的对象
	Element element = root.element("p1");
	//获取p1节点的值
	String value = element.getText();
	------------------------------------------
		2、常用方法
	//添加节点
	element.addElement("节点名称");
	//删除节点，需要使用父节点进行删除
	element.remove();
	//修改节点的值
	element.setText();
	------------------------------------------
		3、回写xml（增删改操作需要进行回写）
	//创建格式对象
	OutputFormat format = OutputFromat.createcreatePrettyPrint();
	//创建XMLWriter对象
	XMLWriter xmlWriter = new XMLWriter(new FileOutputStream("src/p1"), format);
	//读取Document对象
	xmlWriter.write(document);
	xmlWriter.close();

二、dom4j支持xpath操作
	1、BBB[@id='b1']		表示元素名称是BBB,在BBB上面有id属性，并且id的属性值是b1
	2、在dom4j里面提供了两个方法，用来支持xpath
		Node name1 = document.selectNodes("xpath表达式")
			- 获取多个节点
		List<Node> list = document.selectSingleNode("xpath表达式")
			- 获取一个节点
	
三、反射技术
	1、获取到Class类的三种方式
		a.Class.forName("全类名")：将字节码文件加载进内存，返回Class对象
			Class c1 = Class.forName("文件路径");	//最常用的方法
								多用于配置文件，将类名定义在配置文件中，读取文件，加载类
		
		b.类名.Class：通过类名的属性Class获取
			Class c2 = Person.Class;	//多用于参数的传递
			
		c.对象.getClass():getClass()方法在Object类中定义着	
			Class c3 = new Person().getClass();		//多用于对象的获取字节码的方式
		
	2、通过反射获取构造方法
		//获取Class类
		Class c1 = Class.forName("cn.itcast.test09.Person");
		//获取构造方法的对象
		Constructor cs = c1.getConstructor(String.class, String.class); //如果是无参的构造方法，直接写null
		//通过构造方法对象创建Person的实例
		Person p1 = (Person)cs.newInstance("lisi", "001");
		
	3、通过反射获取属性
		四种获取方法：(获取构造方法和普通方法也是四种，与下面类似)
			Filed[] getFields();获取所有public修饰的成员变量
			Filed getFields(String name);获取指定名称的 public修饰的成员变量
			
			Filed[] getDeclaredFields();获取所有的成员变量，不考虑修饰符
			Filed getDeclaredField();获取指定名称的成员变量，不考虑修饰符
	
		//获取Class类
		Class c1 = Class.forName("cn.itcast.test09.Person");
		//得到Person类的实例
		Person p1 = c1.newInstance();
		//获得属性的对象
		Field f1 = p1.getDeclaredField("name");	//参数是属性的名称
		//如果属性是私有的，使用以下方法，（私有方法也类似）
		f1.setAccessible(true); //暴力反射
		//通过set方法设置name的值，第一个参数是类的实例，第二个参数是设置的值
		f1.set(p1, "wangwu"); //设置属性的值
		f1.get(Object obj); //获取值
		f1.get(p1);
	
	4、通过反射获取普通方法
		//得到Class类
		Class c1 = Class.forName("cn.itcast.test09.Person");
		//得到Person实例
		Person p1 = (Person) c1.newInstance();
		//传递两个参数：第一个参数，方法名称；第二个参数，方法里面参数的类型
		Method m1 = c1.getDeclaredMethod("setName", String.class);
		//让setName方法执行 ，执行设置值
		//使用invoke(p1, "niuqi");传递两个参数：第一个参数，person实例；第二个参数，设置的值
		//执行了invoke方法之后，相当于，执行了setName方法，同时通过这个方法设置了一个值是niuqi
		m1.invoke(p4, "niuqi");
		System.out.println(p4.getName());

四、域对象--》ServletContext
	1、概念：一个项目只有一个ServletConText对象，多个Servlet中共用同一个ServletConText对象
	2、获取ServletConText对象
		方法一：ServletConfit#getServletConText；
		方法二：GenericServlet#getServletConText；
	3、ServletContext对象用来操作数据的方法：
		void setAttribute(String name, Object value)：用来存储一个对象，以map键值对形式存储
		Object getAttribute(String name)：用来获取ServletContext中的数据；
			例如：String value = (String)servletContext.getAttribute(“xxx”);要进行类型转换，因为取出来的是
				object类型void removeAttribute(String name)：用来移除ServletContext中的域属性；	
		
五、Response对象
	1、常用方法
		public void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			//1、设置响应头信息，可解决乱码
			response.setHeader(“content-type”, “text/html;charset=utf-8”); 等价于
			response.setContentType("text/html;charset=utf-8");
			
			//2、设置状态码
			response.setStatus(200);设置状态码
			response.sendError(404, “您要查找的资源不存在”); 当发送错误状态码时，
				Tomcat会跳转到固定的错误页面去，但可以显示错误信息
			
			//3、重定向
			response.setStatus(302);[设置响应码为302，表示重定向]
			response.setHeader("Location", "http://www.itcast.cn");[设置新请求的URL] 等价于
			response.sendRedirect("http://www.itcast.cn");
			
			//4、自动跳转
			response.setHeader("Refresh","5; URL=http://www.itcast.cn"); 5秒后自动跳转到传智主页
			
			//5、在浏览器上输出
			response.getWriter().print("Hello Word");	//发送字符流数据
			resopnse.getOutputStream().write("hello word"); //发送字节流数据
			
			//6、禁用浏览器缓存，设置三个头Cache-Control、pragma、expires
			response.setHeader("Cache-Control", "no-cache");
			response.setHeader("pragma", "no-cache");
			response.setHeader("expires", -1);
			
			//7、禁用浏览器缓存，使用<meta>标签可以代替响应头
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			}
		}
		
六、Request对象--》封装了客户端所有的请求数据		
	1、常用方法	
		public void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			//1、获取客户端IP
			request.getRemoteAddr()
			//2、获取请求方式
			request.getMethod();
			//3、获取HTTp请求头
			String HeaderName = request.getHeader(String name);
			//4、获取请求url -->http://localhost:8080/day10_2/AServlet?username=xxx&password=yyy
　　　　		String getScheme()：获取协议，http
　　　　		String getServerName()：获取服务器名，localhost
　　　　		String getServerPort()：获取服务器端口，8080
　　　　		*****String getContextPath()：获取项目名，/day10_2
　　　　		String getServletPath()：获取Servlet路径，/AServlet
　　　　		String getQueryString()：获取参数部分，即问号后面的部分。username=xxx&password=yyy
　　　　		String getRequestURI()：获取请求URI，等于项目名+Servlet路径。/day10_2/AServlet
　　　　		String getRequestURL()：获取请求URL，等于不包含参数的整个请求路径。
			}
			//5、获取请求参数
			*****String getParameter(String name)：获取指定名称的请求参数值，适用于单值请求参数
			*****Map<String,String[]> getParameterMap()：获取所有请求参数，其中key为参数名，value为参数值。
		}		
	2、常见请求头类型
		1、User-Agent //Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 
							(KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36 显示操作系统和浏览器版本
		2、Referer 显示该请求是通过那个网站链接过来的
		
七、请求转发和请求包含
	1、如何进行请求转发和请求包含
		RequestDispatcher rd = request.getRequestDispatcher("/MyServlet");  使用request获取RequestDispatcher对象，
			方法的参数是被转发或包含的Servlet的Servlet路径		
		请求转发：*****rd.forward(request,response); //第一步创建rd对象，第二步调用forward方法
　　	请求包含：rd.include(request,response);		
	2、请求转发和请求包含的区别：
		a、一个请求跨多个Servlet，需要使用转发和包含。
　　　　b、请求转发：由下一个Servlet完成响应体！当前Servlet可以设置响应头！（留头不留体）
　　　　c、请求包含：由两个Servlet共同未完成响应体！（都留）
　　　　d、无论是请求转发还是请求包含，都在一个请求范围内！使用同一个request和response！
	3、请求转发和重定向的区别：	
		a、请求转发是一个请求一次响应，而重定向是两次请求两次响应
　　　　b、请求转发地址栏不变化，而重定向会显示后一个请求的地址
　　　　c、请求转发只能转发到本项目其他Servlet，而重定向不只能重定向到本项目的其他Servlet，还能定向到其他项目
　　　　d、请求转发是服务器端行为，只需给出转发的Servlet路径，而重定向需要给出requestURI，即包含项目名！
　　　　e、请求转发和重定向效率是转发高！因为是一个请求！
　　　　　　需要地址栏发生变化，那么必须使用重定向！
　　　　　　需要在下一个Servlet中获取request域中的数据，必须要使用转发！
		
八、JSP
	1、jsp的组成
		jsp = html + java脚本 + jsp标签(指令)；
		jsp中无需创建即可使用的对象一共有9个，被称之为9大内置对象。例如：request对象、out对象
	2、3种jsp脚本
		<%...%>：java代码片段(常用)，用于定义0~N条Java语句！方法内能写什么，它就可以放什么！
		<%=...%>：java表达式，用于输出(常用)，用于输出一条表达式（或变量）的结果。
				response.getWriter().print( ... );这里能放什么，它就可以放什么！
		<%!...%>：声明，用来创建类的成员变量和成员方法(基本不用，但容易被考到)，类体中可以放什么，它就可以放什么！
		
九、Cookie：由服务器建立保存到客户端浏览器的一个键值对；客户端再下次请求时需要带上Cookie
	1、常用方法
		a、Cookie cookie = new Cookie("A", "aaa"); //创建Cookie对象
		b、response.addCookie(cookie); //向浏览器保存Cookie
		c、request.getCookies(cookie); //获取浏览器归还的Cookie
		d、cookie.getName(); //获取cookie对象键的名称（A）
		e、cookie.getValue(); //获取cookie对象的值（aaa）
	2、设置Cookie的生命周期
		cookie.setMaxAge("60"); //示这个Cookie会被浏览器保存到硬盘上60秒
			maxAge>0：浏览器会把Cookie保存到客户机硬盘上，有效时长为maxAge的值决定。
			maxAge<0：Cookie只在浏览器内存中存在，当用户关闭浏览器时，浏览器进程结束，同时Cookie也就死亡了。
			maxAge=0：浏览器会马上删除这个Cookie！

十、HttpSession：表示一个会话，我们可以把一个会话内需要共享的数据保存到HttSession对象中（由服务器创建）
	1、获取方式
		HttpSession session = request.getSession();
	2、javaWeb三大域对象
		a、HttpServletRequest：一个请求创建一个request对象，所以在同一个请求中可以共享request，例如
			一个请求从AServlet转发到BServlet，那么AServlet和BServlet可以共享request域中的数据；
		b、ServletContext：一个应用只创建一个ServletContext对象，所以在ServletContext中的数据可
			以在整个应用中共享，只要不启动服务器，那么ServletContext中的数据就可以共享；
		c、HttpSession：一个会话创建一个HttpSession对象，同一会话中的多个请求中可以共享session中的数据；
	3、生命周期：会话范围是某个用户从首次访问服务器开始，到该用户关闭浏览器结束！
		
十一、JSP三大指令，一个jsp页面中，可以有0到N个指令
	三大指令：page、 include、  taglib
	1、page指令
		格式：<%@page language="java" info="xxx"%>
		a、pageEncoding和contentType：
			pageEncoding：它指定当前jsp页面的编码；
			contentType：它表示添加一个响应头：Content-Type！等同与
						  response.setContentType("text/html;charset=utf-8");
		b、二者的联系：
			如果两个属性只提供一个，那么另一个的默认值为设置的那一个
			如果两个属性都没有设置，那么默认为iso编码
		c、import：导包，可以出现多次，也是唯一可以重复出现的指令
			格式一：<%@page import=”java.net.*,java.util.*,java.sql.*”%>
			格式二：<%@page import=”java.util.*” import=”java.net.*” import=”java.sql.*”%>
			格式三：<%@ page import=”java.util.*”%>
					<%@ page import=”java.net.*”%>
					<%@ page import=”java.text.*”%>  一般使用第三种格式
		d、errorPage和isErrorPage
			errorPage：当前页面如果抛出异常，那么要转发到哪一个页面，由errorPage来指定
					   格式：<%@ page  errorPage="b.jsp" %>   //a.jsp，当a.jsp抛出异常时，请求转发到b.jsp，此时
							请求b.jsp的相应码为200，且地址不发生改变，如果希望请求码为500时，需要在b.jsp中指定
							<%page isErrorpage="true"%>
			isErrorPage：它指定当前页面是否为处理错误的页面！当该属性为true时，这个页面会设置状态码为500！
							而且这个页面可以使用9大内置对象中的exception!
	2、include--》静态包含
		与RequestDispatcher的include()方法的功能相似！
		区别:
			 <%@include%> 它是在jsp编译成java文件时完成的！他们共同生成一个java(就是一个servlet)文件，
					然后再生成一个class
			RequestDispatcher的include()是一个方法，包含和被包含的是两个servlet，即两个.class！他们
					只是把响应的内容在运行时合并了
	3、taglib--》导入标签库
		a、两个属性
			prefix：指定标签库在本页面中的前缀！由我们自己来起名称
			uri: 指定标签库的位置
		b、格式
			<%@taglib prefix="s" uri="/struts-tags"%> 前缀的用法<s:text>
		
十二、JSP九大内置对象
	out --> jsp的输出流，用来向客户端响应
	page --> 当前jsp对象！　它的引用类型是Object，即真身中有如下代码：Object page = this;
	config --> 它对应真身中的ServletConfig对象！
	pageContext --> 一个顶9个！
	request --> HttpServletEequest
	response --> HttpServletResponse
	exception --> Throwable
	session --> HttpSession
	application --> ServletContext		
	1、pageContext， 一个顶九个
	2、Servlet（javaWeb）中有三大域，而JSP中有四大域，它就是最后一个域对象
		作用范围：
			ServletContext：整个应用程序
			session：整个会话(一个会话中只有一个用户)
			request：一个请求链！
			pageContext：一个jsp页面！这个域是在当前jsp页面和当前jsp页面中使用的标签之间共享数据
	3、作用
		a、代理其他域（向其他对象中存取数据）：pageContext.setAttribute("xxx", "XXX", PageContext.SESSION_SCOPE);
		b、全域查找：pageContext.findAttribute("xxx");从最小的域到大，依赖查找！
		c、可以获取其他8个内置对象

十三、JSP动作标签，一共提供了20个动作标签，还可以自定义标签
		动作标签室友tomcat(服务器)解释执行的；html提供的标签由浏览器来执行
	1、<jsp:forward>：转发！它与RequestDispatcher的forward方法是一样的，一个是在Servlet中使用，一个是在jsp中使用
	2、<jsp:include>：包含：它与RequestDispatcher的include方法是一样的，一个是在Servlet中使用，一个是在jsp中使用
		格式：<jsp:include page="lo.jsp" />
	3、<jsp:param>：它用来作为forward和include的子标签！用来给转发或包含的页面传递参数	
		格式：
			<jsp:include page="/b.jsp">
				<jsp:param value="zhangSan" name="username"/>[给被包含的页面b.jsp传递参数。]
			</jsp:include>	//a.jsp文件， param标签要在forward或者include里面使用
			//在b.jsp中进行调用
			<%
				String username = request.getParameter("username");[获取参数]
				out.print("你好：" + username);
			%>

十四、javaBean的规范：
	1、必须要有一个默认构造器
	2、必须提供get/set方法，如果只有get方法，那么这个属性是只读属性！
	3、属性：有get/set方法的成员，还可以没有成员，只有get/set方法。属性名称由get/set方法来决定！而不是成员名称！
	4、方法名称满足一定的规范，那么它就是属性！boolean类型的属性，它的读方法可以是is开头，也可以是get开头！			
		
十五、EL表达式
	1、EL是JSP内置的表达式语言！
		jsp2.0开始，不让再使用java脚本，而是（作用：）使用el表达式和动态标签来替代java脚本！
		EL替代的是<%= ... %>，也就是说，EL只能做输出！
	2、EL表达式来读取四大域，读取格式：${...}
		${xxx}，全域查找名为xxx的属性，如果不存在，输出空字符串，而不是null。
		${pageScope.xxx}、${requestScope.xxx}、${sessionScope.xxx}、${applicationScope.xxx}，指定域获取属性！
	3、javaBean导航
		<%
			Address address = new Address();
			address.setCity("北京");
			address.setStreet("西三旗");
	
			Employee emp = new Employee();
			emp.setName("李小四");
			emp.setSalary(123456);
			emp.setAddress(address);
	
			request.setAttribute("emp", emp);
		%>

	<h3>使用el获取request域的emp</h3>
	${requestScope.emp.address.street }等价于<!-- request.getAttribute("emp").getAddress().getStreet() --><br/>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		