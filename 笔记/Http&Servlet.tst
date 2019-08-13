HTTP协议
一、http协议
		针对网络上的客户端 与 服务器端在执行http请求的时候，遵守的一种规范。 其实就是规定了客户端在访问服务器端的
	时候，要带上哪些东西， 服务器端返回数据的时候，也要带上什么东西。 
	* 版本特征
	1.0
		请求数据，服务器返回后， 将会断开连接
	1.1
		请求数据，服务器返回后， 连接还会保持着。 除非服务器 | 客户端 关掉。 有一定的时间限制，如果都空着这
		个连接，那么后面会自己断掉。

---------------------------------------------------------------------------
Servlet
一、Servlet配置方式（在web.xml中进行配置的，<url-pattern>/aa</url-pattern>）
	1、全路径匹配
		以 / 开始   /a /aa/bb
		localhost:8080/项目名称/aa/bb 
	2、路径匹配 , 前半段匹配
		以  / 开始 ， 但是以 * 结束  /a/* /*  
		* 其实是一个通配符，匹配任意文字
		localhost:8080/项目名称/aa/bb 
	3、以扩展名匹配
		写法： 没有/  以 * 开始   *.扩展名    *.aa *.bb 
		
ServletContext
	每个web工程都只有一个ServletContext对象。 说白了也就是不管在哪个servlet里面，获取到的这个类的对象都是同一个。
	如何得到对象，该类要继承HttpServlet类，才可以直接使用以下方法
		1. 获取对象
		ServletContext context = getServletContext();

一、ServletContext有什么作用
	1、获取全局配置参数，即获取web.xml中以下属性
								  <context-param>
									<param-name>address</param-name>
									<param-value>中国</param-value>
								  </context-param>
		代码如下：
				ServletContext context = getServletContext();	//获取对象
				String address = context.getInitParameter("address");
		
	2、获取web工程中的资源，因为无法直接获得工程下面的某个文件，所以借助ServletContext的对象进行获取
		代码如下：
				ServletContext context = getServletContext();	//获取对象
				String path = context.getRealPath("fi/aa.pr");	//获取文件的绝对路径
				Properties properties = new Properties();		//创建属性对象
				FileInputStream inputStream = new FileInputStream(path);
				properties.load(inputStream);
				String name = properties.getProperty("name");
		说明：
			context.getRealPath("") //这里得到的是项目在tomcat里面的根目录。
			D:\tomcat\apache-tomcat-7.0.52\apache-tomcat-7.0.52\wtpwebapps\Demo03\
	
		 	String path = context.getRealPath("file/config.properties");
			D:\tomcat\apache-tomcat-7.0.52\apache-tomcat-7.0.52\wtpwebapps\Demo03\file\config.properties
				
	3、存取数据，servlet间共享数据  域对象

	细节：
	1、form 中 action的值是指的xml中 <url-pattern>/login</url-pattern>的值
		<form action="login" method="get">
			账号:<input type="text" name="username"/><br>
			密码:<input type="text" name="password"/><br>
			<input type="submit" value="登录"/>
		</form>
	2、超链接href的值也是指的xml中 <url-pattern>/login</url-pattern>的值
		<body>
			<h2>登录成功11</h2>
			<a href="CountServlet">即将跳转</a>
		</body>
	
二、HttpServletRequest
	作用：这个对象封装了客户端提交过来的一切数据。 
	1、可以获取客户端请求头信息
		//得到一个枚举集合  
		Enumeration<String> headerNames = request.getHeaderNames();
		while (headerNames.hasMoreElements()) {
			String name = (String) headerNames.nextElement();
			String value = request.getHeader(name);
			System.out.println(name+"="+value);	
		}
	2、获取客户端提交过来的数据
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		System.out.println("name="+name);
		System.out.println("address="+address);
	
三、客户端提交至服务器端产生乱码
如果是GET方式
	1、代码转码
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			System.out.println("userName="+username+"==password="+password);
			//get请求过来的数据，在url地址栏上就已经经过编码了，所以我们取到的就是乱码，
			//tomcat收到了这批数据，getParameter 默认使用ISO-8859-1去解码
			//先让文字回到ISO-8859-1对应的字节数组 ， 然后再按utf-8组拼字符串
			username = new String(username.getBytes("ISO-8859-1") , "UTF-8");
			System.out.println("userName="+username+"==password="+password);
			直接在tomcat里面做配置，以后get请求过来的数据永远都是用UTF-8编码。 
	2、可以在tomcat里面做设置处理 conf/server.xml 加上URIEncoding="utf-8"
		  <Connector connectionTimeout="20000" port="8080" protocol="HTTP/1.1" redirectPort="8443" URIEncoding="UTF-8"/>
如果是POST方式
		这个说的是设置请求体里面的文字编码。  get方式，用这行，有用吗？ ---> 没用
		request.setCharacterEncoding("UTF-8");
		这行设置一定要写在getParameter之前。	
	
四、HttpServletResponse
	负责返回数据给客户端。 
	1、输出数据到页面上
		//以字符流的方式写数据	
		//response.getWriter().write("<h1>hello response...</h1>");
		//以字节流的方式写数据 
		response.getOutputStream().write("hello response2222...".getBytes());
	2、响应的数据中有中文，那么有可能出现中文乱码
		以字符流输出
		response.getWriter()
		//1. 指定输出到客户端的时候，这些文字使用UTF-8编码
		response.setCharacterEncoding("UTF-8");
		//2. 直接规定浏览器看这份数据的时候，使用什么编码来看。
		response.setHeader("Content-Type", "text/html; charset=UTF-8");
		response.getWriter().write("我爱黑马训练营...");
	3、以字节流输出，解决乱码问题 
		response.getOutputStream()
		//1. 指定浏览器看这份数据使用的码表
		response.setHeader("Content-Type", "text/html;charset=UTF-8");
		//2. 指定输出的中文用的码表
		response.getOutputStream().write("我爱深圳黑马训练营..".getBytes("UTF-8"));
	4、不管是字节流还是字符流，直接使用一行代码就可以了。
		response.setContentType("text/html;charset=UTF-8");
		然后在写数据即可。

五、演练下载资源。
	1. 直接以超链接的方式下载，不写任何代码。 也能够下载东西下来。 
		让tomcat的默认servlet去提供下载：<br>
		<a href="download/aa.jpg">aa.jpg</a><br>
		<a href="download/bb.txt">bb.txt</a><br>
		<a href="download/cc.rar">cc.rar</a><br>
	原因是tomcat里面有一个默认的Servlet -- DefaultServlet 。这个DefaultServlet 专门用于处理放在tomcat服务器上的静态资源。

六、跳转问题
	1、html文件跳转至Servlet类
		<form action="RegiestServlet">	//aciton指定Servlet的子类
	2、Servlet类跳转到html文件
		resp.setStatus(302);
		resp.setHeader("Location", "login.html");
	3、直接跳转
		resp.sendRedirect("stu_list.jsp");
		
	
	
	
	
	
	
	
	
	
	
	
	