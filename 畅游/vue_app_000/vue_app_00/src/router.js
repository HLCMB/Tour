// 引入文件
import Vue from 'vue'
import Router from 'vue-router'
import HelloContainer from "./components/HelloWorld.vue"

// // 贾 
import Cy from "./components/ch/Home.vue"//项目主页面
import Photo from "./components/ch/common/First-home/Photo.vue"//开启相机功能页面
import PhoneInstall from "./components/ch/common/First-home/PhotoInstall.vue"//开启相机功能
import Tv from "./components/ch/common/First-home/Tv.vue"//IGTV视频页面
import AddTv from "./components/ch/common/First-home/AddTv.vue" //添加视频及照片页面
import Search from "./components/ch/common/First-home/Search.vue"//搜索用户视频界面
import AddTv1 from "./components/ch/common/First-home/AddTv-1.vue"//开启相册功能页面
import Camera from "./components/ch/common/First-home/Camera.vue"//开启相机功能
import SuggestListAllMsg from "./components/ch/common/First-home/SuggestListAllMsg.vue"//推荐网友列表主页面
import ChatFunction from "./components/ch/common/First-home/ChatFunction.vue"//查找好友聊天页面
import ChatFunction2 from "./components/ch/common/First-home/ChatFunction-2.vue"//查找好友聊天页面
import ChatFunction4 from "./components/ch/common/First-home/ChatFunction-4.vue"//好友聊天页面1
import ChatFunction5 from "./components/ch/common/First-home/ChatFunction-5.vue"//好友聊天页面2
import PersonInformation from "./components/ch/common/First-home/PersonInformation"//个人信息页面
import TvVideo1 from './components/ch/common/First-home/TvVideo-1'//个人信息页面
import TvVideo2 from './components/ch/common/First-home/TvVideo-2'//个人信息页面


// 淘
import Follow from "./components/ch/common/Follow/Follow.vue"//关注页




// // 李
// // 引入Home.vue
import home from "./components/ch/Home.vue"
// // 引入搜索页面组件
import searchhome from "./components/ch/common/second-search/SearchHome.vue"
import search from "./components/ch/common/second-search/Search.vue"
// 引入查找用户组件
import findfiend from "./components/ch/common/second-search/FindFiend.vue"
// 引入热门搜索组件
import hotsearch from "./components/ch/common/second-search/SearchList.vue"
// 引入注册组件
import regist from "./components/ch/common/second-search/Regist.vue"
// 引入登录组件
import login from "./components/ch/common/second-search/Login.vue"
import houseandhome from "./components/ch/common/second-search/HouseAndHome.vue"
import build from "./components/ch/common/second-search/Build.vue"
import food from "./components/ch/common/second-search/Food.vue"
import tour from "./components/ch/common/second-search/Tour.vue"
import account from "./components/ch/common/second-search/Account.vue"
import label from "./components/ch/common/second-search/Label.vue"
import place from "./components/ch/common/second-search/Place.vue"
import aroundsite from "./components/ch/common/second-search/AroundSite.vue"
import theuser from "./components/ch/common/The-user/Theuser.vue"
// 用户图片详情
import userdetailes from "./components/ch/common/second-search/UserDetailes.vue"
// 用户组件
import user from "./components/ch/common/second-search/User.vue"

import Editpage from "./components/ch/common/The-user/Editpage.vue"








Vue.use(Router)
export default new Router({
  routes: [
    // //贾
    {path:'/',component:HelloContainer},//vue页面
    {path:'/Cy',component:Cy},//主页面
    {path:'/Photo',component:Photo},//访问手机相机页面
    {path:"/PhoneInstall",component:PhoneInstall},//相机权限页面
    {path:"/Tv",component:Tv},//TV视频页面
    {path:"/AddTv",component:AddTv},//上传视频相册页面
    {path:"/AddTv-1",component:AddTv1},//访问手机内视频的权限
    {path:"/Search",component:Search},//搜索用户视频界面
    {path:"/Camera",component:Camera},//开启照相直播页面
    {path:"/SuggestListAllMsg",component:SuggestListAllMsg},
    {path:"/ChatFunction",component:ChatFunction},//查找好友聊天页面1
    {path:"/ChatFunction2",component:ChatFunction2},//查找好友聊天页面2
    {path:"/ChatFunction5",component:ChatFunction5},//好友聊天页面1
    {path:"/ChatFunction4/:uid",component:ChatFunction4},//好友聊天页面2
    {path:"/PersonInformation/:uid",component:PersonInformation},//个人信息页面
    {path:"/TvVideo1/:uid",component:TvVideo1},//个人信息页面
    {path:"/TvVideo2/:did",component:TvVideo2},//个人发布视频页面


    // // 李
    {path:'/home',component:home},
    {path:'/searchhome',component:searchhome},
    {path:'/findfiend/:num',component:findfiend,props:true},
    {path:'/shop',component:search},
    {path:'/hotsearch',component:hotsearch},
    {path:'/regist',component:regist},
    {path:'/login',component:login},
    {path:'/houseandhome',component:houseandhome},
    {path:'/build',component:build},
    {path:'/food',component:food},
    {path:'/tour',component:tour},
    {path:'/account',component:account},
    {path:'/label',component:label},
    {path:'/place',component:place},
    {path:'/aroundsite',component:aroundsite},
    {path:'/userdetailes/:i/:umid/:uid',component:userdetailes,props:true},
    {path:'/userdetailes/:i/:umid/user/:did/:j',component:user,props:true},
    // {path:"/details/:lid",component:Details,props:true},
    // // 陶
    {path:"/follow",component:Follow},
    {path:"/theuser",component:theuser},
    {path:'/editpage',component:Editpage}
  ]
})
