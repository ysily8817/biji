一、XML：可扩展的标记语言

二、XML的作用
	1、可以用来保存数据
	2、可以用来做配置文件
	3、数据传输载体
	
三、XML文档声明
	1、简单声明，version：解析这个xml的时候，使用什么版本的解析器解析
		<?xml version="1.0"?>
	2、encoding：解析xml中的文字的时候，使用什么编码来翻译
		<?xml version="1.0" encoding="UTF-8"?>
	3、standlone：no-该文档会依赖于其他文档，yes-表示是一个独立文档
		<?xml version="1.0" encoding="UTF-8" standlone="no"?>

四、encoding详解
	1、encoding表示：在解析这个xml的时候，使用什么编码去解析。   ---解码。 
	2、默认文件保存的时候，使用的是GBK的编码保存。 
	所以要想让我们的xml能够正常的显示中文，有两种解决办法
		1. 让encoding也是GBK或者gb2312 . 
		2. 如果encoding是utf-8，那么保存文件的时候也必须使用utf-8
		3. 保存的时候见到的ANSI对应的其实是我们的本地编码GBK。
	为了通用，建议使用UTF-8编码保存，以及encoding 都是 utf-8
	
五、元素的定义，元素也叫标签
	1、其实就是里面的标签，<>括起来的都叫元素。成对出现。如下： 
    	<stu> </stu>
	2、文档声明下来的第一个元素叫做根元素 (根标签)
	3、标签里面可以嵌套标签
		<stu>
			<name>张三</name>
			<age/>
		</stu>
	4、空标签
    	既是开始也是结束。 一般配合属性来用。
    	<age/>
	5、标签可以自定义。 
		名称可以含字母、数字以及其他的字符 
		名称不能以数字或者标点符号开始 
		名称不能以字符 “xml”（或者 XML、Xml）开始 
		名称不能包含空格 

	命名尽量简单，做到见名知义	
	
六、简单元素  & 复杂元素 
	1、简单元素 
		元素里面包含了普通的文字，在“七”中，<name>标签就属于简单元素，<stu>标签属于复杂元素
	2、复杂元素
		元素里面还可以嵌套其他的元素

七、属性的定义
	1、定义在元素里面， <元素名称  属性名称="属性的值"></元素名称>
		<stus>
			<stu id="10086">
				<name>张三</name>
				<age>18</age>
			</stu>
			<stu id="10087">
				<name>李四</name>
				<age>28</age>
			</stu>
		</stus>
		
八、xml注释：
	与html的注释一样。 
	格式为：<!-- --> 
	如： 
		<?xml version="1.0" encoding="UTF-8"?>
		<!-- 
			//这里有两个学生
			//一个学生，名字叫张三， 年龄18岁， 学号：10086
			//另外一个学生叫李四  。。。
		 -->
	xml的注释，不允许放置在文档的第一行。 必须在文档声明的下面。		

九、XML解析方式(面试常问)
	有很多种，但是常用的有两种：DOM 和 SAX
		DOM：document object model 把整个xml全部读到内存当中，形成树状结构，整个文档称为
	document对象，属性对应Attribute对象，所有的元素节点对应Element对象，文本也可以称为Text
	对象，以上所有对象都可以称为Node节点，如果xml特别大，会造成内存溢出，可以对文档进行增删操作
		SAX：Simple API for Xml基于事件驱动，读取一行，解析一行，不会造成内存溢出，只能进行查询操作

十、针对以上两种解析方式的API
	一些组织或者公司， 针对以上两种解析方式， 给出的解决方案有哪些？
		jaxp  sun公司。 比较繁琐
		jdom
		dom4j  使用比较广泛
	
