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
      <div class="title">{{ name }}</div>
      <div class="separator">/</div>
      <div class="details name school">
        <a :href="url" target="_blank" :title="school" v-if="url">{{ school }}</a>
        <span v-else>{{ school }}</span>
      </div>
      <div class="time details">
        <span>{{ String(startDate) }}</span>
        <span v-if="endDate"> - {{ String(endDate) }}</span>
      </div>
    </div>
    <div class="description" v-if="description">
      <p>{{ description }}</p>
    </div>
  </div>
</template>