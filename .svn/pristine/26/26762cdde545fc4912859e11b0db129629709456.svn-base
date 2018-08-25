var mysql  = require('mysql');  
var http = require("http");
var fs = require("fs");
//导入querystring模块（解析post请求数据）
var querystring = require('querystring');

//2.创建服务器
var app = http.createServer();
//设置连接属性
var pool = mysql.createPool({     
  host     : 'localhost',  // 119.23.245.65    
  user     : 'admin',              
  password : '123456',       
  port: '3306',                   
  database: 'mypannel', 
  connectionLimit:50
}); 

    var str;
    //发送请求数据
    function reload(){
      pool.getConnection(function(err,connection){
        if(err){
          throw err;
          return;
        }
        let  sql = "SELECT id,title,img,published,haveContent FROM screens WHERE unaviable = 0";//数据库查询语句
        //对查询出来的数据进行query解析，得到对象
        connection.query(sql,function (err, result) {
            if(err){
              console.log('query出错了 - ',err.message);
              return;
            }
            console.log('查询成功');
            //把得到的对象转化成字符串方便传输
            str = JSON.stringify(result);
            return str;
            console.log(str);
            connection.release(); //释放连接
        });
      });
    }
    reload();
   //断开连接  
  //请求触发事件
    app.on('request',function(req, res){
        console.log(req.url);
        //设置响应头
        res.writeHead(200,{"Content-Type":'application/json','charset':'utf-8','Access-Control-Allow-Origin':'*',
        'Access-Control-Allow-Methods':'PUT,POST,GET,DELETE,OPTIONS'});//可以解决跨域的请求
        //处理GET请求
        if(req.method === 'GET'&&req.url === '/getData'){
          reload();
          res.write(str);
          console.log(str);
          res.end();
        }
        //加载getContent
        else if(req.method === 'GET'&&req.url.match(/\/getContent\?id=[0-9]+/)){//正则匹配字符串
          console.log("收到get请求"+req.url);  
          theScreenId = parseInt(req.url.split('=')[1]); //获取到编辑屏幕的id 
          let  sql = " SELECT content FROM screens WHERE id="+theScreenId; 

          pool.getConnection(function(err,connection){
            if(err){
              throw err;
              return;
            }
            connection.query(sql,function (err, result) {
                if(err){
                  console.log('query出错了 - ',err.message);
                  return;
                }
                //把得到的对象转化成字符串方便传输
                var contentStr = JSON.stringify(result[0].content);
                console.log(contentStr);
                res.write(contentStr);
                res.end();
                return contentStr;
                connection.release(); //释放连接
            });
          });
          
        }
        //查询widgets和binds
        else if(req.method === 'GET'&&req.url.match(/\/edit\?id=[0-9]+/)){//正则匹配字符串
          console.log("收到get请求"+req.url);  
          theScreenId = parseInt(req.url.split('=')[1]); //获取到编辑屏幕的id 
          let  sql_widgets = " SELECT * FROM widgets"; 
          let  sql_bind = " SELECT * FROM binds WHERE bindId="+theScreenId; 
          let widgetStr; 
          let bindStr; 

          pool.getConnection(function(err,connection){
            if(err){
              throw "连接池报错"+err;
              console.log("连接池报错");
              return;
            }
            connection.query(sql_widgets,function (err, result) {
                if(err){
                  console.log('query出错了 - ',err.message);
                  return;
                }
                //把得到的对象转化成字符串方便传输
                widgetStr = JSON.stringify(result);
                console.log(widgetStr);
                res.write(widgetStr+';');
                return widgetStr;
            });
          });
          pool.getConnection(function(err,connection){
            if(err){
              throw err;
              return;
            }
            connection.query(sql_bind,function (err, result) {
                if(err){
                  console.log('query出错了 - ',err.message);
                  return;
                }
                //把得到的对象转化成字符串方便传输
                bindStr = JSON.stringify(result);
                console.log(bindStr);
                res.write(bindStr);
                res.end();
                return bindStr;
                connection.release(); //释放连接
            });
          });
          console.log("2"+theScreenId); 
          
        }
        //接收post：changeTitle请求
        else if(req.method === 'POST'&&req.url === '/changeTitle'||req.url === '/deleatePannel'||req.url==='/publishedOr'){
          console.log('收到post请求/changeTitle||/deleatePannel||publishedOr');
          var data = '';//创建空字符叠加数据片段
          req.on('data', function (chunk) {//注册data事件接收数据（每当收到一段表单提交的数据，该方法会执行一次）
              data += chunk;// chunk 默认是一个二进制数据，和 data 拼接会自动 toString
          });
          req.on('end', function () {
              data = decodeURI(data);//对url进行解码（url会对中文进行编码）
              var dataObject = querystring.parse(data);
              console.log(dataObject.id);
            //创建连接
            if(req.url === '/changeTitle'){
               var  sql = " UPDATE screens SET title='"+dataObject.value+"' WHERE id="+parseInt(dataObject.id);
            }
            else if(req.url === '/deleatePannel'){
               var  sql = " UPDATE screens SET unaviable='1' WHERE id="+parseInt(dataObject.id);
            }
            else if(req.url === '/publishedOr'){
               var  sql = " UPDATE screens SET published='"+dataObject.published+"' WHERE id="+parseInt(dataObject.id);
            }
               console.log(sql);
            pool.getConnection(function(err,connection){
              if(err){
                throw err;
                return;
              }
              //对查询出来的数据进行query解析，得到对象
              connection.query(sql,function (err, result) {
                  if(err){
                    console.log('[SELECT ERROR] - ',err.message);
                    return;
                  }
                  reload();
                  console.log('id为'+dataObject.id+'的数据更新成功');
              });
            })
          });
        }
        //接收post：addPannel请求
        else if(req.method === 'POST'&&req.url === '/addPannel'){
          console.log('收到post请求/addPannel');
          var data = '';//创建空字符叠加数据片段
          req.on('data', function (chunk) {//注册data事件接收数据（每当收到一段表单提交的数据，该方法会执行一次）
              // chunk 默认是一个二进制数据，和 data 拼接会自动 toString
              data += chunk;
          });
          req.on('end', function () {
              data = decodeURI(data);//对url进行解码（url会对中文进行编码）
              var dataObject = querystring.parse(data);
              let json = JSON.parse(dataObject.addPannel);
              //console.log(json.title);
              let  sql = " INSERT INTO screens (`title`, `img`, `published`) VALUE ('"+json.title+"','"+json.img+"','"+json.published+"') ";
              
            pool.getConnection(function(err,connection){
              if(err){
                throw err;
                return;
              }
              //对查询出来的数据进行query解析，得到对象
              connection.query(sql,function (err, result) {
                  if(err){
                    console.log('[SELECT ERROR] - ',err.message);
                    return;
                  }
                 reload();
                 console.log('插入数据成功');
              });
            });
          });
        }
        //接收post： addBindWidgets请求
        else if(req.method === 'POST'&&req.url === '/addBindWidgets'){
          console.log('收到post请求/addBindWidgets');
          var data = '';//创建空字符叠加数据片段
          req.on('data', function (chunk) {//注册data事件接收数据（每当收到一段表单提交的数据，该方法会执行一次）
              // chunk 默认是一个二进制数据，和 data 拼接会自动 toString
              data += chunk;
          });
          req.on('end', function () {
              data = decodeURI(data);//对url进行解码（url会对中文进行编码）
              console.log(data);
              var dataObject = querystring.parse(data);
              //console.log(typeof(dataObject));
              //let json = JSON.parse(dataObject);
              let json = dataObject;
              console.log(json);
              let  sql = " INSERT INTO binds (`uid`, `name`, `bindId`,`styleJson`, `dataJson`, `layer`) \
              VALUE ('"+json.uid+"','"+json.name+"','"+json.bindId+"','"+json.styleJson+"','"+json.dataJson+"','"+json.layer+"') ";
              console.log(sql);
            pool.getConnection(function(err,connection){
              if(err){
                throw err;
                return;
              }
              //对查询出来的数据进行query解析，得到对象
              connection.query(sql,function (err, result) {
                  if(err){
                    console.log('[SELECT ERROR] - ',err.message);
                    return;
                  }
                 console.log('插入数据成功');
                 connection.release();
              });
            });
          });
        }
        //deleteBindWidgets

        //接收post： deleteBindWidgets
        else if(req.method === 'POST'&&req.url === '/deleteBindWidgets'){
          console.log('收到post请求/deleteBindWidgets'+req.index);
          var data = '';//创建空字符叠加数据片段
          req.on('data', function (chunk) {//注册data事件接收数据（每当收到一段表单提交的数据，该方法会执行一次）
              data += chunk;// chunk 默认是一个二进制数据，和 data 拼接会自动 toString
          });
          req.on('end', function () {
              data = decodeURI(data);//对url进行解码（url会对中文进行编码）
              var dataObject = querystring.parse(data);
              console.log(dataObject.id);
            //创建连接
             var  sql = " DELETE FROM binds WHERE id="+parseInt(dataObject.id);
             console.log(sql);
            pool.getConnection(function(err,connection){
              if(err){
                throw err;
                return;
              }
              //对查询出来的数据进行query解析，得到对象
              connection.query(sql,function (err, result) {
                  if(err){
                    console.log('[SELECT ERROR] - ',err.message);
                    return;
                  }
                  console.log('id为'+dataObject.id+'的数据删除成功');
              });
            })
          });
        }
        //接收post： saveChange
        else if(req.method === 'POST'&&req.url === '/saveChange'){
          console.log('收到post请求/saveChange');
          var data = '';//创建空字符叠加数据片段
          req.on('data', function (chunk) {//注册data事件接收数据（每当收到一段表单提交的数据，该方法会执行一次）
              // chunk 默认是一个二进制数据，和 data 拼接会自动 toString
              data += chunk;
          });
          req.on('end', function () {
              data = decodeURI(data);//对url进行解码（url会对中文进行编码）
              // console.log(data);
              var dataObject = querystring.parse(data);//dataObject的类型是object
              let json = JSON.parse(dataObject.str);//把传过来的styleJson字符串转换成json
              // console.log(dataObject);
              //console.log(json);
              for (var i = 0; i < json.length; i++) {
                let sql = " UPDATE binds SET styleJson= '"+JSON.stringify(json[i])+"',dataJson= ' "+JSON.stringify(json[i].dataJson)+" ' WHERE id= '"+json[i].id+"' " ;
                console.log(sql);
                pool.getConnection(function(err,connection){
                  if(err){
                    throw err;
                    return;
                  }
                  //对查询出来的数据进行query解析，得到对象
                  connection.query(sql,function (err, result) {
                      if(err){
                        console.log('query出错了 - ',err.message);
                        return;
                      }
                     console.log('插入数据成功');
                     connection.release();
                  });
                });
              }

          });
        }
        //接收post： previewScreen
        else if(req.method === 'POST'&&req.url === '/previewScreen'){
          console.log('收到post请求/previewScreen');
          var data = '';//创建空字符叠加数据片段
          req.on('data', function (chunk) {//注册data事件接收数据（每当收到一段表单提交的数据，该方法会执行一次）
              // chunk 默认是一个二进制数据，和 data 拼接会自动 toString
              data += chunk;
          });
          req.on('end', function () {
              console.log(("666:"+data));
              data = decodeURI(data);//对url进行解码（url会对中文进行编码）string
              // console.log(data);
              let rap = new RegExp(/\%\%3B/,'g');
              data = data.replace(rap,'%25%3B');//手动转义%字符
              console.log('\n'+data+'\n');
              var dataObject = querystring.parse(data);//dataObject的类型是object
              console.log(dataObject);
              /*var reg = new RegExp(/((height|width|top|left)\: \d+(\.\d+)?)/,"g");
              let contentStr = dataObject.content.replace(reg,'$1%');
              console.log(contentStr);
              //console.log(dataObject);*/
              let  sql = " UPDATE screens SET content= '"+dataObject.content+"',haveContent=1 WHERE id= '"+dataObject.id+"' " ;
              // console.log(sql);
 
            pool.getConnection(function(err,connection){
              if(err){
                throw err;
                return;
              }
              //对查询出来的数据进行query解析，得到对象
              connection.query(sql,function (err, result) {
                  if(err){
                    console.log('query出错了 - ',err.message);
                    return;
                  }
                 // console.log('插入数据成功');
                 connection.release(); //释放连接
              });
            });
          });
        }

    })


 //断开连接  
  //connection.end();
//监听端口号
app.listen(8888,function(){
    console.log("Server has started.port on 8888\n");
});


