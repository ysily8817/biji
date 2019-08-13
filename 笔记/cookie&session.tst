Cookie
	饼干. 其实是一份小数据， 是服务器给客户端，并且存储在客户端上的一份小数据
一、应用场景
	自动登录、浏览记录、购物车。

二、为什么要有这个Cookie
	http的请求是无状态。 客户端与服务器在通讯的时候，是无状态的，其实就是客户端在第二次来访的时候，
		服务器根本就不知道这个客户端以前有没有来访问过。 为了更好的用户体验，更好的交互 [自动登录]，
			其实从公司层面讲，就是为了更好的收集用户习惯[大数据]

三、Cookie怎么用
	简单使用：
	a、添加Cookie给客户端
		1、在响应的时候，添加cookie
			Cookie cookie = new Cookie("aa", "bb");
			//给响应，添加一个cookie
			response.addCookie(cookie);
		2、客户端收到的信息里面，响应头中多了一个字段 Set-Cookie：aa==bb

	b、获取客户端带过来的Cookie
		获取客户端带过来的cookie
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			for (Cookie c : cookies) {
				String cookieName = c.getName();
				String cookieValue = c.getValue();
				System.out.println(cookieName + " = "+ cookieValue);
			}
		}

四、常用方法
	1、关闭浏览器后，cookie就没有了。 ---> 针对没有设置cookie的有效期。
		//expiry： 有效 以秒计算。
		//正值 ： 表示 在这个数字过后，cookie将会失效。
		//负值： 关闭浏览器，那么cookie就失效， 默认值是 -1
		cookie.setMaxAge(60 * 60 * 24 * 7);
	2、赋值新的值
		//cookie.setValue(newValue);
		
		//用于指定只有请求了指定的域名，才会带上该cookie
		cookie.setDomain(".itheima.com");
		
		//只有访问该域名下的cookieDemo的这个路径地址才会带cookie
		cookie.setPath("/CookieDemo");


五、例子一 显示最近访问的时间。
	1、判断账号是否正确
	2、如果正确，则获取cookie。 但是得到的cookie是一个数组， 我们要从数组里面找到我们想要的对象。
	3、如果找到的对象为空，表明是第一次登录。那么要添加cookie
	4、如果找到的对象不为空， 表明不是第一次登录。 
		if("admin".equals(userName) && "123".equals(password)){
			//获取cookie last-name --- >
			Cookie [] cookies = request.getCookies();
			
			//从数组里面找出我们想要的cookie
			Cookie cookie = CookieUtil.findCookie(cookies, "last");
			
			//是第一次登录，没有cookie
			if(cookie == null){
				
				Cookie c = new Cookie("last", System.currentTimeMillis()+"");
				c.setMaxAge(60*60); //一个小时
				response.addCookie(c);
				response.getWriter().write("欢迎您, "+userName);
				
			}else{
				//1. 去以前的cookie第二次登录，有cookie
				long lastVisitTime = Long.parseLong(cookie.getValue());
				
				//2. 输出到界面，
				response.getWriter().write("欢迎您, "+userName +",上次来访时间是："+new Date(lastVisitTime));
				
				//3. 重置登录的时间
				cookie.setValue(System.currentTimeMillis()+"");
				response.addCookie(cookie);
			}
		}else{
			response.getWriter().write("登陆失败 ");
			
六、Cookie总结
	1、服务器给客户端发送过来的一小份数据，并且存放在客户端上。
	2、获取cookie， 添加cookie
		request.getCookie();
		response.addCookie();
	3、Cookie分类
	会话Cookie
		默认情况下，关闭了浏览器，那么cookie就会消失。
	持久Cookie
		在一定时间内，都有效，并且会保存在客户端上。 
		cookie.setMaxAge(0); //设置立即删除
		cookie.setMaxAge(100); //100 秒
	4、Cookie的安全问题。
		由于Cookie会保存在客户端上，所以有安全隐患问题。  还有一个问题， Cookie的大小与个数有限制。 
			为了解决这个问题 ---> Session .			

----------------------------Session---------------------------------
一、概念
	Session是基于Cookie的一种会话机制。 Cookie是服务器返回一小份数据给客户端，并且存放在客户端上。 Session是，
		数据存放在服务器端。

二、常用API
		//得到会话ID
		String id = session.getId();
		
		//存值
		session.setAttribute(name, value);
		
		//取值
		session.getAttribute(name);
		
		//移除值
		session.removeAttribute(name);

三、Session何时创建  ， 何时销毁?
	1、创建
		如果有在servlet里面调用了 request.getSession()
	2、销毁
		session 是存放在服务器的内存中的一份数据。 当然可以持久化. Redis . 即使关了浏览器，session也不会销毁。
		关闭服务器
		session会话时间过期。 有效期过了，默认有效期： 30分钟。
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			