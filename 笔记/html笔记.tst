一、基本格式
<!DOCTYPE html>	//1、是一个文档声明
<html>
	<head>
		<meta charset="utf-8" />
		<title>入门001</title>
	</head>
	<body>
		Hello world!	
	</body>
</html>

2、根标签是html
3、html文件主要包含两部分，头部分和体部分
	头部分主要用来放置一些页面信息，
	体部分主要放置HTML的页面内容
4、通过标签来对内容进行描述，标签通常都是由开始标签和结束标签组成
5、标签不区分大小写

二、常用标签
	1、<h1>....</h2>
		h1标题标签：
				h后面数字 取值范围：1-6，表示标题的级别，级别越高，字体越小
	2、<hr />表示一条水平分割线，放在一句话的后边 “------------------”		
	3、font标签
		例：<font color="blue" size="7">“中关村黑马程序员训练营”</font>
			font 标签常用属性
			color:颜色
			size:字体大小 范围1-7
			face:字体样式，如仿宋、微软雅黑
	4、换行标签
		<br/>放在一句话的后边
		<p>....</p>
	5、字体加粗	
		<b>传智播客</b>
		<strong>传智播客</strong>
	6、字体斜体
		<i>传智播客</i>
		<em>传智播客</em>
	7、图片标签	
		例：<img src="../img/logo2.png" width="500px" height="100px" alt="图片有误"/>
			src:指定图片路径
        	width:指定图片宽度
        	height:指定图片高度
        	alt:文件加载失败时的提示信息
	8、友情链接
		ul//无序列表
			li：列表项
			type属性：小圆圈，小方块，默认是小黑点
		例：<ul type="circle">
				<li>www.baidu.com</li>
				<li>www.12306.com</li>
			</ul>
		
		ol//有序链接
			type：指定序号的类型，数字开头、或字母开头进行排序
			start：从几开始，必须写数字
		例：<ol type="1" start="2">
				<li>www.baidu.com</li>
				<li>www.12306.com</li>
			</ol>
	9、将友情链接变为超链接	
		​a 超链接标签
​		常用的属性:
​			href: 指定要跳转去的链接地址  
​					如果是网络地址需要加上http协议 , 
​					如果访问的是本网站的html文件,可以直接写文件路径
​			target : 以什么方式打开
​				_self: 默认打开方式,在当前窗口打开
​				_blank:  新起一个标签页打开页面
		
		例：
		<body>
		<ul>
			<li><a href="http://www.baihe.com" target="_blank">百合网</a></li>
			<li><a href="http://www.jiayuan.com">世纪家园</a></li>
			<li>珍爱网</li>
			<li>非诚勿扰</li>
		</ul>
		</body>
		
	10、表格标签table	
		table标签:
​			常用的属性:
​				bgcolor : 背景色
				border:	  指定边框，值表示像素
​				width :   宽度
​				height:   高度
​				align:    对齐方式
​		tr 行标签
​		td 列标签	
		例：
		<body>
			<table border="1px" width="400px" bgcolor="aqua" align="left">
				<tr>
					<td>1</td>
					<td bgcolor="blanchedalmond">1</td>
					<td>1</td>
					<td>1</td>
				</tr>
			</table>
		</body>
		
	11、表格的合并
		colspan：跨列合并，被合并的单元格需要手动删除
		rcwspan：跨行合并。 <td colspan="2">1</td>  “2”代表暂用几个单元格

	12、表格的嵌套
		<tr>
			<table border="1px" width="100%"> //width="100%" 表示填充满当前单元格
				<tr>
					<td>1</td>
				</tr>
			</table>
		</tr>

	13、	
	
		表单提交form标签
			action：提交的地址
			method: 默认为get
				get方式：会将参数拼在链接后面，有大小限制，4k
				post方式：会将参数封装在请求体重，没有大小限制
		input:
			type:指定输入项的类型
			name:在表单提交的时候，当作参数的名称
			id：给输入项取一个名字，以便于后期我们去找它，并操作它
	<body>
		<form action="../04-网站首页/网站首页.html">
			<input type="hidden" value="aaaaaaaaadddddddddd" name="uid"/>  //hidden隐藏标签
			用户名：<input type="text" name="userName" placeholder="请输入用户名"/><br />  //placeholder文本框内的提示信息
			密码：<input type="password" /><br /> 
			确认密码：<input type="password" /><br /> 
			邮箱：<input type="text" /><br /> 
			手机号码：<input type="text" /><br /> 
			照片：<input type="file" /><br /> 
			性别：<input type="radio" name="sex" />男
			<input type="radio" name="sex" />女 <br /> ：
			爱好<input type="checkbox" />抽烟
				<input type="checkbox" />喝酒
				<input type="checkbox" />烫头
				<input type="checkbox" />撸代码
			<br /> 
			择偶标准：<textarea cols="40" rows="4"></textarea>
			<br /> 
			籍贯：<select>
				<option>--请选择--</option> //option属于select的子标签
				<option>--北京市--</option>
				<option>--上海市--</option>
			</select>
			<br /> 
			出生日期：<input type="date" /><br />
			验证码：<input type="text" /><br />
			<input type="submit" value="注册" />
			<input type="reset" value="重置"/>
		</form>
	</body>

	14、背景图案
		<td background="../image/059b5245-e3c8-43bf-80fe-700f0e4e68b8-thumbnail.jpg">

	15、framset标签，使用framset需要去掉body
		<frameset cols="10%,30%,*"> //表示分别占10%、30%和剩下的所有空间，按列分配空间；rows按行划分空间
			<frame src="../aa.html" />
			<frame src="../bb.html" />
			<frame src="../cc.html" />
		</frameset>

三、CSS
	1、HTML的块标签
		div标签：默认占一行，自动换行
		span标签：内容显示在同一行

	2、css语法规则，由三部分组成：选择器、属性、值
		selector{property : value}
	3、多个属性书写规则，使用分号隔开
		p{text-align:center;color:red}
	4、同时选择多个选择器
		h1,h2,h3,h4{color:red}
	5、关联css文件和html文件
		在HTML文件的<head></head>中添加
			<link rel="stylesheet" type="text/css" href="../css.css"> //rel为固定格式
	6、类选择器
		<p class="text1">aaaaa</p>
		<p class="text2">bbbbb</p> //写在HTML文件中的内容，每个HTML元素中只能有一个类属性
										<p class="text2" class="text3">bbbbb</p> 不会报错，但属于错误写法
		p.text1{text-align:right}
		p.text2{text-align:centre} //写在CSS文件中，目的就是为了对同一个标签p下的元素进行不同的设置
		.text1{text-align:right} //将所有类名为text1的元素居右显示
	7、id选择器
		#green{color:red} //对所有id的值为green的元素都匹配
		p#green{color:red} //匹配所有p元素切id的值为green的元素












	
		
		
		
		
		
		
		
		
		
		