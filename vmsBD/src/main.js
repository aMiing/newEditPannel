import Vue from 'vue'
import App from './App'
import VCharts from 'v-charts'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css';
//import './assets/theme/theme-green/index.css'
import VueRouter from 'vue-router'
import store from './vuex/store'
import routes from '@/router'
import Mock from './mock'
Mock.bootstrap();
import 'font-awesome/css/font-awesome.min.css'

import  VueResource  from 'vue-resource'

Vue.use(VueResource) 
Vue.use(ElementUI, { size: 'small', zIndex: 3000 });
Vue.use(VueRouter)
Vue.use(VCharts)

//NProgress.configure({ showSpinner: false });

const router = new VueRouter({
  routes
})

// router.beforeEach((to, from, next) => {
  //NProgress.start();
  // if (to.path == '/login') {
  //   sessionStorage.removeItem('user');
  // }
  // let user = JSON.parse(sessionStorage.getItem('user'));
  // if (!user && to.path != '/login') {
  //   next({ path: '/login' })
  // } else {
    // next()
  // }
// })

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app');


