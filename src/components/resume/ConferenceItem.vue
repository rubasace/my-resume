<script setup>

import Title from "@/components/resume/Title.vue";

defineProps({
  title: {
    type: String,
    required: true
  },
  url: {
    type: String,
    required: false
  },
  conference: {
    type: String,
    required: false
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
      <Title :text="title" :url="url" />
      <span class="separator" v-if="conference">/</span>
      <span class="conference name details" v-if="conference">{{ conference }}</span>
      <span class="separator details" v-if="(conference || title )&&location">|</span>
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