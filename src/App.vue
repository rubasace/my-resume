<script setup>
import MainPage from "@/components/MainPage.vue";
import {Toast} from "primevue";
</script>
<template>
  <MainPage/>
  <Toast position="bottom-right"/>
</template>

<style scoped lang="sass">
.editor
  width: 50%

.view
  width: 50%

  ::v-deep(.page)
    transform: scale(0.75)
    transform-origin: top left
</style>