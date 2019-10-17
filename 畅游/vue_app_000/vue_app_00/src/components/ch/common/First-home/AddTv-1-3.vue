<template>
    <div id="addtv-1-3">
        <!-- 展示所有的照片 -->
        <div id="addtv-1-3-photos">
            
        </div>
        <div id="addtv-1-3-photos">
            
        </div>
        <div id="addtv-1-3-photos">
            
        </div>
        <div id="addtv-1-3-photos">
            
        </div>
        <div id="addtv-1-3-photos">
            
        </div>
        <div id="addtv-1-3-photos">
            
        </div>
        <div id="addtv-1-3-photos">
            
        </div>
    </div>
</template>

<script>
export default {
    
}
</script>

<style>
    #addtv-1-3{
        display: flex;/*弹性布局*/
        flex: row;/*主轴方向*/
        /* justify-content: space-around;两端对齐，两端有空白 */
        flex-wrap: wrap;/*空间不够就换行，项目不缩小*/
    }
    #addtv-1-3-photos{
        margin-top:3px;
        margin-left:3px;
        width:32%;
        height:200px;
        background: #000;
    }
</style>