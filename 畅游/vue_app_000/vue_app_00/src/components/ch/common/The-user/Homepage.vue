<template>
  <div>
    <div class="home">
    <div class="icon"><img style="margin-top:20px" src="../../../../assets/个人主页.png" alt=""></div>
    <p style="font-size:32px">个人主页</p>
    <p style="color:#ccc">分享的照片和视频将显示在你的个人主页中。</p>
    <a href="javacript:;">快来分享照片或视频吧！</a>
  </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      
    }
  },
  methods: {
    
  },
}
</script>
<style scoped>
  .icon{
    width:100px;height:100px;
    border:2px solid #000;
    border-radius:50%;
    text-align: center;
  }
  .home{
    height:580px;
    display:flex;
    margin-top:30px;
    flex-direction:column;
    align-items: center;
  }
</style>