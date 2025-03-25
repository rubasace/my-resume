<script setup>

defineProps({
  name: {
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
      <span class="publication title" v-if="name">
        <span>{{ name }}</span>
      </span>
      <span class="separator" v-if="name && publisher">/</span>
      <span class="location details" v-if="publisher">{{ publisher }}</span>
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