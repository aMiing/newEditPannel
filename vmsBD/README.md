**demo**: [https://taylorchen709.github.io/vue-admin/](https://taylorchen709.github.io/vue-admin/)

# To start

This is a project template for [vue-cli](https://github.com/vuejs/vue-cli)

``` bash
# install dependencies
npm install

# serve with hot reload at localhost:8081
npm run dev

# build for production with minification
npm run build

```

# Folder structure8
* build - webpack config files
* config - webpack config files
* dist - build
* src -your app
    * api
    * assets
    * common
    * components - your vue components
    * mock
    * styles
    * views - your pages
    * vuex
    * App.vue
    * main.js - main file
    * routes.js
* static - static assets

# Theme
You can change theme by 
1. Generate theme packages by [https://elementui.github.io/theme-preview/#/](https://elementui.github.io/theme-preview/#/)
2. Put theme packages in src/assets/theme/
3. Edit src/main.js 
``` bash
   import 'element-ui/lib/theme-default/index.css'
   to
   import './assets/theme/your-theme/index.css'
```
4. Edit src/styles/vars.scss

![theme-blue](https://raw.githubusercontent.com/taylorchen709/markdown-images/master/vueadmin/rec-demo.gif)
![theme-green](https://raw.githubusercontent.com/taylorchen709/markdown-images/master/vueadmin/theme-green.png)

# Browser support

Modern browsers and IE 10+.

# License
[MIT](http://opensource.org/licenses/MIT)


# G:\最新配置化看板项目\svn控制版本 目录下运行控制台运行npm run dev，启动前端主程序
# G:\最新配置化看板项目\svn控制版本\nodejs_data 目录下控制台运行 node ./connect.js 运行数据服务
# 数据存储过程遇到的问题：有连接池释放链接操作，但是没有真正释放掉，多个连接在sleep状态，导致服务器延迟很高
# 预览：1.路由跳转，不能跳转新界面，原界面时间保留，存在问题
        2.文本上传服务器，从服务器加载数据预览
## 关于页面内容变化保存数据库问题：
    1、保存按钮：监控data是否有变化，显示出绿色与灰色，提示保存，防止恶意频繁提交
    2.定时保存功能，可调节，用户自主选择自动提交频次。默认五分钟，data无变化则不执行
    3.页面失去焦点或切出该页面跳对话框提示用户保存（/自动保存）
    4.网络问题：网络延迟，网络中断，网络切换等问题
    5.用户操作：保存时关闭页面，清理缓存等
    6.并发控制
## 关于queryString(),encodeUrl与decodeUrl的坑
    1、queryString解析 "%;"时会发生错乱，%==>encodeUrl==>%25 , ;==>%3B
    2、二者共同解析会导致；解析不出来，还会导致中文乱码
    3、只需要把%%3B替换成%25%3B就能正常解析。
## 对于element-ui 提供的组件，因为是自定义标签，所以生成出来的源代码不能直接作为html代码传输并被编译，导致的直接后果就是动效丧失。因为依赖js库无法控制已被编译解析过的标签。

### 这个坑目前的想法有两个：
    1，标识，解析html的时候进行识别处理，重新加入一个新的组件，传递属性和样式；
    2、避开element-ui组件，选择网上开源的带js库的原生或者vue组件;
    3、回到原点，选择从数据库加载组件并重新渲染的方式。
    首先准备尝试下2，按复杂度排序应该是2-3-1.

### 关于从数据库请求加载（样式）数据绑定在组件上，这个组件又在mounted里面进行样式修改，会形成矛盾。
    如果无法直接加载过来的数据作为绑定属性曲渲染界面，不妨通过中间数据字段来传递一下。即绑定中间数据，将加载过来的数据传递给中间数据字段。

### 针对nodejs异步执行导致的顺序问题解决方案
    async+await
    promise+then