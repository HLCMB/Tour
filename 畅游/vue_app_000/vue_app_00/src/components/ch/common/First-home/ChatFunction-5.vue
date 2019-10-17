<template>
    <div id="chatfunction5">
        <img @click="quitchatfunction5" :src="quitchatfunctionicon" />
    </div>
</template>

<script>
export default {
    props:{
        quitchatfunctionicon:{default:""},
        quitchatfunction5:{type:Function},
    }
}
</script>

<style>
   
</style>