十一、Dom4j 基本用法

		element.element("stu") : 返回该元素下的第一个stu元素
		element.elements(); 返回该元素下的所有子元素。 

	1. 创建SaxReader对象

	2. 指定解析的xml

	3. 获取根元素。

	4. 根据根元素获取子元素或者下面的子孙元素

		try {
			//1. 创建sax读取对象
			SAXReader reader = new SAXReader(); //jdbc -- classloader
			//2. 指定解析的xml源
			Document  document  = reader.read(new File("src/xml/stus.xml"));
			
			//3. 得到元素、
			//得到根元素
			Element rootElement= document.getRootElement();
			
			//获取根元素下面的子元素 age
		//rootElement.element("age") 
			//System.out.println(rootElement.element("stu").element("age").getText());


			//获取根元素下面的所有子元素 。 stu元素
			List<Element> elements = rootElement.elements();
			//遍历所有的stu元素
			for (Element element : elements) {
				//获取stu元素下面的name元素
				String name = element.element("name").getText();
				String age = element.element("age").getText();
				String address = element.element("address").getText();
				System.out.println("name="+name+"==age+"+age+"==address="+address);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}	
	
-----------------------------------------------------------------------------------------------
Tomcat
一、Tomcat安装
	1. 直接解压 ，然后找到bin/startup.bat
	2. 可以安装
		启动之后，如果能够正常看到黑窗口，表明已经成功安装。 
		为了确保万无一失， 最好在浏览器的地址栏上输入 ： http://localhost:8080 , 如果有看到内容 就表明成功了。
	3. 如果双击了startup.bat,  看到一闪而过的情形，一般都是 JDK的环境变量没有配置。 

二、Tomcat目录介绍
	1、bin
		包含了一些jar ,  bat文件 。  startup.bat
	2、conf
		tomcat的配置 	server.xml  web.xml
	3、lib 
	  	tomcat运行所需的jar文件
	4、logs
		运行的日志文件
	5、temp
		临时文件
	6、webapps
		发布到tomcat服务器上的项目，就存放在这个目录。	
	7、work(目前不用管)
		jsp翻译成class文件存放地
​	
三、如何把一个项目发布到tomcat中
	需求： 如何能让其他的电脑访问我这台电脑上的资源 。 stu.xml
	localhost : 本机地址
	
	1、拷贝这个文件到webapps/ROOT底下， 在浏览器里面访问：
		http://localhost:8080/stu.xml
	* 在webaps下面新建一个文件夹xml  , 然后拷贝文件放置到这个文件夹中
		http://localhost:8080/xml/stu.xml
		http://localhost:8080 ： 其实对应的是到webapps/root
		http://localhost:8080/xml/ : 对应是 webapps/xml
		使用IP地址访问：
		http://192.168.37.48:8080/xml/stu.xml

	2、配置虚拟路径
		使用localhost：8080 打开tomcat首页， 在左侧找到tomcat的文档入口， 点击进去后， 在左侧接着
	找到 Context入口，点击进入。
	http://localhost:8080/docs/config/context.html
		1. 在conf/server.xml 找到host元素节点。
		2. 加入以下内容。
   		<!-- docBase ：  项目的路径地址 如： D:\xml02\person.xml
   		path : 对应的虚拟路径 一定要以/打头。
   		对应的访问方式为： http://localhost:8080/a/person.xml -->
   		<Context docBase="D:\xml02" path="/a"></Context>
	3、在浏览器地址栏上输入： http://localhost:8080/a/person.xml

	3、配置虚拟路径
		1. 在tomcat/conf/catalina/localhost/ 文件夹下新建一个xml文件，名字可以自己定义。 person.xml
		2. 在这个文件里面写入以下内容
			<?xml version='1.0' encoding='utf-8'?>
			<Context docBase="D:\xml02"></Context>
		3. 在浏览器上面访问
	http://localhost:8080/person/xml的名字即可

四、给Eclipse配置Tomcat
	1、在server里面 右键新建一个服务器， 选择到apache分类， 找到对应的tomcat版本， 接着一步一步配置即可。
	2、配置完毕后， 在server 里面， 右键刚才的服务器，然后open  ， 找到上面的Server Location , 选择中
	间的 Use Tomcat installation...
	3、创建web工程， 在WebContent下定义html文件， 右键工程， run as server 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	