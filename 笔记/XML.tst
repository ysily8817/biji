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