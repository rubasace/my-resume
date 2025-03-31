
<script setup>

import Title from "@/components/resume/Title.vue";

defineProps({
  title: {
    type: String,
    required: true
  },
  awarder: {
    type: String,
    required: false
  },
  date: {
    type: [String, Number],
    required: false
  },
  url: {
    type: String,
    required: false
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
      <Title :text="title" :url="url" />
      <div class="separator" v-if="awarder"> - </div>
      <div class="awarder details" v-if="awarder">{{ awarder }}</div>
      <div class="time details">
        <span>{{ String(date) }}</span>
      </div>
    </div>
<!--    <div class="description" v-if="summary">-->
<!--      <p>{{ summary }}</p>-->
<!--    </div>-->
  </div>
</template>