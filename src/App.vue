<script setup>
import MainSection from "./components/MainSection.vue";

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




</style>