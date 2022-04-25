<script setup>
import MainSection from "./components/MainSection.vue";
import SideSection from "./components/SideSection.vue";

</script>
<script>
import yaml from "js-yaml";
import content from '../data.yaml?raw';

export default {
  data() {
    return { data: yaml.load(content) };
  },
  created() {
    console.log(this.a) // 1
    console.log(this.$data) // { a: 1 }
  }
}
</script>
<template lang="pug">
.wrapper
  .page.background
    MainSection(:data="data").main

</template>

<style scoped lang="sass">

.wrapper
  position: relative
  top: 0
  bottom: 0
  overflow: hidden
  background-color: slategray
  .page
    //size: A4 portrait
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