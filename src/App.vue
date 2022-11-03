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
    this.$i18n.locale = this.data.language
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
  .page
    *
      padding-top: 0.75in
      padding-bottom: 0.75in
      padding-left: 0.75in
      padding-right: 0.6in
      box-sizing: border-box



</style>