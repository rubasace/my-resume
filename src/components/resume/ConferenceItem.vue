<script setup>

defineProps({
  name: {
    type: String,
    required: false
  },
  conference: {
    type: String,
    required: true
  },
  location: {
    type: String,
    required: true
  },
  time: {
    type: String,
    required: true
  },
  summary: {
    type: String,
    required: false
  },
  items: {
    type: Array,
    required: false
  }
})
</script>

<template>
  <div class="item">
    <div class="header">
      <span class="conference title" v-if="conference">
        <span>{{ conference }}</span>
        <span class="separator">/</span>
      </span>
      <span class="conference name details" v-if="name">{{ name }}</span>
      <span class="separator details" v-if="name">|</span>
      <span class="location details" v-if="location">{{ location }}</span>
      <span class="time details">{{ time }}</span>
    </div>
    <div class="description">
      <p class="summary" v-if="summary">{{ summary }}</p>
      <ul class="item-list" v-if="items">
        <li class="item" v-for="item in items" :key="item">{{ item }}</li>
      </ul>
    </div>
  </div>
</template>

<style scoped lang="sass">
.name
  text-transform: unset !important
</style>