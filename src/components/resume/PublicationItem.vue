<script setup>

import Title from "@/components/resume/Title.vue";

defineProps({
  name: {
    type: String,
    required: true
  },
  url: {
    type: String,
    required: false
  },
  publisher: {
    type: String,
    required: true
  },
  releaseDate: {
    type: String,
    required: true
  },
  summary: {
    type: String,
    required: false
  }
})
</script>

<template>
  <div class="item">
    <div class="header">
      <Title :text="name" :url="url"/>
      <span class="separator" v-if="name && publisher">/</span>
      <!--      Done for consistency so themes don't break if reordering elements like Harvard theme -->
      <span class="location"></span>
      <span class="name details">{{ publisher }}</span>
      <span class="time details">{{ releaseDate }}</span>
    </div>
    <div class="description">
      <p class="summary" v-if="summary">{{ summary }}</p>
    </div>
  </div>
</template>

<style scoped lang="sass">
.name
  text-transform: unset !important
</style>