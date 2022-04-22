<script setup>
import SkillItem from "./SkillItem.vue";

defineProps({

    }
)
</script>
<template lang="pug">
aside.side-data
  .section
    p.section-title Technical Skills
    .section-content
      SkillItem(name="Spring Boot")
</template>

<style scoped lang="sass">
.side-data
  width: 100%
  height: 100%
  position: relative
  background-color: lightgrey
  padding-left: 0.375in!important
  &::after
    display: none
    content: ""
    background-color: slategray
    position: absolute
    left: 0
    top: 15%
    height: 80%
    width: 0.06cm
    border-right: 3em

  .section
    width: 100%
    position: relative
    margin-top: 1rem

    .section-title
      font-size: 1em
      text-transform: uppercase
      margin-bottom: 0.5rem
      font-weight: bold
</style>