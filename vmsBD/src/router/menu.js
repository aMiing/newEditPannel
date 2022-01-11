import panelList from "@/views/pannelList.vue";
import Form from '@/views/nav1/Form.vue'
import User from '@/views/nav1/user.vue'
import Echarts from '@/views/charts/echarts.vue'

export const menuList = [
    {
        path: "/home",
        component: panelList,
        name: "我的可視化",
        iconCls: "fa fa-bar-chart",
    },
    {
        path: "/data",
        component: Form,
        name: "我的数据",
        iconCls: "fa fa-database",
    },
    {
        path: "/components",
        component: User,
        name: "我的组件库",
        iconCls: "fa fa-address-card",
    },
    {
        path: "/examples",
        component: Echarts,
        name: "优秀案例教程",
        iconCls: "fa fa-book",
    },
];
