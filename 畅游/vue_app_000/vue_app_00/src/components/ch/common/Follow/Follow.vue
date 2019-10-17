<template>
  <div class="container">
    <div class="title">
      <div @click="gz" class="div active">
        <p>已关注</p>
      </div>
      <div @click="you" class="div">
        <p>你</p>
      </div>
    </div>
    <div id="user">
        <div class="content">
           <div class="gz">
            <img src="../../../../assets/关注.png" alt="">
          </div>
          <div style="text-align:center">
            <p style="font-size:30px" class="gz2">关注用户的动态</p>
            <p style="color:#ccc">关注用户赞或评论他人帖子时,将在这里显示。</p>
            <a class="myfont" style="text-decoration:none;" href="javascript;">查找用户并关注</a>
          </div>
        </div>
    </div>
    <div id="you">
      <p>今天</p>
      <div class="today">
        <div class="touxiang">
          <img width="50px" height="50px" src="../../../../assets/ic_contacts_normal.png" alt="">
        </div>
        <div>
          <p>michelleobama 开始关注你了哦</p>
          <p>时间</p>
        </div>
        <button class="btn">关注</button>
      </div>
      <p>为你推荐</p>
      <div class="today">
        <div class="touxiang">
          <img width="50px" height="50px" src="../../../../assets/ic_contacts_normal.png" alt="">
        </div>
        <div>
          <p>michelleobama</p>
          <p>Michelle Obama</p>
          <p>热门</p>
        </div>
        <div>
          <button class="btn">关注</button><a style="margin-left:20px" href="javascript;">X</a>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
name:"Follow";
export default {
  data() {
    return {
      
    }
  },
  methods: {
    gz(){
      var div=document.getElementsByClassName("div");
      var user=document.getElementById("user");
      var you=document.getElementById("you");
      if(user.style="display:block"){
        div[0].className="div active";
        you.style="display:none";
        div[1].className="div";
      }else{
        div[0].className="div";
      }
      
      
    },
    you(){
      var div=document.getElementsByClassName("div");
      var user=document.getElementById("user");
      var you=document.getElementById("you");
      if(you.style="display:none"){
        div[1].className="div active";
        you.style="display:block";
        user.style="display:none";
        div[0].className="div";
      }
    }
  },
}
</script>
<style scoped>
  p{
   margin:0; 
  }
  .title{
    display: flex;
  }

  .div{
    width: 50%;
    text-align: center;
    border-bottom: 1px solid #ccc;
    cursor: pointer;
    padding:18px 0;
  }
  .active{
    border-bottom: 1px solid #000 !important;
  }
  #you{
    display: none;
  }
  #user{
   margin-top:25%;
  }
  .content{
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    align-items: center;
  }
   .gz{
     width:100px;height: 100px;
     border: 1px solid #000;
     border-radius: 50%;
     display: flex;
     justify-content: center;
     align-items: center;
   }
  .today{
    width:100%;height:80px;
    display: flex;
    justify-content:space-around;
    align-items: center;
  }
  .btn{
    background: #2E9AFE;
    padding:0;
    width:80px;height: 40px;
    border-radius:5px;
    outline: none;
    border: none;
    cursor: pointer;
    color:#fff;
    font-size:18px;
  }
  .touxiang{
    width:50px;;height:50px;
    border-radius:50%;
    overflow: hidden;
    border: 1px solid #ccc;
  }
</style>