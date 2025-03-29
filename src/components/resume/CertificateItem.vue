<script setup>

import Title from "@/components/resume/Title.vue";

defineProps({
  issuer: {
    type: String,
    required: false
  },
  name: {
    type: String,
    required: true
  },
  date: {
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
      <Title :text="name" :url="url" />
      <span class="separator">/</span>
      <span class="issuer details">{{ issuer }}</span>
      <span class="time details" v-if="date">
        <span>{{ String(date) }}</span>
      </span>
    </div>
    <div class="description" v-if="description">
      <p>{{ description }}</p>
    </div>
  </div>
</template>