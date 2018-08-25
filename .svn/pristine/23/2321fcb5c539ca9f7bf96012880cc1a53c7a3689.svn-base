import Login from './views/Login.vue'
import NotFound from './views/404.vue'
import Home from './views/Home.vue'
import EditScreen from './views/editScreen.vue'
import previewScreen from './views/previewScreen.vue'
import pannelList from './views/myViews/pannelList.vue'
import Form from './views/nav1/Form.vue'
import user from './views/nav1/user.vue'
import echarts from './views/charts/echarts.vue'

let routes = [
    {
        path: '/edit',
        component: EditScreen,
        name: '看板制作',
        hidden: true,
       /* children: [{ path: '/',component: Components, name: '配置项'}]*/
    },
    {
        path: '/login',
        component: Login,
        name: '',
        hidden: true
    },
    {
        path: '/404',
        component: NotFound,
        name: '',
        hidden: true
    },
    {
        path: '/previewScreen',
        component: previewScreen,
        name: '',
        hidden: true
    },
    {
        path: '/',
        component: Home,
        name: '',
        iconCls: 'fa fa-bar-chart',
        leaf: true,//只有一个节点
        children: [{ path: '/',component: pannelList, name: '我的可視化'}]
    },
    {
        path: '/',
        component: Home,
        name: '我的数据',
        iconCls: 'fa fa-database',
        leaf: true,//只有一个节点
        children: [
            { path: '/form', component: Form, name: '我的数据' },
           /* { path: '/page5', component: Page5, name: '页面5' }*/
        ]
    },
    {
        path: '/',
        component: Home,
        name: '',
        iconCls: 'fa fa-address-card',
        leaf: true,//只有一个节点
        children: [
            { path: '/user', component: user, name: '我的组件库' }
        ]
    },
    {
        path: '/',
        component: Home,
        iconCls: 'fa fa-book',
        leaf: true,//只有一个节点
        children: [
            { path: '/learning', component: echarts, name: '优秀案例教程' } 
        ]
    }
  
];

export default routes;