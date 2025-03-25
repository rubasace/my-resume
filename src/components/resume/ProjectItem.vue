<script setup>
defineProps({
  name: {
    type: String,
    required: false
  },
  startDate: {
    type: String,
    required: true
  },
  endDate: {
    type: String,
    required: true
  },
  description: {
    type: String,
    required: false
  },
  highlights: {
    type: Array,
    required: false
  }
})
</script>
<template>
  <div class="item">
    <div class="header">
      <span class="title" v-if="name">{{ name }}</span>
      <span class="time details">
        <span>{{ startDate }}</span>
        <span v-if="endDate"> - {{ endDate }}</span>
      </span>
    </div>
    <div class="description">
      <p class="description" v-if="description">{{ description }}</p>
      <ul class="item-list" v-if="highlights">
        <li class="highlight" v-for="highlight in highlights">{{ highlight }}</li>
      </ul>
    </div>
  </div>
</template>
