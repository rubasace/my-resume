<template>
  <div class="item">
    <div class="header">
      <span class="title place">{{ title }}</span>
      <span class="separator" v-if="awarder"> - </span>
      <span class="awarder details" v-if="awarder">{{ awarder }}</span>
      <span class="time details">
        <span>{{ String(date) }}</span>
      </span>
    </div>
<!--    <div class="description" v-if="summary">-->
<!--      <p>{{ summary }}</p>-->
<!--    </div>-->
  </div>
</template>
<script setup>

defineProps({
  title: {
    type: String,
    required: true
  },
  awarder: {
    type: String,
    required: true
  },
  date: {
    type: [String, Number],
    required: true
  },
  summary: {
    type: String,
    required: false
  }
})
</script>