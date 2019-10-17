<template>
    <div id="photoinstall">
        <button @click="openAlert">开启相机及其麦克风设备</button>
    </div>
</template>
<script>
export default {
    methods: {
        openAlert(){
            this.$messagebox("","执行成功");
            this.$router.push("/Camera");
        },
    },
}
</script>

<style>
    #photoinstall{
        text-align: center;
        margin-top:200px;
    }
</style>