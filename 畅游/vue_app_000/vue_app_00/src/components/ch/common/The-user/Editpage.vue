<template>
  <div>
    <div class="head">
      <div class="div1"><i @click="fanhui"><img src="../../../../assets/关闭.png" alt=""></i> <p>编辑主页</p></div> 
      <div>
      <i><img  src="../../../../assets/勾.png" alt=""></i>
      </div>
    </div>
    <div class="userImg">
      <img :src="'http://127.0.0.1:3000/'+list.uheadurl" alt="">
      <button class="btnImg">更换头像</button>
    </div>
    <div class="Input">
        <i>姓名</i>
        <input type="text" placeholder="姓名" :value="list.nickname">
        <i>账号</i>
        <input type="password" placeholder="账号" :value="list.uname">
        <i>网站</i>
        <input type="text" placeholder="网站" value="">
        <i>个人简介</i>
        <input type="text" placeholder="个人简介" :value="list.qianming">
        <p style="margin:20px 0;">私人信息</p>
        <i>邮箱</i>
        <input type="text" placeholder="邮箱" :value="list.uemail">
        <i>电话号码</i>
        <input type="text" placeholder="电话号码" :value="list.uphone">
        <i>性别</i>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      list:[]
    }
  },  
  methods: {
    fanhui(){
      this.$router.push("/theuser");
    },
    loadMore(){
      //请求登录用户的信息
      var url="theuser";
      //发送ajax请求获取数据
      this.axios(url).then(result=>{
        this.list=result.data.data[0][0];
        console.log(result.data.data[0][0]);
      })
    }
  },
  created() {
    this.loadMore();
  },
}
</script>
<style scoped>
p{
  margin:0;
}
  .head{
    width:100%;
    display:flex;
    justify-content: space-between;
    padding:10px 0px;
    border-bottom:1px solid #ccc;
    box-sizing: border-box;
    box-shadow:0px 0px 10px  #e8e3e3;
  }
  .div1{
    width:30%;
    display:flex;
    justify-content: space-between;
    font-weight:bold;
  }
  .head>div>i>img{
    width: 24px;
    height:24px;
  }
  .userImg{
    display:flex;
    flex-direction: column;
    align-items: center;
  }
  .userImg>img{
    margin-top:20px;
    width:100px;height:100px;
    border-radius:50%;
    overflow: hidden;
    border:1px solid #ccc;
  }
  .btnImg{
    margin:15px 0;
    border: none;
    background-color:transparent;
    outline:none;
    color:#7EC0EE;
    font-size:20px;
  }
  .Input{
    display:flex;
    flex-direction: column;
  }
  .Input>input{
    border:none;
    border-bottom:1px solid #ccc;
    padding:5px 0;
    outline: none;
  }
  .Input>i{
    font-size:12px;
    color:#aaa;
  }
</style>