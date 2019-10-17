import Vue from 'vue'
import App from './App.vue'
import router from './router'



// 引入mintUI-ui组件库
import MintUI from "mint-ui"
// 引入mint-ui组件库样式文件
import "mint-ui/lib/style.css"
// 将mint-ui注册vue示例中
Vue.use(MintUI)
// 引入axios第三方ajax模块
import axios from "axios"
// 配置axios基础路径
axios.defaults.baseURL="http://127.0.0.1:3000"
// 配置axios保存seesion信息
axios.defaults.withCredentials=true
// 将axios注册vue示例中
Vue.prototype.axios=axios;




Vue.config.productionTip = false


new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
