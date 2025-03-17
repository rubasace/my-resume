<script setup>
import MainPage from "@/components/MainPage.vue";
</script>
<template>
  <MainPage/>
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