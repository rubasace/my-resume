<script setup>
import MainSection from "./components/MainSection.vue";
import SideSection from "./components/SideSection.vue";
</script>
<template lang="pug">
.wrapper
  .page.background
    MainSection.main

</template>

<style scoped lang="sass">

.wrapper
  position: relative
  top: 0
  bottom: 0
  overflow: hidden
  background-color: slategray
  .page
    height: 297mm
    width: 210mm
    margin: 10mm auto
    border-radius: 2mm
    position: relative
    display: flex
    box-sizing: border-box
    overflow: hidden
    *
      padding: 0.75in 0.75in
      box-sizing: border-box
    .main
      flex: 1
      //width: 80%
      height: 100%
      position: relative


</style>