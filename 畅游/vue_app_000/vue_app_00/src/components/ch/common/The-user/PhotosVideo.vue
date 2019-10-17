<template>
  <div>
    <div class="home">
    <div class="icon"><img style="margin-top:20px" src="../../../../assets/照片.png" alt=""></div>
    <p style="font-size:32px">有你的照片和视频</p>
    <p style="color:#ccc">标记你的照片和视频将显示在这里。</p>
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