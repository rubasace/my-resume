<script setup>

import Title from "@/components/resume/Title.vue";

defineProps({
  school: {
    type: String,
    required: true
  },
  name: {
    type: String,
    required: true
  },
  startDate: {
    type: [String, Number],
    required: true
  },
  endDate: {
    type: [String, Number],
    required: false
  },
  url: {
    type: String,
    required: false
  },
  description: {
    type: String,
    required: false
  }
})
</script>

<template>
  <div class="item">
    <div class="header">
      <Title :text="school" :url="url" />
      <span class="separator">/</span>
      <span class="name details">{{ name }}</span>
      <span class="time details">
        <span>{{ String(startDate) }}</span>
        <span v-if="endDate"> - {{ String(endDate) }}</span>
      </span>
    </div>
    <div class="description" v-if="description">
      <p>{{ description }}</p>
    </div>
  </div>
</template>