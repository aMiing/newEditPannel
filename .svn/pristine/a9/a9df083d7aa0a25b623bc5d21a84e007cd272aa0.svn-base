 
var OptPool = require('./model/OptPool'); 
var http = require("http");
var querystring = require('querystring');
 
//2.创建服务器
var app = http.createServer();

var optPool = new OptPool(); 
var pool = optPool.getPool(); 

app.on('request',function(req, res){
    console.log("收到请求"+req.url);
    res.writeHead(200,{"Content-Type":'application/json','charset':'utf-8','Access-Control-Allow-Origin':'*',
    'Access-Control-Allow-Methods':'PUT,POST,GET,DELETE,OPTIONS'});//可以解决跨域的请求

    //定义一个从数据库重新加载并向前台写入pannelList的方法
    function loadPannelList(){
        //执行SQL语句 
        pool.getConnection(function(err,connection){ 
            if(err){
              console.log('pool.getConnection执行出错-- ',err.message);
              return;
            }
            let  sql = "SELECT id,title,img,published FROM screens WHERE unaviable = 0 ";//
            connection.query(sql,function (err, result) {
                if(err){
                  console.log('query出错 - ',err.message);
                  return;
                }
                console.log('查询成功');
                //把得到的对象转化成字符串方便传输
                let str = JSON.stringify(result);
                console.log(str);
                res.write(str);
                res.end();
                pool.releaseConnection(connection); //释放连接
            });
        });
    }

    //处理GET请求getPannelList获取screen数据
    if(req.method === 'GET'&&req.url === '/getPannelList'){
        loadPannelList();
    }
    //查询widgets和binds
    else if(req.method === 'GET'&&req.url.match(/\/edit\?id=[0-9]+/)){//正则匹配字符串
      console.log("收到get请求"+req.url);  
      let theScreenId = parseInt(req.url.split('=')[1]); //获取到编辑屏幕的id 
      let  sql_widgets = " SELECT * FROM widgets"; 
      let  sql_bind = " SELECT * FROM binds WHERE bindId="+theScreenId; 
      let  sql_screen = " SELECT * FROM screens WHERE id="+theScreenId; 
      let  sql_tabItem = " SELECT * FROM tabItems"; 
      let widgetStr; 
      let bindStr; 
      let screenStr;
      let tabItemStr;
      let i = 0; 
      console.log(sql_bind);
      pool.getConnection(function(err,connection){
        if(err){
          throw "连接池报错"+err;
          console.log("连接池报错");
          return;
        }
        queryData = function(sql,str) {
            return new Promise(function (resovle, reject) {
                   connection.query(sql,function (err, result) {
                        if(err){
                          console.log('query出错了 - ',err.message);
                          return;
                        }
                        //把得到的对象转化成字符串方便传输
                        str = JSON.stringify(result);
                        console.log(str);
                        res.write(str+';');
                        i++;
                        if(i>=4){
                          res.end();
                          pool.releaseConnection(connection); //释放连接
                        }
                        return str;
                    });
                    resovle();
            });
        };
        fn = async function () {
            // 会造成阻塞
            await queryData(sql_widgets,widgetStr);
            await queryData(sql_bind,bindStr);
            await queryData(sql_screen,screenStr);
            await queryData(sql_tabItem,tabItemStr);

        }();

     });
    
    }
    //加载页面组件执行预览
    else if(req.method === 'GET'&&req.url.match(/\/previewScreen\?id=[0-9]+/)){//正则匹配字符串
      console.log("收到预览get请求"+req.url);  
      let ScreenId = parseInt(req.url.split('=')[1]); //获取到预览屏幕的id 
      let  sql_bind = " SELECT * FROM binds WHERE bindId="+ScreenId; 
      let  sql_screen = " SELECT bgcolor,bgimg FROM screens WHERE id="+ScreenId; 
      let bindStr;
      let screenStr; 
      let i=0;

      pool.getConnection(function(err,connection){
        if(err){
          throw "连接池报错"+err;
          console.log("连接池报错");
          return;
        }
        queryData = function(sql,str) {
            return new Promise(function (resovle, reject) {
                   connection.query(sql,function (err, result) {
                        if(err){
                          console.log('query出错了 - ',err.message);
                          return;
                        }
                        //把得到的对象转化成字符串方便传输
                        str = JSON.stringify(result);
                        console.log(str);
                        res.write(str+';');
                        i++;
                        if(i>=2){
                          res.end();
                          pool.releaseConnection(connection); //释放连接
                        }
                        return str;
                    });
                    resovle();
            });
        };
        fn = async function () {
            // 会造成阻塞
            await queryData(sql_bind,bindStr);
            await queryData(sql_screen,screenStr);

        }();
      });

      
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
                  pool.releaseConnection(connection);
                  console.log('id为'+dataObject.id+'的数据更新成功');
              });

                  loadPannelList();
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
                  pool.releaseConnection(connection);
                 console.log('插入数据成功');
              });

                 // loadPannelList();
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
              var dataObject = querystring.parse(data);
              let json = dataObject;
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
                  else{
                    console.log('插入数据成功');
                    pool.releaseConnection(connection);
                  }
              });
            });
          });
        }
        //deleteBindWidgets

        //接收post： deleteBindWidgets
        else if(req.method === 'POST'&&req.url === '/deleteBindWidgets'){
          console.log('收到post请求/deleteBindWidgets');
          var data = '';//创建空字符叠加数据片段
          req.on('data', function (chunk) {//注册data事件接收数据（每当收到一段表单提交的数据，该方法会执行一次）
              data += chunk;// chunk 默认是一个二进制数据，和 data 拼接会自动 toString
          });
          req.on('end', function () {
              // data = decodeURI(data);//对url进行解码（url会对中文进行编码）没有中文
              var dataObject = querystring.parse(data);
              // console.log(dataObject.id);
            //创建连接
            let  sql = " DELETE FROM binds WHERE id="+parseInt(dataObject.id);
             // console.log(sql);
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
                  }else{
                    pool.releaseConnection(connection);
                    console.log('id为'+dataObject.id+'的数据删除成功');
                  }
                  
              });
            })
          });
        }
        //接收post：saveChange
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
                pool.getConnection(function(err,connection){
                  if(err){
                    throw err;
                    return;
                  }
                  for (var i = 0; i < json.length; i++) {
                    let sql = " UPDATE binds SET styleJson= '"+JSON.stringify(json[i])+"',dataJson= ' "+(json[i].dataJson)+" ' WHERE id= '"+json[i].id+"' " ;
                    console.log(sql);
                      //对查询出来的数据进行query解析，得到对象
                      connection.query(sql,function (err, result) {
                          if(err){
                            console.log('query出错了 - ',err.message);
                            return;
                          }else{
                            console.log('修改数据成功'+i);
                          }
                      });
                  }
                  setTimeout(function(){
                    console.log(999);
                    pool.releaseConnection(connection);
                  },2000);
                    
                    
                });



          });
        }
        //接收post：saveScreenSetting
        else if(req.method === 'POST'&&req.url === '/saveScreenSetting'){
          console.log('收到post请求/saveScreenSetting');
          var data = '';//创建空字符叠加数据片段
          req.on('data', function (chunk) {//注册data事件接收数据（每当收到一段表单提交的数据，该方法会执行一次）
              // chunk 默认是一个二进制数据，和 data 拼接会自动 toString
              data += chunk;
          });
          req.on('end', function () {
              data = decodeURI(data);//对url进行解码（url会对中文进行编码）
              
              var dataObject = querystring.parse(data);//dataObject的类型是object
              console.log(dataObject);
              let json = JSON.parse(dataObject.str);//把传过来的styleJson字符串转换成json
              // console.log(dataObject);
              console.log(json);
              let sql = " UPDATE screens SET bgcolor= '"+json.bgcolor+"',bgimg= ' "+(json.bgimg)+" ' WHERE id= '"+json.id+"' " ;
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
                    }else{
                      console.log('插入屏幕属性数据成功');
                      pool.releaseConnection(connection);
                    }
                });
              });

          });
        }
       

});
//监听端口号
app.listen(8888,function(){
    console.log("Server has started.port on 8888\n");
});
