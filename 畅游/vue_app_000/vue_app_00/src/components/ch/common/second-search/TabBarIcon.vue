<!--TabBarIcon.vue-->
<template>
  <!-- 底部导航栏子组件 -->
  <div>
   <img :src="focused?selectedImage:normalImage" alt="" class="imgstyle"/>
  </div>
</template>

<script>
export default {

  // 接收父组件数据
//   props:{
//     focused:false,
//     selectedImage:{default:""},
//     normalImage:{default:""}
// =======
  props:{//接收父组件数据
    focused:false,//focused 默认false
    selectedImage:{default:""},//selectedImage 默认空字符串
    normalImage:{default:""}//normalImage 默认空字符串

  }
}
</script>
<style scoped>
  /* 图片样式 */
  .imgstyle{
    width:30px;
    height:30px;
  }
</style>