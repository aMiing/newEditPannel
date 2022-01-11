import Login from './views/Login.vue'
import NotFound from './views/404.vue'
import Home from './views/Home.vue'
import EditScreen from './views/edit'
import previewScreen from './views/previewScreen.vue'

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
    
  
];

export default routes;